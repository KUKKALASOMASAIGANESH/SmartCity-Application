package com.klef.jfsd.config;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet("/generateQRCode")
public class UpiQrCodeServlet extends HttpServlet {

    private static final String UPI_ID = "merchant@upi";
    private static final String PAYEE_NAME = "HotelName";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String amount = request.getParameter("amount");
        if (amount == null || amount.isEmpty()) {
            amount = "1"; // fallback default
        }

        String upiUri = String.format(
                "upi://pay?pa=%s&pn=%s&am=%s&cu=INR&tn=Hotel Booking",
                UPI_ID,
                PAYEE_NAME,
                amount
        );

        try {
            BitMatrix matrix = new MultiFormatWriter().encode(
                    upiUri,
                    BarcodeFormat.QR_CODE,
                    300,
                    300
            );

            response.setContentType("image/png; charset=UTF-8");
            try (OutputStream out = response.getOutputStream()) {
                MatrixToImageWriter.writeToStream(matrix, "PNG", out);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error generating QR code.");
        }
    }
}
