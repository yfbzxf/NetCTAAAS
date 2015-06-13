package com.ct.entity;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Bill {

	private Integer bill_id;
	private Integer account_id;
	private String bill_month;
	private Double cost;
	private String payment_mode;
	private String pay_state;
	
	private List<BillItem> billItems;
	private Account account;

	public Integer getBill_id() {
		return bill_id;
	}
	public void setBill_id(Integer bill_id) {
		this.bill_id = bill_id;
	}
	public Integer getAccount_id() {
		return account_id;
	}
	public void setAccount_id(Integer account_id) {
		this.account_id = account_id;
	}
	public String getBill_month() {
		return bill_month;
	}
	public void setBill_month(String bill_month) {
		this.bill_month = bill_month;
	}
	public Double getCost() {
		return cost;
	}
	public void setCost(Double cost) {
		this.cost = cost;
	}
	public String getPayment_mode() {
		return payment_mode;
	}
	public void setPayment_mode(String payment_mode) {
		this.payment_mode = payment_mode;
	}
	public String getPay_state() {
		return pay_state;
	}
	public void setPay_state(String pay_state) {
		this.pay_state = pay_state;
	}
	public List<BillItem> getBillItems() {
		return billItems;
	}
	public void setBillItems(List<BillItem> billItems) {
		this.billItems = billItems;
	}
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	
}