package com.klef.jfsd.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
import com.klef.jfsd.repository.AdminRepository;
import com.klef.jfsd.repository.CityRepository;
import com.klef.jfsd.repository.CompanyRepository;
import com.klef.jfsd.repository.ContactRepository;
import com.klef.jfsd.repository.CustomerRepository;
import com.klef.jfsd.repository.EducationRepository;
import com.klef.jfsd.repository.HospitalRepository;
import com.klef.jfsd.repository.HotelRepository;
import com.klef.jfsd.repository.MallRepository;
import com.klef.jfsd.repository.RestaurantRepository;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminRepository adminRepository;

	@Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
	private ContactRepository contactRepository;

	@Autowired
	private CityRepository cityRepository;
	
	@Autowired
	private HotelRepository hotelRepository;
	
	@Autowired
	private HospitalRepository hospitalRepository;
	
	@Autowired
	private CompanyRepository companyRepository;
	
	@Autowired
	private MallRepository mallRepository;
	
	@Autowired
	private RestaurantRepository restaurantRepository;
	
	@Autowired
	private EducationRepository educationRepository;

	@Override
	public List<Customer> viewallcustomers() {

		return customerRepository.findAll();
	}

	@Override
	public Customer viewcustomerbyid(int cid) {
		Optional<Customer> obj = customerRepository.findById(cid);

		if (obj.isPresent()) {
			Customer c = obj.get();

			return c;
		} else {
			return null;
		}
	}

	@Override
	public String deletecustomer(int cid) {
		Optional<Customer> obj = customerRepository.findById(cid);

		String msg = null;

		if (obj.isPresent()) {
			Customer c = obj.get();

			customerRepository.delete(c);

			msg = "Customer Deleted Successfully";
		} else {
			msg = "Customer Not Found";
		}

		return msg;
	}

	@Override
	public Admin checkadminlogin(String uname, String pwd) {
		// TODO Auto-generated method stub
		return adminRepository.checkadminlogin(uname, pwd);
	}

	// Employee active status update
	@Override
	public int updatestatus(int cid, boolean status) {

		return adminRepository.updatestatus(cid, status);

	}

	@Override
	public long customercount() {

		return customerRepository.count();
	}

	@Override
	public List<City> viewallcities() {
		return cityRepository.findAll();
	}

	@Override
	public String deletehotel(int id) {
		Hotel h = hotelRepository.findById(id).get();
		hotelRepository.delete(h);
		return "Hotel Deleted Successfully";
	}

	@Override
	public String deletehospital(int id) {
		Hospital hp = hospitalRepository.findById(id).get();
		hospitalRepository.delete(hp);
		return "Hospital Deleted Successfully";
	}

	@Override
	public String deletecompany(int id) {
		Company c  = companyRepository.findById(id).get();
		companyRepository.delete(c);
		return "Company Deleted Successfully";
	}

	@Override
	public String deletemall(int id) {
		Mall m = mallRepository.findById(id).get();
		mallRepository.delete(m);
		return "Mall Deleted Successfully";
	}

	@Override
	public String deleterestaurant(int id) {
		Restaurant r = restaurantRepository.findById(id).get();
		restaurantRepository.delete(r);
		return "Restaurant Deleted Successfully";
	}

	@Override
	public String deletecollege(int id) {
		Education e = educationRepository.findById(id).get();
		educationRepository.delete(e);
		return "Institution Deleted Successfully";
	}

	@Override
	public String deletequerybyid(int id) {
		Contactus c = contactRepository.findById(id).get();
		contactRepository.delete(c);
		return "Query Deleted";
	}

	@Override
	public long citiescount() {
		// TODO Auto-generated method stub
		return cityRepository.count();
	}

}