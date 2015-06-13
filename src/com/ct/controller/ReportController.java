package com.ct.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ct.dao.DAOException;
import com.ct.dao.ReportDao;
import com.ct.entity.Module;
import com.ct.entity.ReportCostUsed;
import com.ct.entity.ReportSumDuration;
import com.ct.entity.page.AdminPage;
import com.ct.entity.page.Page;
import com.ct.entity.page.ReportPage;

@Controller
@RequestMapping("/report")
@SessionAttributes("Page")
public class ReportController extends BaseController {
	@Resource
	private ReportDao reportDao;
	
	@RequestMapping("/findReport.do")
	public String findReport(ReportPage page, Model model,String tag) {
		try {
			if ("1".equals(tag)) {
				List<ReportSumDuration> reportSumDurations = reportDao.findSumDurationPage(page);
				model.addAttribute("reportSumDurations", reportSumDurations);
				
				page.setRows(reportDao.totalRowsSumDuration(page));;
				model.addAttribute("ReportPage", page);
				
				List<String> months = new ArrayList<String>();
				List<String> durations = new ArrayList<String>();
				for (ReportSumDuration rsd: reportSumDurations) {
					months.add(rsd.getMonth().substring(0, 4) + "年" + rsd.getMonth().substring(4) + "月");
					int n = rsd.getDuration();
					durations.add((n / 3600) + "小时" + (n / 60 % 60) + "分钟" + (n % 60) + "秒");
					
					
				}
				model.addAttribute("months", months);
				model.addAttribute("durations", durations);
									
			} else if ("2".equals(tag)) {
				List<String> hosts = reportDao.findAllHost();
				
				List<ReportSumDuration> list = new ArrayList<ReportSumDuration>();
				for (String host:hosts) {
					list.addAll(reportDao.findThreeDuration(host));
				}
				List<String> durations = new ArrayList<String>();
				for (ReportSumDuration rsd: list) {
					int n = rsd.getDuration();
					durations.add((n / 3600) + "小时" + (n / 60 % 60) + "分钟" + (n % 60) + "秒");
				}
				model.addAttribute("reportSumDurations", list);
				model.addAttribute("durations", durations);
			} else if("3".equals(tag)) {
				List<ReportCostUsed> rcuList= reportDao.findHostPage(page);
				model.addAttribute("reportCostUseds", rcuList);
			    page.setRows(reportDao.totalRowsHost(page));
			    model.addAttribute("ReportPage", page);
			}
		} catch (DAOException e) {
			e.printStackTrace();
			return "error";
		}		
		model.addAttribute("tag", tag);
		return "report/report_list";
	}

}
