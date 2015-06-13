package com.ct.dao;


import java.util.List;
import java.util.Map;

import com.ct.annotation.MyBatisRepository;
import com.ct.entity.ReportCostUsed;
import com.ct.entity.ReportSumDuration;
import com.ct.entity.page.Page;



@MyBatisRepository
public interface ReportDao {
	//��ҳ��ѯunix������hostͳ���ʷ�ʹ�����
	List<ReportCostUsed> findHostPage(Page page) throws DAOException;
	//unix����������
	int totalRowsHost(Page page) throws DAOException;
	//��host����ȡ��ȫ��unixId
	List<String> findAllHost() throws DAOException;
	//��ҳ��ѯ�û�ʹ��ʱ��
	List<ReportSumDuration> findSumDurationPage(Page page) throws DAOException;
	//�û�ʹ��ʱ����¼ҳ��
	int totalRowsSumDuration(Page page) throws DAOException;
	//ȡ��ָ��������ʱ��ǰ3λ
	List<ReportSumDuration> findThreeDuration(String unixHost) throws DAOException;

	
}
