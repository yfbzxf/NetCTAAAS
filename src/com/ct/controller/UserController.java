package com.ct.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ct.dao.AdminDao;
import com.ct.dao.DAOException;
import com.ct.dao.RoleDao;
import com.ct.entity.Admin;
import com.ct.entity.Module;
import com.ct.entity.page.AdminPage;
import com.ct.entity.page.UserPage;

@Controller
@RequestMapping("/user")
@SessionAttributes("userPage")
public class UserController extends BaseController {
	@Resource
	private AdminDao adminDao;
	
	@Resource
	private RoleDao roleDao;

	@RequestMapping("/userInfo.do")
	public String userInfo(HttpSession session,UserPage page, Model model) {
		Admin admin=(Admin) session.getAttribute("admin");
//		model.addAttribute("admin", admin);
		page.setRoleName(roleDao.findRoleNameByAdminId((admin.getAdmin_id())));
		model.addAttribute("UserPage",page);
		return "user/user_info";
	}
	@RequestMapping("/save_user_info.do")
	public String update(HttpSession session,Admin admin, Model model) {
		adminDao.updateAdmin(admin);
		Admin admin2=(Admin) session.getAttribute("admin");
		admin2.setName(admin.getName());
		admin2.setEmail(admin.getEmail());
		admin2.setTelephone(admin.getTelephone());
		session.setAttribute("admin", admin2);
		
		return "redirect:userInfo.do";
	}
	@RequestMapping("/tomodifyUser.do")
	public String tomodify(Admin admin, Model model) {
		
		return "user/user_modi_pwd";
	}
	@RequestMapping("/user_modi_pwd.do")
	public String modify(@RequestParam("newPwd")String newPwd,@RequestParam("oldPwd")String oldPwd,HttpSession session, Model model) {
		Admin admin=(Admin) session.getAttribute("admin");
		Admin admin2 =new Admin();
		admin2.setAdmin_id(admin.getAdmin_id());
		admin2.setPassword(newPwd);
		
		System.out.print(admin.getAdmin_id());
		System.out.println(newPwd);
		System.out.println(oldPwd);
		
		if (admin.getPassword().equals(oldPwd)){
			adminDao.updatePasswordByAdmin(admin2);
			model.addAttribute("updateFlag", 1);
			return "redirect:/login/toLogin.do";
		}else model.addAttribute("updateFlag", 2);
		return "user/user_modi_pwd";
	}
	
}

