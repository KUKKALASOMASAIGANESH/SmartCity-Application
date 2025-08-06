package com.klef.jfsd.controller;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.model.AboutCity;
import com.klef.jfsd.model.Admin;
import com.klef.jfsd.model.City;
import com.klef.jfsd.model.Company;
import com.klef.jfsd.model.Contactus;
import com.klef.jfsd.model.Customer;
import com.klef.jfsd.model.Education;
import com.klef.jfsd.model.Hospital;
import com.klef.jfsd.model.Hotel;
import com.klef.jfsd.model.HotelBookings;
import com.klef.jfsd.model.Mall;
import com.klef.jfsd.model.RentalBookings;
import com.klef.jfsd.model.Restaurant;
import com.klef.jfsd.model.TouristAttractions;
import com.klef.jfsd.service.AboutCityService;
import com.klef.jfsd.service.AdminService;
import com.klef.jfsd.service.CityService;
import com.klef.jfsd.service.CompanyService;
import com.klef.jfsd.service.ContactService;
import com.klef.jfsd.service.CustomerService;
import com.klef.jfsd.service.EducationService;
import com.klef.jfsd.service.EmailService;
import com.klef.jfsd.service.HospitalService;
import com.klef.jfsd.service.HotelBookingService;
import com.klef.jfsd.service.HotelService;
import com.klef.jfsd.service.MallService;
import com.klef.jfsd.service.RentalBookingService;
import com.klef.jfsd.service.RestaurantService;
import com.klef.jfsd.service.TouristAttractionsService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@Component
public class ClientController {

	@Autowired
	CustomerService customerService;

	@Autowired
	private TouristAttractionsService touristAttractionsService;

	@Autowired
	private CityService cityService;

	@Autowired
	private AdminService adminService;

	@Autowired
	private EducationService educationService;

	@Autowired
	private EmailService emailService;

	@Autowired
	private AboutCityService aboutCityService;

	@Autowired
	private RentalBookingService rentalBookingService;

	@Autowired
	private ContactService contactService;

	@Autowired
	private HotelBookingService bookingService;

	@Autowired
	private MallService mallService;

	@Autowired
	private CompanyService companyService;

	@Autowired
	private RestaurantService restaurantService;

	@Autowired
	private HotelService hotelService;

	@Autowired
	private HospitalService hospitalService;

	@GetMapping("/")
	public ModelAndView demo() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	
	@GetMapping("/scheduleemail")
	@Scheduled(cron = "0 */2 * * * *", zone = "Asia/Kolkata")
	public void scheduleEmail() {
		String msg = "This is an Email Scheduler";
		String recepient = "somasaiganesh.06@gmail.com";
		emailService.sendEmail(recepient, "EMAIL SCHEDULING CONFIRMATION", "EMAIL SCHEDULING IS SUCCESSFULL");
		System.out.println("EMAIL SCHEDULE SUCCESS");
	}
	

	@GetMapping("mainpage")
	public ModelAndView demo1() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}

	@GetMapping("home")
	public ModelAndView homee(
			@RequestParam(name = "city", required = false, defaultValue = "default") String cityName, HttpServletRequest request) {
				
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("cityname", cityName);
		return mv;
	}

	@GetMapping("about")
	public ModelAndView aboutt(
			@RequestParam(name = "city", required = false, defaultValue = "default") String cityName, HttpServletRequest request) {
		
				
		ModelAndView mv = new ModelAndView("about");
		mv.addObject("cityname", cityName);
		AboutCity abc = aboutCityService.viewaboutparticularcity(cityName);
		mv.addObject("abc", abc);
		return mv;
	}

	@GetMapping("touristattractions")
	public ModelAndView touristattractions(
			@RequestParam(name = "city", required = false, defaultValue = "default") String cityName, HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView("touristattractions");
		mv.addObject("cityname", cityName);

		TouristAttractions ta = touristAttractionsService.viewtouristattractionsincity(cityName);
		mv.addObject("ta", ta);

		return mv;
	}

	@GetMapping("busstation")
	public ModelAndView busstation() {
		ModelAndView mv = new ModelAndView("busstation");
		return mv;
	}

	@GetMapping("temples")
	public ModelAndView temples() {
		ModelAndView mv = new ModelAndView("temples");
		return mv;
	}

	@GetMapping("healthservices")
	public ModelAndView healthservicess(
			HttpServletRequest request ,@RequestParam(name = "city", required = false, defaultValue = "default") String cityName) {
		
		ModelAndView mv = new ModelAndView("healthcareservices");
		List<Hospital> list = hospitalService.viewhospitalsincity(cityName);
		//System.out.println(list);
		mv.addObject("hosplist", list);
		System.out.println(list);
		return mv;
	}

	@GetMapping("hotels")
	public ModelAndView hotelss(
		HttpServletRequest request,@RequestParam(name = "city", required = false, defaultValue = "default") String cityName) {
	
		ModelAndView mv = new ModelAndView();
		List<Hotel> hlist = hotelService.viewallhotelsincity(cityName);
		mv.setViewName("hotels");
		mv.addObject("hlist", hlist);
		return mv;
	}

	@GetMapping("citieslist")
	public ModelAndView citieslist(HttpServletRequest request) {
		
				
		ModelAndView mv = new ModelAndView("citieslist");
		List<City> list = cityService.viewallcities();
		mv.addObject("clist", list);
//		System.out.println(list);
		return mv;
	}

	@GetMapping("displaycityimage1")
	public ResponseEntity<byte[]> displaycityimage1(@RequestParam("id") int id) throws IOException, SQLException {
		City c = cityService.viewcitybyid(id);
		byte[] imageBytes = null;
		imageBytes = c.getCityimg1().getBytes(1, (int) c.getCityimg1().length());

		return ResponseEntity.ok().contentType(MediaType.IMAGE_PNG).body(imageBytes);
	}

	@GetMapping("displaycityimage2")
	public ResponseEntity<byte[]> displaycityimage2(@RequestParam("id") int id) throws IOException, SQLException {
		City c = cityService.viewcitybyid(id);
		byte[] imageBytes = null;
		imageBytes = c.getCityimg2().getBytes(1, (int) c.getCityimg2().length());

		return ResponseEntity.ok().contentType(MediaType.IMAGE_PNG).body(imageBytes);
	}

	@GetMapping("transport")
	public ModelAndView transport(
			HttpServletRequest request ,@RequestParam(name = "city", required = false, defaultValue = "default") String cityName) {
		
		
		ModelAndView mv = new ModelAndView("transportservices");
		mv.addObject("cityname", cityName);
		return mv;
	}

	@GetMapping("colleges")
	public ModelAndView colleges(
			HttpServletRequest request ,@RequestParam(name = "city", required = false, defaultValue = "default") String cityName) {
		
		ModelAndView mv = new ModelAndView("colleges");
		mv.addObject("cityname", cityName);
		List<Education> list = educationService.vieweducationincity(cityName);
		mv.setViewName("colleges");
		mv.addObject("list", list);
		return mv;
	}

	@GetMapping("jobs")
	public ModelAndView jobs(HttpServletRequest request, @RequestParam(name = "city", required = false, defaultValue = "default") String cityName) {
	
		
		ModelAndView mv = new ModelAndView("jobs");
		mv.addObject("cityname", cityName);
		List<Company> list = companyService.viewallcompaniesincity(cityName);
		mv.setViewName("jobs");
		mv.addObject("list", list);
		return mv;
	}

	@GetMapping("login")
	public ModelAndView customerlogin() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		return mv;
	}

	@GetMapping("shoppingmalls")
	public ModelAndView shoppingmalls(
			HttpServletRequest request ,@RequestParam(name = "city", required = false, defaultValue = "default") String cityName) {
		
		ModelAndView mv = new ModelAndView("shoppingmalls");
		mv.addObject("cityname", cityName);
		List<Mall> list = mallService.viewmallsincity(cityName);
		mv.addObject("list", list);
		return mv;
	}

	@GetMapping("restaurants")
	public ModelAndView restaurants(
			HttpServletRequest request ,@RequestParam(name = "city", required = false, defaultValue = "default") String cityName) {
	
		ModelAndView mv = new ModelAndView("restaurants");
		mv.addObject("cityname", cityName);
		List<Restaurant> list = restaurantService.viewallrestaurantsincity(cityName);
		mv.setViewName("restaurants");
		mv.addObject("list", list);
		return mv;
	}
	
	
	@GetMapping("contactus")
	public ModelAndView contactus(
			HttpServletRequest request ,@RequestParam(name = "city", required = false, defaultValue = "default") String cityName) {
		
		ModelAndView mv = new ModelAndView("contactus");
		mv.addObject("cityname", cityName);
		return mv;
	}

	@GetMapping("registration")
	public ModelAndView registration() {
		ModelAndView mv = new ModelAndView("registration");
		return mv;
	}

	@GetMapping("chatbot")
	public ModelAndView chatbot() {
		ModelAndView mv = new ModelAndView("chatbot");
		return mv;
	}

	@GetMapping("ask")
	public ModelAndView askk(
			HttpServletRequest request ,@RequestParam(name = "cityname", required = false, defaultValue = "default") String cityName) {
		
		ModelAndView mv = new ModelAndView("ask");
		mv.addObject("cityname", cityName);
		return mv;
	}

	@GetMapping("bookings")
	public ModelAndView booking(
		@RequestParam(name = "city", required = false, defaultValue = "default") String cityName,
			HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView("bookings");
		
		if (request.getSession().getAttribute("customer") == null) {
			// If not logged in, redirect to adminlogin
			//return new ModelAndView("redirect:/login");
			return new ModelAndView("login_message");
		}
		
		//ModelAndView mv = new ModelAndView("bookings");
		HttpSession session = request.getSession();

		int cid = (int) session.getAttribute("cid");
		String cemail = (String) session.getAttribute("email");

		Customer c = customerService.viewcustomerbyid(cid);

		List<Hotel> hlist = hotelService.viewallhotelsincity(cityName);
		mv.addObject("hlist", hlist);
		System.out.println(hlist);
		mv.addObject("cityname", cityName);
		mv.addObject("cdata", c);

		return mv;
	}

	@PostMapping("registercustomer")
	public ModelAndView registerCustomer(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String msg = null;
		try {
			String name = request.getParameter("name");
			String uname = request.getParameter("uname");
			String email = request.getParameter("email");
			String contact = request.getParameter("contact");
			String pwd = request.getParameter("pwd");
			String dob = request.getParameter("dob");
			String gender = request.getParameter("gender");
			String address = request.getParameter("address");

			Customer c = new Customer();
			c.setName(name);
			c.setUsername(uname);
			c.setEmail(email);
			c.setGender(gender);
			c.setDob(dob);
			c.setPassword(pwd);
			c.setContactno(contact);
			c.setAddress(address);
			c.setActive(true);

			msg = customerService.addcustomer(c);
			String generatedOTP = OtpUtil.generateOTP();
			emailService.sendEmail(c.getEmail(), "Smart City Exploration Made Easy: Your Gateway to Urban Insights",
					"Dear User, We are Glad to have you as a part of our Smart City Project community. "
							+ "With our website, you can easily discover all the services and attractions your city has to offer. "
							+ "Please Login and Explore today! \n \n Your OTP is " + generatedOTP);
// emailService.sendEmail(c.getEmail(), "Smart City Password Reset", "Your OTP: "+forgotpwdotp);

			mv.setViewName("otpverification"); // Redirect to the login page on success
			mv.addObject("message", msg);
		} catch (Exception e) {
			mv.setViewName("loginfailed");
			msg = e.getMessage();
			System.out.println(msg);
			mv.addObject("message", msg);
		}
		return mv;
	}

	@GetMapping("forgot")
	public ModelAndView forgot() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("forgot");
		return mv;
	}

	@PostMapping("forgotpassword")
	public ModelAndView forgotPassword(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String msg = request.getParameter("message");

		try {
			String email = request.getParameter("email");
			HttpSession session = request.getSession();
			session.setAttribute("userEmail", email); // Storing the email in a session variable

			// Check if the email exists in the database using the autowired CustomerService
			if (customerService.checkuseremail(email) != null) {
				// The email exists in the database, proceed with sending the OTP
				Customer c = new Customer();
				c.setEmail(email);

				// Assuming you have an EmailService instance available
				String forgotpwdotp = OtpUtil.generateOTP();
				emailService.sendEmail(c.getEmail(), "Smart City Password Reset", "Your OTP: " + forgotpwdotp);

				mv.setViewName("otpforgotpwd"); // Redirect to the OTP confirmation page on success
				mv.addObject("message", msg);
			} else {
				// If the email does not exist in the database, set a message to display on the
				// same page
				mv.setViewName("forgot"); // Change "yourSamePageName" to your actual JSP page name
				mv.addObject("message", "Email does not exist in list of Existing Users. Please Register.");
			}
		} catch (Exception e) {
			// If an exception occurs, redirect back to the forgot password page
			mv.setViewName("loginfailed");
		}

		return mv;
	}

	@PostMapping("checkuseremail")
	public ModelAndView checkusername(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String email = request.getParameter("email");

		Customer c = customerService.checkuseremail(email);
		if (c != null) {
			mv.setViewName("newusername");
			mv.addObject("email", email);
		} else {
			mv.setViewName("forgot");
//	        mv.addObject("message", "Email not present");
		}
		return mv;
	}

	@PostMapping("setpassword")
	public ModelAndView setPassword(@RequestParam String email, @RequestParam String newpassword,
			@RequestParam String confirmPassword) {
		ModelAndView mv = new ModelAndView();

		if (newpassword.equals(confirmPassword)) {
			// Update the password in the database
			String updateResult = customerService.updatePasswordByEmail(email, newpassword);

			if (updateResult.equals("Customer Updated Successfully")) {
				// Password updated successfully
				mv.setViewName("login"); // Redirect to the home page or a success page
				mv.addObject("message", "Your Password Updated Successfully <br> Please Login");
			} else {
				// Some issue occurred during the update
				mv.setViewName("newusername"); // Redirect back to the form
				mv.addObject("message", "An error occurred. Please try again.");
			}
		} else {
			// Passwords don't match, show an error message or redirect back to the form
			mv.setViewName("newusername");
			mv.addObject("message", "Passwords don't match. Please try again.");
		}

		return mv;
	}

	@PostMapping("verifyotp")
	public ModelAndView verifyOTP(@RequestParam("otp1") String otp1, @RequestParam("otp2") String otp2,
			@RequestParam("otp3") String otp3, @RequestParam("otp4") String otp4) {
		ModelAndView mv = new ModelAndView();
		String enteredOTP = otp1 + otp2 + otp3 + otp4; // Concatenate individual OTP digits

		if (OtpUtil.getGeneratedOTP().equals(enteredOTP)) {
			mv.setViewName("login");
			mv.addObject("message", "OTP verified. You can now log in.");
		} else {
			mv.setViewName("otpverification");
			mv.addObject("message", "Invalid OTP. Please try again.");
		}
		return mv;
	}

	@PostMapping("verifyotpe")
	public ModelAndView verifyOTPe(@RequestParam("otp1") String otp1, @RequestParam("otp2") String otp2,
			@RequestParam("otp3") String otp3, @RequestParam("otp4") String otp4) {
		ModelAndView mv = new ModelAndView();
		String enteredOTP = otp1 + otp2 + otp3 + otp4; // Concatenate individual OTP digits

		if (OtpUtil.getGeneratedOTP().equals(enteredOTP)) {
			mv.setViewName("newusername");
			mv.addObject("message", "OTP verified. You can now Set a new Password.");
		} else {
			mv.setViewName("otpforgotpwd");
			mv.addObject("message", "Invalid OTP. Please try again.");
		}
		return mv;
	}

	@PostMapping("checkcustomerlogin")
	public ModelAndView checkcustomerlogin(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");

		Customer c = customerService.checkcustomerlogin(email, pwd);

		if (c != null && c.isActive()) {
			// session created only after login successfull
			HttpSession session = request.getSession();
			session.setAttribute("cid", c.getId());// eid is a session variable
			session.setAttribute("cname", c.getName());// ename is a session variable
			session.setAttribute("email", c.getEmail());
			session.setAttribute("customer", c);
			// session end
			mv.setViewName("citieslist");
			List<City> list = cityService.viewallcities();
			mv.addObject("clist", list);
		} else {
			mv.setViewName("login");
			mv.addObject("message", "Invalid Credentials Login Failed");
		}
		return mv;
	}

	@PostMapping("rentalbooking")
	public ModelAndView rentalbooking(@RequestParam("city") String city, HttpServletRequest request) {

	    ModelAndView mv = new ModelAndView();
	    String msg = null;

	    try {
	        String name = request.getParameter("rental_name");
	        String contact = request.getParameter("rental_contact");
	        String email = request.getParameter("rental_email");
	        String address = request.getParameter("rental_address");
	        String vehicle = request.getParameter("rental_vehicle");
	        String date = request.getParameter("rental_date");
	        String time = request.getParameter("rental_time");

	        RentalBookings rb = new RentalBookings();
	        rb.setName(name);
	        rb.setNumber(contact);
	        rb.setEmail(email);
	        rb.setAddress(address);
	        rb.setVehicle(vehicle);
	        rb.setDate(date);
	        rb.setTime(time);

	        msg = rentalBookingService.addbooking(rb);

	        emailService.sendEmail(
	            rb.getEmail(),
	            "Rental Booking Confirmation",
	            "Dear User, we are pleased to confirm your reservation for a " +
	            rb.getVehicle() + " in " + city + " under the name " + rb.getName() +
	            ". Your booking is scheduled for " + rb.getDate() + " at " + rb.getTime() + "."
	        );

	        // Redirect to payment page
	        mv.setViewName("paymentHome"); 
	        mv.addObject("message", msg);
	        mv.addObject("bookingType", "rental");
	        mv.addObject("name", name);
	        mv.addObject("email", email);
	        mv.addObject("vehicle", vehicle);
	        mv.addObject("amount", "500.00"); // Example: pass the amount
	        // Add any other booking details you need

	    } catch (Exception e) {
	        mv.setViewName("mybookings");
	        msg = e.getMessage();
	        mv.addObject("message", msg);
	    }
	    return mv;
	}

	@PostMapping("inserthotelbooking")
	public ModelAndView inserthotelbooking(@RequestParam("city") String city, HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView();
	    String msg = null;

	    try {
	        String name = request.getParameter("hotel_name");
	        String email = request.getParameter("hotel_email");
	        String hotel = request.getParameter("hotel");
	        String checkindate = request.getParameter("hotel_checkindate");
	        String checkintime = request.getParameter("hotel_checkintime");
	        String checkoutdate = request.getParameter("hotel_checkoutdate");
	        String checkouttime = request.getParameter("hotel_checkouttime");

	        HotelBookings hb = new HotelBookings();
	        hb.setName(name);
	        hb.setEmail(email);
	        hb.setHotel(hotel);
	        hb.setCheckindate(checkindate);
	        hb.setCheckintime(checkintime);
	        hb.setCheckoutdate(checkoutdate);
	        hb.setCheckouttime(checkouttime);

	        msg = bookingService.addbooking(hb);

	        emailService.sendEmail(
	            hb.getEmail(),
	            "Hotel Booking Confirmation",
	            "Dear User, we are delighted to confirm your reservation for the hotel named " +
	            hb.getHotel() + " in " + city + ". Your stay is booked from " + hb.getCheckindate() +
	            " at " + hb.getCheckintime() + " to " + hb.getCheckoutdate() +
	            " at " + hb.getCheckouttime() + "."
	        );

	        // Redirect to payment page
	        mv.setViewName("paymentHome");
	        mv.addObject("message", msg);
	        mv.addObject("bookingType", "hotel");
	        mv.addObject("name", name);
	        mv.addObject("email", email);
	        mv.addObject("hotel", hotel);
	        mv.addObject("checkin", checkindate + " " + checkintime);
	        mv.addObject("checkout", checkoutdate + " " + checkouttime);
	        mv.addObject("amount", "2000.00"); // Example: pass the amount

	    } catch (Exception e) {
	        msg = e.getMessage();
	        mv.setViewName("mybookings");
	        mv.addObject("message", msg);
	    }
	    return mv;
	}


	@GetMapping("allbookings")
	public ModelAndView viewallhotelbookings(HttpServletRequest request) {
		
		if (request.getSession().getAttribute("customer") == null) {
			// If not logged in, redirect to adminlogin
			return new ModelAndView("redirect:/login");
		}
		
		ModelAndView mv = new ModelAndView("bookingsofallusers");

		List<HotelBookings> list = bookingService.viewallhotelbookings();
		mv.addObject("blist", list);

		List<RentalBookings> list2 = rentalBookingService.viewallrentalbookings();
		mv.addObject("rlist", list2);

		return mv;
	}

	@GetMapping("mybookings")
	public ModelAndView mybookings(HttpServletRequest request) {
	
		if (request.getSession().getAttribute("customer") == null) {
			// If not logged in, redirect to adminlogin
			//return new ModelAndView("redirect:/login");
			return new ModelAndView("login_message");
		}
		
		ModelAndView mv = new ModelAndView("mybookings");

		HttpSession session = request.getSession();

		int cid = (int) session.getAttribute("cid");
		Customer c = customerService.viewcustomerbyid(cid);

		String email = c.getEmail();
		List<RentalBookings> rlist = rentalBookingService.getDetailsByEmail(email);
		List<HotelBookings> hlist = bookingService.getDetailsByEmail(email);
		System.out.println(hlist);
		mv.addObject("rlist", rlist);
		mv.addObject("hlist", hlist);
		return mv;
	}




	@PostMapping("contact")
	public ModelAndView contactusbackend(HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView();
	    String msg;

	    try {
	        String name = request.getParameter("name");
	        String email = request.getParameter("email");
	        String comment = request.getParameter("comment");
	        String city = request.getParameter("city"); // fetch manually

	        Contactus cu = new Contactus();
	        cu.setName(name);
	        cu.setEmail(email);
	        cu.setComment(comment);

	        msg = contactService.insert(cu);
	        mv.setViewName("contactus");
	        mv.addObject("message", msg);

	        String subject = "New Contact Message from: " + name;
	        String content = "City: " + city + "\nName: " + name + "\nEmail: " + email + "\nComment: " + comment;

	        emailService.sendEmail("somasaiganesh.05@gmail.com", subject, content);

	    } catch (Exception e) {
	        msg = e.getMessage();
	        mv.setViewName("contactus");
	        mv.addObject("message", msg);
	    }

	    return mv;
	}

	@PostMapping("contacthome")
	public ModelAndView contactusbackendhome(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String msg = null;
		try {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String comment = request.getParameter("comment");

			Contactus cu = new Contactus();
			cu.setName(name);
			cu.setEmail(email);
			cu.setComment(comment);

			msg = contactService.insert(cu);
			mv.setViewName("index");
			mv.addObject("message", msg);
		} catch (Exception e) {
			msg = e.getMessage();
			mv.setViewName("index");
			mv.addObject("message", msg);
		}
		return mv;
	}

	@GetMapping("certificate")
	public ModelAndView certificate(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("certificate");
		HttpSession session = request.getSession();
		// Assuming that the attribute name storing the user's name in the session is
		// "username"
		String recipientName = (String) session.getAttribute("cname");
		// Set the recipient's name in the session
		session.setAttribute("recipientName", recipientName);

		return mv;
	}

	@GetMapping("quiz")
	public ModelAndView quiz(HttpServletRequest request) {
		
		if (request.getSession().getAttribute("customer") == null) {
			// If not logged in, redirect to adminlogin
			//return new ModelAndView("redirect:/login");
			return new ModelAndView("login_message");
		}
		
		ModelAndView mv = new ModelAndView("quiz");
		return mv;
	}
	
	@GetMapping("wallposters")
	public ModelAndView wallposters() {
		ModelAndView mv = new ModelAndView("wallposters");
		return mv;
	}

	@GetMapping("profile")
	public ModelAndView updatecustomer(HttpServletRequest request) {
	
		ModelAndView mv = new ModelAndView();
		
		if (request.getSession().getAttribute("customer") == null) {
			// If not logged in, redirect to adminlogin
			//return new ModelAndView("redirect:/login");
			return new ModelAndView("login_message");
		}

		HttpSession session = request.getSession();

		mv.setViewName("updateprofile");

		mv.addObject("cid", session.getAttribute("cid"));
		mv.addObject("cname", session.getAttribute("cname"));

		int id = (int) session.getAttribute("cid");

		Customer c = customerService.viewcustomerbyid(id);
		System.out.println(c.toString());
		mv.addObject("c", c);

		return mv;
	}

	@PostMapping("updateprofile")
	public ModelAndView updateAction(@RequestParam("name") String name, @RequestParam("uname") String username,
			@RequestParam("email") String email, @RequestParam("contact") String contactno,
			@RequestParam("pwd") String password, @RequestParam("dob") String dateofBirth,
			@RequestParam("address") String address, HttpServletRequest request,
			@RequestParam("profileImage") MultipartFile file) {
		String msg = null;
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		mv.addObject("cid", session.getAttribute("cid"));
		mv.addObject("cname", session.getAttribute("cname"));
		int id = (int) session.getAttribute("cid");

		try {
			Customer c = customerService.viewcustomerbyid(id);

			byte[] bytes = file.getBytes();
			Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);

			c.setName(name);
			c.setUsername(username);
			c.setEmail(email);
			c.setContactno(contactno);
			c.setPassword(password);
			c.setDob(dateofBirth);
			c.setAddress(address);
			c.setProfileImage(blob);

			msg = customerService.updatecustomer(c);
			mv.setViewName("login");
			mv.addObject("message", msg);
		} catch (Exception e) {
			msg = e.getMessage();
			mv.setViewName("loginfailed");
			mv.addObject("message", msg);
		}
		return mv;
	}

	@GetMapping("displaycustomerimage")
	public ResponseEntity<byte[]> displaycustomerimage(@RequestParam("id") int id) throws IOException, SQLException {
		Customer c = customerService.viewcustomerbyid(id);
		byte[] imageBytes = null;
		imageBytes = c.getProfileImage().getBytes(1, (int) c.getProfileImage().length());

		return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
	}

	@GetMapping("customerlogout")
	public String adminLogout(HttpServletRequest request) {
		// Invalidate the session
		request.getSession().invalidate();
		
		// Redirect to the login page
		return "redirect:/login";
	}
	



}
