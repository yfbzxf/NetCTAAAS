package com.ct.dao;


import java.util.List;
import java.util.Map;

import com.ct.annotation.MyBatisRepository;
import com.ct.entity.ReportCostUsed;
import com.ct.entity.ReportSumDuration;
import com.ct.entity.page.Page;



@MyBatisRepository
public interface ReportDao {
	//分页查询unix服务器host统计资费使用情况
	List<ReportCostUsed> findHostPage(Page page) throws DAOException;
	//unix服务器个数
	int totalRowsHost(Page page) throws DAOException;
	//从host表中取出全部unixId
	List<String> findAllHost() throws DAOException;
	//分页查询用户使用时长
	List<ReportSumDuration> findSumDurationPage(Page page) throws DAOException;
	//用户使用时长记录页数
	int totalRowsSumDuration(Page page) throws DAOException;
	//取出指定服务器时长前3位
	List<ReportSumDuration> findThreeDuration(String unixHost) throws DAOException;

	
}
