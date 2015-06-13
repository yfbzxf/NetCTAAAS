package com.ct.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ct.dao.RoleDao;
import com.ct.entity.Module;
import com.ct.entity.Role;
import com.ct.entity.page.RolePage;

@Controller
@RequestMapping("/role")
@SessionAttributes("rolePage")
public class RoleController {

	@Resource
	private RoleDao roleDao;

	@RequestMapping("/findRole.do")
	public String find(RolePage page, Model model) {
		page.setRows(roleDao.findRows(page));
		model.addAttribute("rolePage", page);
		
		List<Role> roles = roleDao.findByPage(page);
		model.addAttribute("roles", roles);
		
		return "role/role_list";
	}

	@RequestMapping("/toAddRole.do")
	public String toAdd(Model model) {
		List<Module> modules = roleDao.findAllModules();
		model.addAttribute("modules", modules);
		return "role/add_role";
	}
	
	@RequestMapping("/addRole.do")
	public String add(Role role, Model model) {
		roleDao.saveRole(role);
		
		List<Integer> moduleIds = role.getModuleIds();
		for (Integer moduleId : moduleIds) {
			Map<String,Object> roleModules = 
					new HashMap<String, Object>();
			roleModules.put("role_id", role.getRole_id());
			roleModules.put("module_id", moduleId);
			roleDao.saveRoleModules(roleModules);
		}
		return "redirect:findRole.do";
	}
	
	@RequestMapping("/toUpdateRole.do")
	public String toUpdate(@RequestParam("id") int id, Model model) {
		List<Module> modules = roleDao.findAllModules();
		model.addAttribute("modules", modules);
		Role role = roleDao.findById(id);
		model.addAttribute("role", role);
		return "role/update_role";
	}
	
	@RequestMapping("/updateRole.do")
	public String update(Role role, Model model) {
		roleDao.updateRole(role);
		
		roleDao.deleteRoleModules(role.getRole_id());
		
		List<Integer> moduleIds = role.getModuleIds();
		for (Integer moduleId : moduleIds) {
			Map<String,Object> roleModules = 
					new HashMap<String, Object>();
			roleModules.put("role_id", role.getRole_id());
			roleModules.put("module_id", moduleId);
			roleDao.saveRoleModules(roleModules);
		}
		
		return "redirect:findRole.do";
	}
	
	@RequestMapping("/deleteRole.do")
	public String delete(@RequestParam("id") int id) {
		roleDao.deleteRoleModules(id);
		roleDao.deleteRole(id);
		return "redirect:findRole.do";
	}

}
