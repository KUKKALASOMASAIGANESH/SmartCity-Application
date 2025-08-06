package com.klef.jfsd.model;

import java.sql.Blob;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "city_table")
public class City 
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "city", length=100)
    private String city;

    @Column(name = "citynamestyle", length=100)
    private String citynamestyle;

    private Blob cityimg1;
    private Blob cityimg2;

    @Column(name = "maplink", length = 1000)
    private String maplink;

    // Getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public String getCitynamestyle() { return citynamestyle; }
    public void setCitynamestyle(String citynamestyle) { this.citynamestyle = citynamestyle; }

    public Blob getCityimg1() { return cityimg1; }
    public void setCityimg1(Blob cityimg1) { this.cityimg1 = cityimg1; }

    public Blob getCityimg2() { return cityimg2; }
    public void setCityimg2(Blob cityimg2) { this.cityimg2 = cityimg2; }

    public String getMaplink() { return maplink; }
    public void setMaplink(String maplink) { this.maplink = maplink; }

    @Override
    public String toString() {
        return "City [id=" + id + ", city=" + city + ", citynamestyle=" + citynamestyle +
               ", cityimg1=" + cityimg1 + ", cityimg2=" + cityimg2 + ", maplink=" + maplink + "]";
    }
}
