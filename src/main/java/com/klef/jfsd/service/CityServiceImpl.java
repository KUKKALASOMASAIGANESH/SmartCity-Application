package com.klef.jfsd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.model.City;
import com.klef.jfsd.repository.CityRepository;

@Service
public class CityServiceImpl implements CityService
{

	@Autowired
	private CityRepository cityRepository;
	
	@Override
	public String addcity(City c) {
		cityRepository.save(c);
		return "City Added Successfully";
	}

	@Override
	public City viewcitybyid(int id) {
		return cityRepository.findById(id).get();
	}

	@Override
	public List<City> viewallcities() {
		return (List<City>)cityRepository.findAll();
	}

	@Override
	public String updatecity(City c) {
		
		City city = cityRepository.findById(c.getId()).get();
		city.setCity(c.getCity());
		city.setCitynamestyle(c.getCitynamestyle());
		city.setCityimg1(c.getCityimg1());
		city.setCityimg2(c.getCityimg2());
		cityRepository.save(city);
		return "City details updated Successfully";
	}

	@Override
	public long citiescount() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	

}
