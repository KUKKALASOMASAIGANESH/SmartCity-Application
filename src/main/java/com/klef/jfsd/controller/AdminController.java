package com.klef.jfsd.controller;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
import com.klef.jfsd.model.Mall;
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

@Controller
public class AdminController {
	@Autowired
	CustomerService customerService;

	@Autowired
	private TouristAttractionsService touristAttractionsService;

	@Autowired
	private AdminService adminService;

	@Autowired
	private EducationService educationService;

	@Autowired
	private CityService cityService;

	@Autowired
	private AboutCityService aboutCityService;

	@Autowired
	private ContactService contactService;

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

	@GetMapping("adminlogin")
	public ModelAndView adminlogin() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminlogin");
		return mv;
	}

	@GetMapping("adminlogout")
	public String adminLogout(HttpServletRequest request) {
		// Invalidate the session
		request.getSession().invalidate();

		// Redirect to the login page
		return "redirect:/adminlogin";
	}

	@PostMapping("/checkadminlogin")
	public ModelAndView checkadminlogin(HttpServletRequest request) {
		String uname = request.getParameter("uname");
		String pwd = request.getParameter("pwd");

		Admin a = adminService.checkadminlogin(uname, pwd);
		ModelAndView mv = new ModelAndView();
		if (a != null) {

			request.getSession().setAttribute("user", a);

			mv.setViewName("adminhome");

			long customercount = adminService.customercount();
			mv.addObject("ccount", customercount);
			long cityCount = cityService.citiescount();
			mv.addObject("citycount", cityCount);

		} else {
			mv.setViewName("adminlogin");
			mv.addObject("message", "Login Failed");
		}
		return mv;
	}
	
	@GetMapping("deletehotel")
	public ModelAndView deletehotel(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("deletehotel");
		if (request.getSession().getAttribute("user") == null) {
			return new ModelAndView("redirect:/adminlogin");
		}
		List<Hotel> hlist = hotelService.viewallhotels();
		mv.addObject("hlist", hlist);
		return mv;
	}
	
	
	
	@GetMapping("deletehospital")
	public ModelAndView deletehospital(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("deletehospital");
		if (request.getSession().getAttribute("user") == null) {
			// If not logged in, redirect to adminlogin
			return new ModelAndView("redirect:/adminlogin");
		}
		List<Hospital> hplist = hospitalService.viewallhospitals();
		mv.addObject("hplist", hplist);
		return mv;
	}
	
	@GetMapping("deletecompany")
	public ModelAndView deletecompany(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("deletecompany");
		if (request.getSession().getAttribute("user") == null) {
			// If not logged in, redirect to adminlogin
			return new ModelAndView("redirect:/adminlogin");
		}
		List<Company> complist = companyService.viewallcompanies();
		mv.addObject("complist", complist);		
		return mv;
	}
	
	@GetMapping("deletemall")
	public ModelAndView deletemall(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("deletemall");
		if (request.getSession().getAttribute("user") == null) {
			// If not logged in, redirect to adminlogin
			return new ModelAndView("redirect:/adminlogin");
		}
		List<Mall> mlist = mallService.viewallmalls();
		mv.addObject("mlist", mlist);		
		return mv;
	}
	
	@GetMapping("deleterestaurant")
	public ModelAndView deleterestaurant(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("deleterestaurant");
		if (request.getSession().getAttribute("user") == null) {
			// If not logged in, redirect to adminlogin
			return new ModelAndView("redirect:/adminlogin");
		}
		List<Restaurant> rlist = restaurantService.viewallrestaurants();
		mv.addObject("rlist", rlist);		
		return mv;
	}
	
	@GetMapping("deletecollege")
	public ModelAndView deletecollege(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("deletecollege");
		if (request.getSession().getAttribute("user") == null) {
			// If not logged in, redirect to adminlogin
			return new ModelAndView("redirect:/adminlogin");
		}
		List<Education> elist = educationService.viewalleducations();
		mv.addObject("elist", elist);		
		return mv;
	}
	
	@GetMapping("deletehotelbyid/{id}")
	public String deletehotelbyid(@PathVariable("id") int id) {
		adminService.deletehotel(id);
		return "redirect:/deletehotel";
	}
	
	@GetMapping("deletehospitalbyid")
	public String deletehospitalbyid(@RequestParam("id") int id) {
		adminService.deletehospital(id);
		return "redirect:/deletehospital";
	}
	
	@GetMapping("deletecompanybyid")
	public String deletecompanybyid(@RequestParam("id") int id) {
		adminService.deletecompany(id);
		return "redirect:/deletecompany";
	}
	
	@GetMapping("deletequerybyid")
	public String deletequerybyid(@RequestParam("id") int id,HttpServletRequest request) {
		adminService.deletequerybyid(id);
		return "redirect:/viewqueries";
	}
	
	@GetMapping("deletemallbyid/{id}")
	public String deletemallbyid(@PathVariable("id") int id) {
		adminService.deletemall(id);
		return "redirect:/deletemall";
	}
	
	@GetMapping("deleterestaurantbyid/{id}")
	public String deleterestaurantbyid(@RequestParam("id") int id) {
		adminService.deleterestaurant(id);
		return "redirect:/deleterestaurant";
	}
	
	@GetMapping("deleteeducationbyid/{id}")
	public String deleteeducationbyid(@PathVariable("id") int id) {
		adminService.deletecollege(id);
		return "redirect:/deletecollege";
	}	
	

	@GetMapping("viewallcustomers")
	public ModelAndView viewallcustomers(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		if (request.getSession().getAttribute("user") == null) {
			// If not logged in, redirect to adminlogin
			return new ModelAndView("redirect:/adminlogin");
		}
		mv.setViewName("viewallcustomers");

		List<Customer> customerList = adminService.viewallcustomers();
		mv.addObject("customerdata", customerList);
		return mv;
	}

	@GetMapping("viewallcities")
	public ModelAndView viewallcities(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		if (request.getSession().getAttribute("user") == null) {
			// If not logged in, redirect to adminlogin
			return new ModelAndView("redirect:/adminlogin");
		}
		mv.setViewName("viewallcities");
		List<City> citieslist = cityService.viewallcities();
		mv.addObject("citieslist", citieslist);
		return mv;
	}
	
	@GetMapping("viewqueries")
	public ModelAndView viewqueries(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		if (request.getSession().getAttribute("user") == null) {
			// If not logged in, redirect to adminlogin
			return new ModelAndView("redirect:/adminlogin");
		}
		mv.setViewName("viewqueries");
		List<Contactus> clist = contactService.viewallcontactus();
		mv.addObject("clist", clist);		
		return mv;		
	}

	@GetMapping("updatecity")
	public ModelAndView updatecity(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		if (request.getSession().getAttribute("user") == null) {
			// If not logged in, redirect to adminlogin
			return new ModelAndView("redirect:/adminlogin");
		}
		mv.setViewName("updatecity");
		List<City> citieslist = cityService.viewallcities();
		mv.addObject("citieslist", citieslist);
		return mv;
	}

	@GetMapping("updatetouristattractions")
	public ModelAndView updatetouristattractions(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		if (request.getSession().getAttribute("user") == null) {
			// If not logged in, redirect to adminlogin
			return new ModelAndView("redirect:/adminlogin");
		}
		mv.setViewName("updatetouristattractions");
		List<TouristAttractions> talist = touristAttractionsService.viewalltouristattractions();
		mv.addObject("talist", talist);
		return mv;
	}

	@GetMapping("updateaboutcity")
	public ModelAndView updateaboutcity(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		if (request.getSession().getAttribute("user") == null) {
			// If not logged in, redirect to adminlogin
			return new ModelAndView("redirect:/adminlogin");
		}
		mv.setViewName("updateaboutcity");
		List<AboutCity> aboutcitylist = aboutCityService.viewallaboutcity();
		mv.addObject("aboutcitylist", aboutcitylist);
		return mv;
	}

	@GetMapping("updatecitybyid")
	public ModelAndView updatecitybyid(@RequestParam("id") int id, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("updatecitybyid");
		if (request.getSession().getAttribute("user") == null) {
			return new ModelAndView("redirect:/adminlogin");
		}
		City city = cityService.viewcitybyid(id);
		// mv.setViewName("updatecitybyid");
		mv.addObject(city);
		System.out.println(city);
		return mv;
	}

	@GetMapping("updateaboutcitybyid")
	public ModelAndView updateaboutcitybyid(@RequestParam("id") int id, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("updateaboutcitybyid");
		if (request.getSession().getAttribute("user") == null) {
			return new ModelAndView("redirect:/adminlogin");
		}
		AboutCity abc = aboutCityService.viewaboutcitybyid(id);
		// mv.setViewName("updatecitybyid");
		List<City> list = cityService.viewallcities();
		mv.addObject("clist", list);

		mv.addObject("abc", abc);
		System.out.println(abc);
		return mv;
	}

	@GetMapping("updatetabyid")
	public ModelAndView updatetabyid(@RequestParam("id") int id, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("updatetouristattractionsbyid");
		if (request.getSession().getAttribute("user") == null) {
			return new ModelAndView("redirect:/adminlogin");
		}
		TouristAttractions ta = touristAttractionsService.viewtouristattractionsbyid(id);
		mv.addObject("ta", ta);

		List<City> list = cityService.viewallcities();
		mv.addObject("clist", list);
		return mv;
	}

	@PostMapping("updatecitydetailsbyid")
	public ModelAndView updatecitydetailsbyid(@RequestParam("id") int id, HttpServletRequest request,
			@RequestParam("cityimage1") MultipartFile file, @RequestParam("cityimage2") MultipartFile file2) {
		ModelAndView mv = new ModelAndView();
		String msg = null;
		if (request.getSession().getAttribute("user") == null) {
			return new ModelAndView("redirect:/adminlogin");
		}

		try {
			String city = request.getParameter("cityname");
			String citynamestyle = request.getParameter("citynamestyle");

			byte[] bytes = file.getBytes();
			Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);

			byte[] bytes2 = file2.getBytes();
			Blob blob2 = new javax.sql.rowset.serial.SerialBlob(bytes2);

			City c = new City();
			c.setId(id);
			c.setCity(city);
			c.setCitynamestyle(citynamestyle);

			c.setCityimg1(blob);
			c.setCityimg2(blob2);

			System.out.println(c);

			msg = cityService.updatecity(c);
			System.out.println(msg);
			mv.setViewName("updatecitybyid");
			mv.addObject("message", msg);
		} catch (Exception e) {
			msg = e.getMessage();
//			System.out.println(c);
			System.out.println(msg);
			mv.setViewName("updatecitybyid");
			mv.addObject("message", msg);
		}
		return mv;
	}

	@PostMapping("updateaboutcitydetails")
	public ModelAndView updateaboutcitydetails(@RequestParam("id") int id, HttpServletRequest request,
			@RequestParam("cityimage") MultipartFile file1, @RequestParam("cultureimage") MultipartFile file2,
			@RequestParam("festivalimage1") MultipartFile file3, @RequestParam("festivalimage2") MultipartFile file4,
			@RequestParam("festivalimage3") MultipartFile file5, @RequestParam("foodimage1") MultipartFile file6,
			@RequestParam("foodimage2") MultipartFile file7, @RequestParam("foodimage3") MultipartFile file8,
			@RequestParam("foodimage4") MultipartFile file9, @RequestParam("foodimage5") MultipartFile file10,
			@RequestParam("foodimage6") MultipartFile file11, @RequestParam("galleryimage1") MultipartFile file12,
			@RequestParam("galleryimage2") MultipartFile file13, @RequestParam("galleryimage3") MultipartFile file14,
			@RequestParam("politicsimage") MultipartFile file15) {
		ModelAndView mv = new ModelAndView();
		String msg = null;
		try {
			String city = request.getParameter("cityname");
			String nameofthecitylang = request.getParameter("nameofthecitylang");
			String citydesc = request.getParameter("citydescription");
			String culturedesc = request.getParameter("culturedescription");
			String politicsdesc = request.getParameter("politicsdescription");
			String maplink = request.getParameter("maplink");

			byte[] bytes = file1.getBytes();
			Blob blob1 = new javax.sql.rowset.serial.SerialBlob(bytes);

			byte[] bytes2 = file2.getBytes();
			Blob blob2 = new javax.sql.rowset.serial.SerialBlob(bytes2);

			byte[] bytes3 = file3.getBytes();
			Blob blob3 = new javax.sql.rowset.serial.SerialBlob(bytes3);

			byte[] bytes4 = file4.getBytes();
			Blob blob4 = new javax.sql.rowset.serial.SerialBlob(bytes4);

			byte[] bytes5 = file5.getBytes();
			Blob blob5 = new javax.sql.rowset.serial.SerialBlob(bytes5);

			byte[] bytes6 = file6.getBytes();
			Blob blob6 = new javax.sql.rowset.serial.SerialBlob(bytes6);

			byte[] bytes7 = file7.getBytes();
			Blob blob7 = new javax.sql.rowset.serial.SerialBlob(bytes7);

			byte[] bytes8 = file8.getBytes();
			Blob blob8 = new javax.sql.rowset.serial.SerialBlob(bytes8);

			byte[] bytes9 = file9.getBytes();
			Blob blob9 = new javax.sql.rowset.serial.SerialBlob(bytes9);

			byte[] bytes10 = file10.getBytes();
			Blob blob10 = new javax.sql.rowset.serial.SerialBlob(bytes10);

			byte[] bytes11 = file11.getBytes();
			Blob blob11 = new javax.sql.rowset.serial.SerialBlob(bytes11);

			byte[] bytes12 = file12.getBytes();
			Blob blob12 = new javax.sql.rowset.serial.SerialBlob(bytes12);

			byte[] bytes13 = file13.getBytes();
			Blob blob13 = new javax.sql.rowset.serial.SerialBlob(bytes13);

			byte[] bytes14 = file14.getBytes();
			Blob blob14 = new javax.sql.rowset.serial.SerialBlob(bytes14);

			byte[] bytes15 = file15.getBytes();
			Blob blob15 = new javax.sql.rowset.serial.SerialBlob(bytes15);

			AboutCity abc = new AboutCity();
			abc.setId(id);
			abc.setCity(city);
			abc.setCname(nameofthecitylang);
			abc.setCityImage(blob1);
			abc.setDescription(citydesc);
			abc.setCultureImage(blob2);
			abc.setCultureDescription(culturedesc);

			abc.setFestivalimg1(blob3);
			abc.setFestivalimg2(blob4);
			abc.setFestivalimg3(blob5);

			abc.setFamousfoodimg1(blob6);
			abc.setFamousfoodimg2(blob7);
			abc.setFamousfoodimg3(blob8);
			abc.setFamousfoodimg4(blob9);
			abc.setFamousfoodimg5(blob10);
			abc.setFamousfoodimg6(blob11);

			abc.setGalleryimg1(blob12);
			abc.setGalleryimg2(blob13);
			abc.setGalleryimg3(blob14);

			abc.setPoliticsimage(blob15);
			abc.setPoliticsDescription(politicsdesc);

			abc.setMaplink(maplink);

			msg = aboutCityService.updateAboutCity(abc);
			System.out.println(msg);
			System.out.println(abc);
			mv.setViewName("updateaboutcitybyid");
			mv.addObject("message", msg);

		} catch (Exception e) {
			msg = e.getMessage();
			System.out.println(msg);
			mv.setViewName("updateaboutcitybyid");
			mv.addObject("message", msg);
		}
		return mv;
	}

	@PostMapping("updatetadetails")
	public ModelAndView updatetadetails(HttpServletRequest request, @RequestParam("id") int id,
			@RequestParam("citycentralimage") MultipartFile file,
			@RequestParam("touristattractionimg1") MultipartFile file1,
			@RequestParam("touristattractionimg2") MultipartFile file2,
			@RequestParam("touristattractionimg3") MultipartFile file3,
			@RequestParam("touristattractionimg4") MultipartFile file4,
			@RequestParam("touristattractionimg5") MultipartFile file5,
			@RequestParam("touristattractionimg6") MultipartFile file6)
			throws IOException, SerialException, SQLException {
		ModelAndView mv = new ModelAndView();
		String msg = null;

		try {
			String city = request.getParameter("cityname");

			String touristattractionname1 = request.getParameter("touristattractionname1");
			String touristattractiondesc1 = request.getParameter("touristattractiondesc1");
			String touristattractionlink1 = request.getParameter("touristattractionlink1");

			String touristattractionname2 = request.getParameter("touristattractionname2");
			String touristattractiondesc2 = request.getParameter("touristattractiondesc2");
			String touristattractionlink2 = request.getParameter("touristattractionlink2");

			String touristattractionname3 = request.getParameter("touristattractionname3");
			String touristattractiondesc3 = request.getParameter("touristattractiondesc3");
			String touristattractionlink3 = request.getParameter("touristattractionlink3");

			String touristattractionname4 = request.getParameter("touristattractionname4");
			String touristattractiondesc4 = request.getParameter("touristattractiondesc4");
			String touristattractionlink4 = request.getParameter("touristattractionlink4");

			String touristattractionname5 = request.getParameter("touristattractionname5");
			String touristattractiondesc5 = request.getParameter("touristattractiondesc5");
			String touristattractionlink5 = request.getParameter("touristattractionlink5");

			String touristattractionname6 = request.getParameter("touristattractionname6");
			String touristattractiondesc6 = request.getParameter("touristattractiondesc6");
			String touristattractionlink6 = request.getParameter("touristattractionlink6");

			byte[] bytes = file.getBytes();
			Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);

			byte[] bytes1 = file1.getBytes();
			Blob blob1 = new javax.sql.rowset.serial.SerialBlob(bytes1);

			byte[] bytes2 = file2.getBytes();
			Blob blob2 = new javax.sql.rowset.serial.SerialBlob(bytes2);

			byte[] bytes3 = file3.getBytes();
			Blob blob3 = new javax.sql.rowset.serial.SerialBlob(bytes3);

			byte[] bytes4 = file4.getBytes();
			Blob blob4 = new javax.sql.rowset.serial.SerialBlob(bytes4);

			byte[] bytes5 = file5.getBytes();
			Blob blob5 = new javax.sql.rowset.serial.SerialBlob(bytes5);

			byte[] bytes6 = file6.getBytes();
			Blob blob6 = new javax.sql.rowset.serial.SerialBlob(bytes6);
			
			TouristAttractions ta = new TouristAttractions();
			ta.setId(id);
			ta.setCity(city);
			ta.setCentralimg(blob);
			
			ta.setTaimg1(blob1);
			ta.setTaname1(touristattractionname1);
			ta.setTadesc1(touristattractiondesc1);
			ta.setTalink1(touristattractionlink1);
			
			ta.setTaimg2(blob2);
			ta.setTaname2(touristattractionname2);
			ta.setTadesc2(touristattractiondesc2);
			ta.setTalink2(touristattractionlink2);
			
			ta.setTaimg3(blob3);
			ta.setTaname3(touristattractionname3);
			ta.setTadesc3(touristattractiondesc3);
			ta.setTalink3(touristattractionlink3);
			
			ta.setTaimg4(blob4);
			ta.setTaname4(touristattractionname4);
			ta.setTadesc4(touristattractiondesc4);
			ta.setTalink4(touristattractionlink4);
			
			ta.setTaimg5(blob5);
			ta.setTaname5(touristattractionname5);
			ta.setTadesc5(touristattractiondesc5);
			ta.setTalink5(touristattractionlink5);
			
			ta.setTaimg6(blob6);
			ta.setTaname6(touristattractionname6);
			ta.setTadesc6(touristattractiondesc6);
			ta.setTalink6(touristattractionlink6);
			
			msg = touristAttractionsService.updatetouristattractions(ta);
			mv.setViewName("updatetouristattractionsbyid");
			mv.addObject("message",msg);
		}
		
		catch (Exception e) {
			msg = e.getMessage();
			System.out.println(msg);
			mv.setViewName("updatetouristattractionsbyid");
			mv.addObject("message", msg);	
		}
		return mv;
	}

	@GetMapping("viewallabout")
	public ModelAndView viewallabout(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		if (request.getSession().getAttribute("user") == null) {
			// If not logged in, redirect to adminlogin
			return new ModelAndView("redirect:/adminlogin");
		}
		mv.setViewName("viewallabout");

		List<AboutCity> aboutlist = aboutCityService.viewallaboutcity();
		mv.addObject("aboutlist", aboutlist);
		return mv;
	}

	@GetMapping("adminhome")
	public ModelAndView adminhome(HttpServletRequest request) {

		if (request.getSession().getAttribute("user") == null) {
			// If not logged in, redirect to adminlogin
			return new ModelAndView("redirect:/adminlogin");
		}

		long customercount = adminService.customercount();
		long cityCount = cityService.citiescount();

		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminhome");
		mv.addObject("ccount", customercount);
		mv.addObject("citycount", cityCount);

		return mv;
	}

	@GetMapping("view")
	public ModelAndView viewcustomerdemo(@RequestParam("id") int cid, HttpServletRequest request) {

		if (request.getSession().getAttribute("user") == null) {
			// If not logged in, redirect to adminlogin
			return new ModelAndView("redirect:/adminlogin");
		}
		Customer c = adminService.viewcustomerbyid(cid);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("viewcustomerbyid");
		mv.addObject("c", c);
		return mv;
	}

	@GetMapping("deletecustomer")
	public ModelAndView deletecustomer(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		if (request.getSession().getAttribute("user") == null) {
			// If not logged in, redirect to adminlogin
			return new ModelAndView("redirect:/adminlogin");
		}
		mv.setViewName("deletecustomer");

		List<Customer> customerlist = adminService.viewallcustomers();

		mv.addObject("customerdata", customerlist);

		return mv;
	}

	@GetMapping("delete/{id}")
	public String deleteaction(@PathVariable("id") int cid) {
		adminService.deletecustomer(cid);
		return "redirect:/deletecustomer";
	}

	@GetMapping("addcity")
	public ModelAndView addcity(HttpServletRequest request) {
		if (request.getSession().getAttribute("user") == null) {
			// If not logged in, redirect to adminlogin
			return new ModelAndView("redirect:/adminlogin");
		}
		ModelAndView mv = new ModelAndView("addcity");
		return mv;
	}

	@GetMapping("updatestatus")
	public ModelAndView updatestatus(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		if (request.getSession().getAttribute("user") == null) {
			// If not logged in, redirect to adminlogin
			return new ModelAndView("redirect:/adminlogin");
		}
		mv.setViewName("updatestatus");

		List<Customer> customerlist = adminService.viewallcustomers();
		mv.addObject("customerdata", customerlist);

		return mv;
	}

	@GetMapping("setstatus")
	public ModelAndView setstatusaction(@RequestParam("id") int cid, @RequestParam("status") boolean status,
			HttpServletRequest request) {
		if (request.getSession().getAttribute("user") == null) {
			// If not logged in, redirect to adminlogin
			return new ModelAndView("redirect:/adminlogin");
		}

		int n = adminService.updatestatus(cid, status);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("updatestatus");

		List<Customer> customerlist = adminService.viewallcustomers();
		mv.addObject("customerdata", customerlist);

		if (n > 0) {
			mv.addObject("message", "Status Updated Successfully");
		} else {
			mv.addObject("message", "Failed to Update Status");
		}
		return mv;
	}

	@GetMapping("addtouristattractions")
	public ModelAndView addtouristattractions(HttpServletRequest request) {
		if (request.getSession().getAttribute("user") == null) {
			// If not logged in, redirect to adminlogin
			return new ModelAndView("redirect:/adminlogin");
		}
		ModelAndView mv = new ModelAndView("addtouristattractions");
		List<City> list = cityService.viewallcities();
		mv.addObject("clist", list);
		return mv;
	}

	@GetMapping("addhotel")
	public ModelAndView addhotel(HttpServletRequest request) {
		if (request.getSession().getAttribute("user") == null) {
			// If not logged in, redirect to adminlogin
			return new ModelAndView("redirect:/adminlogin");
		}
		ModelAndView mv = new ModelAndView("addhotel");

		List<City> list = cityService.viewallcities();
		mv.addObject("clist", list);

		return mv;
	}

	@GetMapping("addhospital")
	public ModelAndView addhospital(HttpServletRequest request) {
		if (request.getSession().getAttribute("user") == null) {
			// If not logged in, redirect to adminlogin
			return new ModelAndView("redirect:/adminlogin");
		}
		ModelAndView mv = new ModelAndView("addhospital");

		List<City> list = cityService.viewallcities();
		mv.addObject("clist", list);

		return mv;
	}

	@GetMapping("addmall")
	public ModelAndView addmall(HttpServletRequest request) {
		if (request.getSession().getAttribute("user") == null) {
			// If not logged in, redirect to adminlogin
			return new ModelAndView("redirect:/adminlogin");
		}
		ModelAndView mv = new ModelAndView("addmall");
		List<City> list = cityService.viewallcities();
		mv.addObject("clist", list);
		return mv;
	}

	@GetMapping("addcompany")
	public ModelAndView addcompany(HttpServletRequest request) {
		if (request.getSession().getAttribute("user") == null) {
			// If not logged in, redirect to adminlogin
			return new ModelAndView("redirect:/adminlogin");
		}
		ModelAndView mv = new ModelAndView("addcompany");
		List<City> list = cityService.viewallcities();
		mv.addObject("clist", list);
		return mv;
	}

	@GetMapping("addrestaurant")
	public ModelAndView addrestaurant(HttpServletRequest request) {
		if (request.getSession().getAttribute("user") == null) {
			// If not logged in, redirect to adminlogin
			return new ModelAndView("redirect:/adminlogin");
		}
		ModelAndView mv = new ModelAndView("addrestaurant");
		List<City> list = cityService.viewallcities();
		mv.addObject("clist", list);
		return mv;
	}

	@GetMapping("displayhotelimage")
	public ResponseEntity<byte[]> displayprodimagedemo(@RequestParam("id") int id) throws IOException, SQLException {
		Hotel hotel = hotelService.viewhotelbyid(id);
		byte[] imageBytes = null;
		imageBytes = hotel.getHotelimage().getBytes(1, (int) hotel.getHotelimage().length());

		return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
	}

	@PostMapping("inserthotel")
	public ModelAndView inserthotel(HttpServletRequest request, @RequestParam("hotelimage") MultipartFile file)
			throws IOException, SerialException, SQLException {
		String msg = null;
		ModelAndView mv = new ModelAndView();
		try {
			String city = request.getParameter("cityname");
			String name = request.getParameter("hotelname");
			String description = request.getParameter("hoteldescription");
			String phone = request.getParameter("hotelphone");
			String email = request.getParameter("hotelemail");
			String link = request.getParameter("hotellink");

			byte[] bytes = file.getBytes();
			Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);

			Hotel h = new Hotel();
			h.setCity(city);
			h.setName(name);
			h.setDescription(description);
			h.setPhone(phone);
			h.setEmail(email);
			h.setLink(link);
			h.setHotelimage(blob);

			msg = hotelService.addhotel(h);
			mv.setViewName("addhotel");
			mv.addObject("message", msg);
			System.out.println(msg);
		} catch (Exception e) {
			msg = e.getMessage();
			mv.setViewName("addhotel");
			mv.addObject("message", msg);
		}
		return mv;
	}

	@PostMapping("inserthospital")
	public ModelAndView inserthospital(HttpServletRequest request, @RequestParam("hospitalimage") MultipartFile file)
			throws IOException, SerialException, SQLException {
		ModelAndView mv = new ModelAndView();

		String msg = null;
		try {
			String city = request.getParameter("cityname");
			String name = request.getParameter("hospitalname");
			String description = request.getParameter("hospitaldescription");
			String address = request.getParameter("hospitaladdress");
			String phone = request.getParameter("hospitalphone");
			String email = request.getParameter("hospitalemail");
			String balink = request.getParameter("hospitalbalink");
			String dlink = request.getParameter("hospitaldlink");

			byte[] bytes = file.getBytes();
			Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);

			Hospital h = new Hospital();
			h.setCity(city);
			h.setName(name);
			h.setDescription(description);
			h.setAddress(address);
			h.setPhone(phone);
			h.setEmail(email);
			h.setBalink(balink);
			h.setDlink(dlink);
			h.setHospitalimage(blob);

			msg = hospitalService.addhospital(h);
			mv.setViewName("addhospital");
			mv.addObject("message", msg);

		} catch (Exception e) {
			msg = e.getMessage();
			mv.setViewName("addhospital");
			mv.addObject("message", msg);
		}
		return mv;
	}

	@PostMapping("insertcity")
	public ModelAndView insertcity(HttpServletRequest request, @RequestParam("cityimage1") MultipartFile file,
	                               @RequestParam("cityimage2") MultipartFile file2) throws IOException, SerialException, SQLException {
	    String msg = null;
	    ModelAndView mv = new ModelAndView();
	    try {
	        String city = request.getParameter("cityname");
	        String citynamestyle = request.getParameter("citynamestyle");

	        byte[] bytes = file.getBytes();
	        Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);

	        byte[] bytes2 = file2.getBytes();
	        Blob blob2 = new javax.sql.rowset.serial.SerialBlob(bytes2);

	        City c = new City();
	        c.setCity(city);
	        c.setCitynamestyle(citynamestyle);
	        c.setCityimg1(blob);
	        c.setCityimg2(blob2);

	        msg = cityService.addcity(c);
	        mv.setViewName("addcity");
	        mv.addObject("message", msg);
	        System.out.println("City added: " + msg);
	    } catch (Exception e) {
	        msg = e.getMessage();
	        mv.setViewName("addcity");  // Correcting the view name
	        mv.addObject("message", msg);
	        System.err.println("Error adding city: " + e.getMessage());
	    }
	    return mv;
	}

	@GetMapping("displayhospitalimage")
	public ResponseEntity<byte[]> displayhospitalimage(@RequestParam("id") int id) throws IOException, SQLException {
		Hospital h = hospitalService.viewhospitalbyid(id);
		byte[] himage = null;
		himage = h.getHospitalimage().getBytes(1, (int) h.getHospitalimage().length());
		return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(himage);
	}

	@PostMapping("insertmall")
	public ModelAndView insertmall(HttpServletRequest request, @RequestParam("mallimage") MultipartFile file)
			throws IOException, SerialException, SQLException {
		String msg = null;
		ModelAndView mv = new ModelAndView();
		try {
			String city = request.getParameter("cityname");
			String name = request.getParameter("mallname");
			String description = request.getParameter("malldescription");
			String link = request.getParameter("malllink");

			byte[] bytes = file.getBytes();
			Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);

			Mall m = new Mall();
			m.setName(name);
			m.setDescription(description);
			m.setLink(link);
			m.setImage(blob);
			m.setCity(city);

			msg = mallService.addmall(m);
			System.out.println(msg);
			mv.setViewName("addmall");
			mv.addObject("message", msg);
		} catch (Exception e) {
			msg = e.getMessage();
			System.out.println(msg.toString());
			mv.setViewName("addmall");
			mv.addObject("message", msg);
		}
		return mv;
	}

	@GetMapping("displaymallimage")
	public ResponseEntity<byte[]> displaymallimage(@RequestParam("id") int id) throws IOException, SQLException {
		Mall mall = mallService.viewmallbyid(id);
		byte[] imageBytes = null;
		imageBytes = mall.getImage().getBytes(1, (int) mall.getImage().length());

		return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
	}

	@PostMapping("insertcompany")
	public ModelAndView insertcompany(HttpServletRequest request, @RequestParam("companyimage") MultipartFile file)
			throws IOException, SerialException, SQLException {
		String msg = null;
		ModelAndView mv = new ModelAndView();
		try {
			String city = request.getParameter("cityname");
			String name = request.getParameter("companyname");
			String description = request.getParameter("companydescription");
			String link = request.getParameter("companylink");

			byte[] bytes = file.getBytes();
			Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);

			Company c = new Company();
			c.setCity(city);
			c.setName(name);
			c.setDescription(description);
			c.setLink(link);
			c.setImage(blob);

			msg = companyService.addcompany(c);
			System.out.println(msg);
			mv.setViewName("addcompany");
			mv.addObject("message", msg);
		} catch (Exception e) {
			msg = e.getMessage();
			System.out.println(msg.toString());
			mv.setViewName("addcompany");
			mv.addObject("message", msg);
		}
		return mv;
	}

	@GetMapping("displaycompanyimage")
	public ResponseEntity<byte[]> displaycompanyimage(@RequestParam("id") int id) throws IOException, SQLException {
		Company company = companyService.viewcompanybyid(id);
		byte[] imageBytes = null;
		imageBytes = company.getImage().getBytes(1, (int) company.getImage().length());

		return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
	}

	@PostMapping("insertrestaurant")
	public ModelAndView insertrestaurant(HttpServletRequest request,
			@RequestParam("restaurantimage") MultipartFile file) throws IOException, SerialException, SQLException {
		String msg = null;
		ModelAndView mv = new ModelAndView();
		try {
			String city = request.getParameter("cityname");
			String name = request.getParameter("restaurantname");
			String type = request.getParameter("restauranttype");
			String description = request.getParameter("restaurantdescription");
			String link = request.getParameter("restaurantlink");

			byte[] bytes = file.getBytes();
			Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);

			Restaurant r = new Restaurant();
			r.setCity(city);
			r.setName(name);
			r.setType(type);
			r.setDescription(description);
			r.setLink(link);
			r.setImage(blob);

			msg = restaurantService.addrestaurant(r);
			System.out.println(msg);
			mv.setViewName("addrestaurant");
			mv.addObject("message", msg);
		} catch (Exception e) {
			msg = e.getMessage();
			System.out.println(msg.toString());
			mv.setViewName("addrestaurant");
			mv.addObject("message", msg);
		}
		return mv;
	}

	@GetMapping("displayrestaurantimage")
	public ResponseEntity<byte[]> displayrestaurantimage(@RequestParam("id") int id) throws IOException, SQLException {
		Restaurant restaurant = restaurantService.viewrestaurantbyid(id);
		byte[] imageBytes = null;
		imageBytes = restaurant.getImage().getBytes(1, (int) restaurant.getImage().length());

		return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
	}

	@GetMapping("addeducation")
	public ModelAndView addeducation(HttpServletRequest request) {

		if (request.getSession().getAttribute("user") == null) {
			// If not logged in, redirect to adminlogin
			return new ModelAndView("redirect:/adminlogin");
		}

		ModelAndView mv = new ModelAndView("addeducation");
		List<City> list = cityService.viewallcities();
		mv.addObject("clist", list);
		return mv;
	}

	@PostMapping("inserteducation")
	public ModelAndView inserteducation(HttpServletRequest request, @RequestParam("educationimage") MultipartFile file)
			throws IOException, SerialException, SQLException {
		String msg = null;
		ModelAndView mv = new ModelAndView();
		try {
			String city = request.getParameter("cityname");
			String name = request.getParameter("educationname");
			String address = request.getParameter("educationaddress");
			String mobile = request.getParameter("educationmobile");
			String email = request.getParameter("educationemail");
			String link = request.getParameter("educationlink");

			byte[] bytes = file.getBytes();
			Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);

			Education e = new Education();
			e.setCity(city);
			e.setName(name);
			e.setAddress(address);
			e.setMobile(mobile);
			e.setEmail(email);
			e.setLink(link);
			e.setImage(blob);

			msg = educationService.addeducation(e);
			System.out.println(msg);
			mv.setViewName("addeducation");
			mv.addObject("message", msg);
		} catch (Exception e) {
			msg = e.getMessage();
			System.out.println(msg.toString());
			mv.setViewName("addeducation");
			mv.addObject("message", msg);
		}
		return mv;
	}

	@GetMapping("displayeducationimage")
	public ResponseEntity<byte[]> displayeducationimage(@RequestParam("id") int id) throws IOException, SQLException {
		Education education = educationService.vieweducationbyid(id);
		byte[] imageBytes = null;
		imageBytes = education.getImage().getBytes(1, (int) education.getImage().length());

		return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
	}
}
