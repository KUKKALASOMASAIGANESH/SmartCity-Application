package com.klef.jfsd.service;

import java.util.List;

import com.klef.jfsd.model.Admin;
import com.klef.jfsd.model.City;
import com.klef.jfsd.model.Customer;

public interface AdminService 
{

public List<Customer> viewallcustomers();
public List<City> viewallcities();
public Customer viewcustomerbyid(int cid);
public String deletecustomer(int cid);

public Admin checkadminlogin(String uname,String pwd);

public long customercount();//count(*)
public long citiescount();
public int updatestatus(int cid,boolean status);

public String deletehotel(int id);
public String deletehospital(int id);
public String deletecompany(int id);
public String deletemall(int id);
public String deleterestaurant(int id);
public String deletecollege(int id);
public String deletequerybyid(int id);

}