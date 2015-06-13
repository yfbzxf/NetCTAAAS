package com.ct.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ct.dao.BillDao;
import com.ct.dao.DAOException;
import com.ct.dao.ServiceDao;
import com.ct.entity.Bill;
import com.ct.entity.BillItem;
import com.ct.entity.Service;
import com.ct.entity.ServiceDetail;
import com.ct.entity.page.BillPage;



@Controller
@RequestMapping("/bill")
@SessionAttributes("BillPage")
public class BillController extends BaseController {
	
	@Resource
	private ServiceDao serviceDao;
	@Resource
	private BillDao billDao;
	
	@RequestMapping("/findBill.do")
	public String findBill(BillPage page, Model model) throws DAOException {
		page.setRows(billDao.totalPages(page));
		model.addAttribute("billPage", page);
		List<Bill>bills = billDao.findPage(page);
		model.addAttribute("bills", bills);
		
		return "bill/bill_list";
	}
	
	@RequestMapping("/bill_item.do")
	public String bill_item(@RequestParam("bill_id") int bill_id,BillPage page, Model model) throws DAOException {
		page.setRows(billDao.totalPages(page));
		model.addAttribute("billPage", page);
		List<BillItem> billItems = billDao.findBillItemPage(bill_id);
		model.addAttribute("billItems", billItems);
		Bill bill=billDao.findId(bill_id);
		model.addAttribute("bill", bill);
		
		List<String> durations = new ArrayList<String>();
		String month;
		BillPage billPage=new BillPage();
		for (BillItem bi:billItems) {
			billPage.setService_id(bi.getService().getService_id());
			billPage.setMonthh(bill.getBill_month());
			if(billDao.duraction(billPage)!=null){
				int n = billDao.duraction(billPage);
				String str = (n / 3600) + "小时" + (n / 60 % 60) + "分钟" + (n % 60) + "秒";
				durations.add(str);
			}
			
			
		}
		month = bill.getBill_month().substring(0,4) + "年" + bill.getBill_month().substring(4) + "月";
		model.addAttribute("month", month);
		model.addAttribute("durations", durations);
		
		return "bill/bill_item";
	}
	@RequestMapping("/bill_service_detail.do")
	public String bill_service_detail(@RequestParam("cost")double cost,@RequestParam("month")String month,@RequestParam("service_id")int service_id, @RequestParam("bill_id") int bill_id,BillPage page, Model model){
			
		
		page.setCost(cost);
		page.setMonthh(month);
		page.setService_id(service_id);
		page.setBill_id(bill_id);
		page.setMonthStr(month.substring(0,4) + "年" + month.substring(4) + "月");
		List<ServiceDetail> serviceDetails = serviceDao.findService_Detail(page);
		model.addAttribute("serviceDetails",serviceDetails);
		page.setRows(serviceDao.findService_DetailRows(page));
		model.addAttribute("BillPage", page);
		Service service = serviceDao.findById(service_id);
		model.addAttribute("service", service);
		return "bill/bill_service_detail";
		
	}

}
