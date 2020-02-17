package model;
import java.util.Date;
public class Chh {
	private int ch_code;
	private String ch_way;
	private int ch_price;
	private Date ch_time;
	private String u_id;
	
	public Chh() {
		super();
	}
	
	public Chh(String ch_way, int ch_price, Date ch_time, String u_id) {
		super();
		this.ch_way = ch_way;
		this.ch_price = ch_price;
		this.ch_time = ch_time;
		this.u_id = u_id;
	}

	
	public int getCh_code() {
		return ch_code;
	}

	public void setCh_code(int ch_code) {
		this.ch_code = ch_code;
	}

	public String getCh_way() {
		return ch_way;
	}

	public void setCh_way(String ch_way) {
		this.ch_way = ch_way;
	}

	public int getCh_price() {
		return ch_price;
	}

	public void setCh_price(int ch_price) {
		this.ch_price = ch_price;
	}

	public Date getCh_time() {
		return ch_time;
	}

	public void setCh_time(Date ch_time) {
		this.ch_time = ch_time;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	
	
}