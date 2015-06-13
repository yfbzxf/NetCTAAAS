package com.ct.dao;

import java.util.List;
import java.util.Map;

import com.ct.annotation.MyBatisRepository;
import com.ct.entity.Module;
import com.ct.entity.Role;
import com.ct.entity.page.Page;

@MyBatisRepository
public interface RoleDao {

	List<Role> findByPage(Page page);

	int findRows(Page page);
	
	List<Module> findAllModules();
	
	Role findById(int id);
	
	String findRoleNameByAdminId(int id);
	
	void saveRole(Role role);
	
	void saveRoleModules(Map<String,Object> roleModules);
	
	void updateRole(Role role);
	
	void deleteRoleModules(int roleId);
	
	void deleteRole(int roleId);
	
}
