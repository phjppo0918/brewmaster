package model;

import java.util.*;
import java.sql.*;
import java.util.Date;

public class Fnq {
	private int fnq_no;
	private String u_id; 
	private String fnq_type; 
	private String fnq_title; 
	private String fnq_con; 
	private Date fnq_time; 
	private String fnq_ans; 
	private Date fnq_ans_time; 
	private String fnq_ans_ck;
	public String getFnq_ans_ck() {
		return fnq_ans_ck;
	}
	public void setFnq_ans_ck(String fnq_ans_ck) {
		this.fnq_ans_ck = fnq_ans_ck;
	}
	public Fnq() {
		super();
	}
	public Fnq(int fnq_no, String fnq_ans,Date fnq_ans_time ,String fnq_ans_ck) {
		super();
		this.fnq_no = fnq_no;
		this.fnq_ans = fnq_ans;
		this.fnq_ans_time = fnq_ans_time;
		this.fnq_ans_ck = fnq_ans_ck;
	}
	public Fnq(String u_id, String fnq_type, String fnq_title, String fnq_con) {
		super();
		this.u_id = u_id;
		this.fnq_type = fnq_type;
		this.fnq_title = fnq_title;
		this.fnq_con = fnq_con;
	}

	public int getFnq_no() {
		return fnq_no;
	}

	public void setFnq_no(int fnq_no) {
		this.fnq_no = fnq_no;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getFnq_type() {
		return fnq_type;
	}

	public void setFnq_type(String fnq_type) {
		this.fnq_type = fnq_type;
	}

	public String getFnq_title() {
		return fnq_title;
	}

	public void setFnq_title(String fnq_title) {
		this.fnq_title = fnq_title;
	}

	public String getFnq_con() {
		return fnq_con;
	}

	public void setFnq_con(String fnq_con) {
		this.fnq_con = fnq_con;
	}

	public Date getFnq_time() {
		return fnq_time;
	}

	public void setFnq_time(Date fnq_time) {
		this.fnq_time = fnq_time;
	}

	public String getFnq_ans() {
		return fnq_ans;
	}

	public void setFnq_ans(String fnq_ans) {
		this.fnq_ans = fnq_ans;
	}

	public Date getFnq_ans_time() {
		return fnq_ans_time;
	}

	public void setFnq_ans_time(Date fnq_ans_time) {
		this.fnq_ans_time = fnq_ans_time;
	}
	
	
	
	
}
