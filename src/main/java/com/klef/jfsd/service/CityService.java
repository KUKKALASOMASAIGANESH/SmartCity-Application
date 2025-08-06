package com.klef.jfsd.service;

import java.util.List;
import com.klef.jfsd.model.City;

public interface CityService {
    String addcity(City c);
    List<City> viewallcities();
    City viewcitybyid(int id);
    String updatecity(City c);
	long citiescount();
}
