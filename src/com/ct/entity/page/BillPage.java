package com.ct.entity.page;

public class BillPage extends Page {
	String idcard_no;
	String login_name; 
	Integer bill_id;
	Integer service_id;
	String real_name;
	Integer year;
	Integer month;
	String  monthh;
	Double cost;
	String monthStr;
	public String getIdcard_no() {
		return idcard_no;
	}
	public void setIdcard_no(String idcard_no) {
		this.idcard_no = idcard_no;
	}
	public String getLogin_name() {
		return login_name;
	}
	public void setLogin_name(String login_name) {
		this.login_name = login_name;
	}
	public String getReal_name() {
		return real_name;
	}
	public void setReal_name(String real_name) {
		this.real_name = real_name;
	}
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	public Integer getMonth() {
		return month;
	}
	public void setMonth(Integer month) {
		this.month = month;
	}
	public Integer getBill_id() {
		return bill_id;
	}
	public void setBill_id(Integer bill_id) {
		this.bill_id = bill_id;
	}
	public Integer getService_id() {
		return service_id;
	}
	public void setService_id(Integer service_id) {
		this.service_id = service_id;
	}
	public Double getCost() {
		return cost;
	}
	public void setCost(Double cost) {
		this.cost = cost;
	}
	public String getMonthh() {
		return monthh;
	}
	public void setMonthh(String monthh) {
		this.monthh = monthh;
	}
	public String getMonthStr() {
		return monthStr;
	}
	public void setMonthStr(String monthStr) {
		this.monthStr = monthStr;
	}
	
	

}
