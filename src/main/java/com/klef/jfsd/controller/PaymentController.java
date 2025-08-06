package com.klef.jfsd.controller;

import com.paypal.api.payments.*;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

@Controller
public class PaymentController {

    @Autowired
    private APIContext apiContext;

    // Show payment home with options
    @GetMapping("/paymentHome")
    public ModelAndView paymentHome() {
        return new ModelAndView("paymentHome");
    }

    // ------------------------
    // PAYPAL PAYMENT HANDLING
    // ------------------------

    @PostMapping("/create-payment")
    public ModelAndView createPayment(@RequestParam("amount") String amount, HttpServletRequest request) {
        String cancelUrl = request.getScheme() + "://" + request.getServerName() + ":" +
                request.getServerPort() + "/paymentCancel";
        String successUrl = request.getScheme() + "://" + request.getServerName() + ":" +
                request.getServerPort() + "/paymentSuccess";

        Amount amt = new Amount();
        amt.setCurrency("USD");
        amt.setTotal(amount);

        Transaction transaction = new Transaction();
        transaction.setDescription("Hotel/Vehicle Booking Payment");
        transaction.setAmount(amt);

        List<Transaction> transactions = new ArrayList<>();
        transactions.add(transaction);

        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");

        Payment payment = new Payment();
        payment.setIntent("sale");
        payment.setPayer(payer);
        payment.setTransactions(transactions);

        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl(cancelUrl);
        redirectUrls.setReturnUrl(successUrl);
        payment.setRedirectUrls(redirectUrls);

        try {
            Payment createdPayment = payment.create(apiContext);
            for (Links link : createdPayment.getLinks()) {
                if (link.getRel().equals("approval_url")) {
                    return new ModelAndView("redirect:" + link.getHref());
                }
            }
        } catch (PayPalRESTException e) {
            ModelAndView mv = new ModelAndView("paymentError");
            mv.addObject("errorMessage", e.getMessage());
            return mv;
        }

        ModelAndView mv = new ModelAndView("paymentError");
        mv.addObject("errorMessage", "Unknown error occurred");
        return mv;
    }

    @GetMapping("/paymentSuccess")
    public ModelAndView paymentSuccess(@RequestParam("paymentId") String paymentId,
                                       @RequestParam("PayerID") String payerId) {
        Payment payment = new Payment();
        payment.setId(paymentId);

        PaymentExecution paymentExecution = new PaymentExecution();
        paymentExecution.setPayerId(payerId);

        try {
            Payment executedPayment = payment.execute(apiContext, paymentExecution);
            PayerInfo payerInfo = executedPayment.getPayer().getPayerInfo();

            Map<String, String> paymentDetails = new HashMap<>();
            paymentDetails.put("transactionId", executedPayment.getId());
            paymentDetails.put("payerName", payerInfo.getFirstName() + " " + payerInfo.getLastName());
            paymentDetails.put("amount", executedPayment.getTransactions().get(0).getAmount().getTotal());

            ModelAndView mv = new ModelAndView("paymentSuccess");
            mv.addObject("paymentDetails", paymentDetails);
            return mv;

        } catch (PayPalRESTException e) {
            ModelAndView mv = new ModelAndView("paymentError");
            mv.addObject("errorMessage", e.getMessage());
            return mv;
        }
    }

    @GetMapping("/paymentCancel")
    public ModelAndView paymentCancel() {
        return new ModelAndView("paymentCancel");
    }

    // ------------------------
    // UPI PAYMENT HANDLING
    // ------------------------

    // Show UPI payment form
    @GetMapping("/upiPaymentHome")
    public ModelAndView upiPaymentHome() {
        return new ModelAndView("upiPaymentHome");
    }

    // Create UPI payment (for demonstration, we generate a dummy UPI QR URL)
    @PostMapping("/create-upi-payment")
    public ModelAndView createUpiPayment(@RequestParam("amount") String amount) {
        // In a real app, you would integrate with Razorpay or another UPI gateway here.
        // For demonstration, we'll just pass a dummy QR code URL.
        String dummyUpiQrUrl = "https://via.placeholder.com/300x300.png?text=UPI+QR+Code";

        ModelAndView mv = new ModelAndView("upiPayment");
        mv.addObject("amount", amount);
        mv.addObject("upiQrUrl", dummyUpiQrUrl);
        return mv;
    }

    // UPI payment success (simulate)
    @GetMapping("/upiPaymentSuccess")
    public ModelAndView upiPaymentSuccess(@RequestParam("transactionId") String transactionId) {
        Map<String, String> paymentDetails = new HashMap<>();
        paymentDetails.put("transactionId", transactionId);
        paymentDetails.put("status", "SUCCESS");

        ModelAndView mv = new ModelAndView("upiPaymentSuccess");
        mv.addObject("paymentDetails", paymentDetails);
        return mv;
    }

    // UPI payment cancel
    @GetMapping("/upiPaymentCancel")
    public ModelAndView upiPaymentCancel() {
        return new ModelAndView("upiPaymentCancel");
    }
}
