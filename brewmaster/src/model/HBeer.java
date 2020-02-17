package model;
import java.util.*;
import java.sql.*;
import java.util.Date;
public class HBeer {
	private int h_beer_no;
	private String h_beer_name;
	private int h_beer_price;
	private double h_beer_alchol;
	private int h_beer_suger;
	private int h_beer_carbonic;
	private String h_beer_detail;
	private String h_beer_explain;
	private String h_beer_image;
	private String h_beer_maker;
	private Date h_beer_time;
	private String h_beer_acc;
	
	public HBeer() {
		super();
	}

	public HBeer(String h_beer_name, int h_beer_price, double h_beer_alchol, int h_beer_suger, int h_beer_carbonic,
			String h_beer_detail, String h_beer_explain, String h_beer_image, String h_beer_maker) {
		super();
		this.h_beer_name = h_beer_name;
		this.h_beer_price = h_beer_price;
		this.h_beer_alchol = h_beer_alchol;
		this.h_beer_suger = h_beer_suger;
		this.h_beer_carbonic = h_beer_carbonic;
		this.h_beer_detail = h_beer_detail;
		this.h_beer_explain = h_beer_explain;
		this.h_beer_image = h_beer_image;
		this.h_beer_maker = h_beer_maker;
	}

	public int getH_beer_no() {
		return h_beer_no;
	}

	public void setH_beer_no(int h_beer_no) {
		this.h_beer_no = h_beer_no;
	}

	public String getH_beer_name() {
		return h_beer_name;
	}

	public void setH_beer_name(String h_beer_name) {
		this.h_beer_name = h_beer_name;
	}

	public int getH_beer_price() {
		return h_beer_price;
	}

	public void setH_beer_price(int h_beer_price) {
		this.h_beer_price = h_beer_price;
	}

	public double getH_beer_alchol() {
		return h_beer_alchol;
	}

	public void setH_beer_alchol(double h_beer_alchol) {
		this.h_beer_alchol = h_beer_alchol;
	}

	public int getH_beer_suger() {
		return h_beer_suger;
	}

	public void setH_beer_suger(int h_beer_suger) {
		this.h_beer_suger = h_beer_suger;
	}

	public int getH_beer_carbonic() {
		return h_beer_carbonic;
	}

	public void setH_beer_carbonic(int h_beer_carbonic) {
		this.h_beer_carbonic = h_beer_carbonic;
	}

	public String getH_beer_detail() {
		return h_beer_detail;
	}

	public void setH_beer_detail(String h_beer_detail) {
		this.h_beer_detail = h_beer_detail;
	}

	public String getH_beer_explain() {
		return h_beer_explain;
	}

	public void setH_beer_explain(String h_beer_explain) {
		this.h_beer_explain = h_beer_explain;
	}

	public String getH_beer_image() {
		return h_beer_image;
	}

	public void setH_beer_image(String h_beer_image) {
		this.h_beer_image = h_beer_image;
	}

	public String getH_beer_maker() {
		return h_beer_maker;
	}

	public void setH_beer_maker(String h_beer_maker) {
		this.h_beer_maker = h_beer_maker;
	}

	public Date getH_beer_time() {
		return h_beer_time;
	}

	public void setH_beer_time(Date h_beer_time) {
		this.h_beer_time = h_beer_time;
	}

	public String getH_beer_acc() {
		return h_beer_acc;
	}

	public void setH_beer_acc(String h_beer_acc) {
		this.h_beer_acc = h_beer_acc;
	}
	
	
}