package com.ct.entity;

import java.util.List;
/*
 * û�б�Ҫ����
 * �д��Ľ�
 * 
 */
public class Report {
	private String tag = "1";//tag=1ʹ��ʱ����tag=2ʱ�����а�tag=3�ʷ�ʹ����
	private List<ReportCostUsed> reportCostUseds;//���ʷ�ʹ������б���Ϣ
	private List<ReportSumDuration> reportSumDurations;//�û�ʹ��ʱ���б���Ϣ
	private List<String> months;//�·ݵĸ�ʽ��ʾ
	private List<String> durations;//ʱ���ĸ�ʽ��ʾ
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
