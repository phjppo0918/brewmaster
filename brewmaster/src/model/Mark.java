package model;

import java.util.Date;

public class Mark {
	private String u_id;
	private int p_no;
	private String p_image;
	private String p_name;
	private int p_price;
	private Date mark_time;
	
	public Mark() {
		super();
	}

	
	public Mark(String u_id, int p_no, String p_image, String p_name, int p_price, Date mark_time) {
		super();
		this.u_id = u_id;
		this.p_no = p_no;
		this.p_image = p_image;
		this.p_name = p_name;
		this.p_price = p_price;
		this.mark_time = mark_time;
	}




	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getP_image() {
		return p_image;
	}

	public void setP_image(String p_image) {
		this.p_image = p_image;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public Date getMark_time() {
		return mark_time;
	}

	public void setMark_time(Date mark_time) {
		this.mark_time = mark_time;
	}
	
	
	
	
	
}
