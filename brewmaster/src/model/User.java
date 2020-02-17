package model;
import java.util.*;
import java.sql.*;
import java.sql.Date;
public class User {
	private String u_id;
	private String u_pw;
	private String u_name;
	private String u_ph;
	private int u_money;
	private Date u_birth;
	private String u_email;
	
	public User() {
		super();
	}
	public User(String u_id, String u_pw, String u_name, String u_ph, Date u_birth, String u_email) {
		super();
		this.u_id = u_id;
		this.u_pw = u_pw;
		this.u_name = u_name;
		this.u_ph = u_ph;
		this.u_birth = u_birth;
		this.u_email = u_email;
	}
	
	public int getU_money() {
		return u_money;
	}
	public void setU_money(int u_money) {
		this.u_money = u_money;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_pw() {
		return u_pw;
	}
	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_ph() {
		return u_ph;
	}
	public void setU_ph(String u_ph) {
		this.u_ph = u_ph;
	}
	public Date getU_birth() {
		return u_birth;
	}
	public void setU_birth(Date u_birth) {
		this.u_birth = u_birth;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	

}
