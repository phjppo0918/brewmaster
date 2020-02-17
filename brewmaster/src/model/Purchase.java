package model;

import java.util.Date;

public class Purchase {
	private int pur_no;
	private int p_no;
	private int amount;
	private int pur_price_total;
	private String u_id;
	private Date pur_time;
	private String add_up;
	private String add_doro;
	private String add_jibun;
	private String add_detail;
	private String order_request;
	private String invoice;
	
	public Purchase() {
		super();
	}
	
	public String getInvoice() {
		return invoice;
	}

	public void setInvoice(String invoice) {
		this.invoice = invoice;
	}

	public Purchase(int p_no, int amount, int pur_price_total, String u_id, String add_up, String add_doro,
			String add_jibun, String add_detail, String order_request) {
		super();
		this.p_no = p_no;
		this.amount = amount;
		this.pur_price_total = pur_price_total;
		this.u_id = u_id;
		this.add_up = add_up;
		this.add_doro = add_doro;
		this.add_jibun = add_jibun;
		this.add_detail = add_detail;
		this.order_request = order_request;
	}


	public int getPur_no() {
		return pur_no;
	}
	public void setPur_no(int pur_no) {
		this.pur_no = pur_no;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPur_price_total() {
		return pur_price_total;
	}
	public void setPur_price_total(int pur_price_total) {
		this.pur_price_total = pur_price_total;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public Date getPur_time() {
		return pur_time;
	}
	public void setPur_time(Date pur_time) {
		this.pur_time = pur_time;
	}
	public String getAdd_up() {
		return add_up;
	}
	public void setAdd_up(String add_up) {
		this.add_up = add_up;
	}
	public String getAdd_doro() {
		return add_doro;
	}
	public void setAdd_doro(String add_doro) {
		this.add_doro = add_doro;
	}
	public String getAdd_jibun() {
		return add_jibun;
	}
	public void setAdd_jibun(String add_jibun) {
		this.add_jibun = add_jibun;
	}
	public String getAdd_detail() {
		return add_detail;
	}
	public void setAdd_detail(String add_detail) {
		this.add_detail = add_detail;
	}
	public String getOrder_request() {
		return order_request;
	}
	public void setOrder_request(String order_request) {
		this.order_request = order_request;
	}
	
	
}
