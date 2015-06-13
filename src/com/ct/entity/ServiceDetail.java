package com.ct.entity;

import java.util.Date;

public class ServiceDetail {

	private Integer service_detail_id;
	private Integer service_id;
	private String client_host;
	private String os_username;
	private Integer pid;
	private Date login_time;
	private Date logout_time;
	private Integer duration;
	private Double cost;
	public Integer getService_detail_id() {
		return service_detail_id;
	}
	public void setService_detail_id(Integer service_detail_id) {
		this.service_detail_id = service_detail_id;
	}
	public Integer getService_id() {
		return service_id;
	}
	public void setService_id(Integer service_id) {
		this.service_id = service_id;
	}
	public String getClient_host() {
		return client_host;
	}
	public void setClient_host(String client_host) {
		this.client_host = client_host;
	}
	public String getOs_username() {
		return os_username;
	}
	public void setOs_username(String os_username) {
		this.os_username = os_username;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public Date getLogin_time() {
		return login_time;
	}
	public void setLogin_time(Date login_time) {
		this.login_time = login_time;
	}
	public Date getLogout_time() {
		return logout_time;
	}
	public void setLogout_time(Date logout_time) {
		this.logout_time = logout_time;
	}
	public Integer getDuration() {
		return duration;
	}
	public void setDuration(Integer duration) {
		this.duration = duration;
	}
	public Double getCost() {
		return cost;
	}
	public void setCost(Double cost) {
		this.cost = cost;
	}

	
}