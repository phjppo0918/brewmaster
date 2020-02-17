package model;
import java.util.*;
import java.sql.*;
import java.util.Date;
public class Product {
	private int p_no;
	private String p_name_kr;
	private String p_name_en;
	private String p_kind;
	private int p_price;
	private String p_country;
	private double p_alchol;
	private int p_suger;
	private int p_carbonic;
	private String p_detail;
	private String p_explain;
	private int p_score;
	private String p_image;
	private String p_maker;
	private Date p_time;
	public Product(){
		super();
	}	
	
	
	
	public Product(String p_name_kr, String p_name_en, String p_kind, int p_price, String p_country, double p_alchol,
			int p_suger, int p_carbonic, String p_detail, String p_explain, String p_image) {
		super();
		this.p_name_kr = p_name_kr;
		this.p_name_en = p_name_en;
		this.p_kind = p_kind;
		this.p_price = p_price;
		this.p_country = p_country;
		this.p_alchol = p_alchol;
		this.p_suger = p_suger;
		this.p_carbonic = p_carbonic;
		this.p_detail = p_detail;
		this.p_explain = p_explain;
		this.p_image = p_image;
	}



	public Product(String p_name_kr, String p_name_en, String p_kind, int p_price, String p_country, double p_alchol,
			int p_suger, int p_carbonic, String p_detail, String p_explain, String p_image, String p_maker) {
		super();
		this.p_name_kr = p_name_kr;
		this.p_name_en = p_name_en;
		this.p_kind = p_kind;
		this.p_price = p_price;
		this.p_country = p_country;
		this.p_alchol = p_alchol;
		this.p_suger = p_suger;
		this.p_carbonic = p_carbonic;
		this.p_detail = p_detail;
		this.p_explain = p_explain;
		this.p_image = p_image;
		this.p_maker = p_maker;
	
	}



	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getP_name_kr() {
		return p_name_kr;
	}

	public void setP_name_kr(String p_name_kr) {
		this.p_name_kr = p_name_kr;
	}

	public String getP_name_en() {
		return p_name_en;
	}

	public void setP_name_en(String p_name_en) {
		this.p_name_en = p_name_en;
	}

	public String getP_kind() {
		return p_kind;
	}

	public void setP_kind(String p_kind) {
		this.p_kind = p_kind;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_country() {
		return p_country;
	}

	public void setP_country(String p_country) {
		this.p_country = p_country;
	}

	public double getP_alchol() {
		return p_alchol;
	}

	public void setP_alchol(double p_alchol) {
		this.p_alchol = p_alchol;
	}

	public int getP_suger() {
		return p_suger;
	}

	public void setP_suger(int p_suger) {
		this.p_suger = p_suger;
	}

	public int getP_carbonic() {
		return p_carbonic;
	}

	public void setP_carbonic(int p_carbonic) {
		this.p_carbonic = p_carbonic;
	}

	public String getP_detail() {
		return p_detail;
	}

	public void setP_detail(String p_detail) {
		this.p_detail = p_detail;
	}

	public String getP_explain() {
		return p_explain;
	}

	public void setP_explain(String p_explain) {
		this.p_explain = p_explain;
	}

	public int getP_score() {
		return p_score;
	}

	public void setP_score(int p_score) {
		this.p_score = p_score;
	}

	public String getP_image() {
		return p_image;
	}

	public void setP_image(String p_image) {
		this.p_image = p_image;
	}

	public String getP_maker() {
		return p_maker;
	}

	public void setP_maker(String p_maker) {
		this.p_maker = p_maker;
	}

	public Date getP_time() {
		return p_time;
	}

	public void setP_time(Date p_time) {
		this.p_time = p_time;
	}

	
}