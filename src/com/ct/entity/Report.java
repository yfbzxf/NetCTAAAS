package com.ct.entity;

import java.util.List;
/*
 * 没有必要出现
 * 有待改进
 * 
 */
public class Report {
	private String tag = "1";//tag=1使用时长，tag=2时长排行榜，tag=3资费使用率
	private List<ReportCostUsed> reportCostUseds;//存资费使用情况列表信息
	private List<ReportSumDuration> reportSumDurations;//用户使用时长列表信息
	private List<String> months;//月份的格式显示
	private List<String> durations;//时长的格式显示
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public List<ReportCostUsed> getReportCostUseds() {
		return reportCostUseds;
	}
	public void setReportCostUseds(List<ReportCostUsed> reportCostUseds) {
		this.reportCostUseds = reportCostUseds;
	}
	public List<ReportSumDuration> getReportSumDurations() {
		return reportSumDurations;
	}
	public void setReportSumDurations(List<ReportSumDuration> reportSumDurations) {
		this.reportSumDurations = reportSumDurations;
	}
	public List<String> getMonths() {
		return months;
	}
	public void setMonths(List<String> months) {
		this.months = months;
	}
	public List<String> getDurations() {
		return durations;
	}
	public void setDurations(List<String> durations) {
		this.durations = durations;
	}
	

}
