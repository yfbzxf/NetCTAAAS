<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>中国电信－NetCTAAAS</title>
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css" />        
        <script type="text/javascript" src="../js/jquery-1.4.3.js" ></script>
        
    </head>
    <body>
    	<div id="header">
			<jsp:include page="/WEB-INF/main/head.jsp" />
		</div>
		<!--Logo区域结束-->
		<!--导航区域开始-->
		<div id="navi">
			<jsp:include page="/WEB-INF/main/menu.jsp" />
		</div>        
        <div id="report_main">
        	<div class="tabs">
    	        <ul>
        	        <li><a href="findReport.do?tag=1" id="tag1" class="tab_out" title="每位客户每月的累计时长">客户使用时长</a></li>
                    <li><a href="findReport.do?tag=2" id="tag2" class="tab_out" title="每台服务器上累计时长最高的前三名客户">时长排行榜</a></li>
                    <li><a href="findReport.do?tag=3" id="tag3" class="tab_out" title="每台服务器每种资费标准的使用次数">资费使用率</a></li>
                </ul>
            </div>            
            <div class="report_box">
            
                <!--数据区域：用表格展示数据-->
                <div id="report_data">
                    <table id="datalist">
                    <c:choose>
                    <c:when test="${tag==1}">
                     	<tr>                            
                            <th>账号 ID</th>
                            <th>账务帐号</th>
                            <th>客户名称</th>
                            <th class="width200">身份证号码</th>
                            <th>电话</th>
                            <th class="width150">月份</th>
                            <th class="width150">累积时长</th>
                        </tr>
                        <c:forEach items="${reportSumDurations }" var="sd" varStatus="i">
                                           
                        <tr>
                            <td>${sd.account_id}</td>
                            <td>${sd.login_name}</td>
                            <td>${sd.real_name }</td>
                            <td>${sd.idcard_no }</td>
                            <td>${sd.telephone}</td>
                            <td>${months[i.index]}</td>
                            <td>${durations[i.index]}</td>
                        </tr>
                        </c:forEach>
                    </c:when>
                    <c:when test="${tag==2}">
                        <tr>
                            <th>Unix 服务器IP</th>
                            <th>账务账号</th>
                            <th>客户名称</th>
                            <th>身份证号码</th>
                            <th>累计时长</th>
                        </tr>
                        <c:forEach items="${reportSumDurations }" var="sd" varStatus="i">
                        <tr>
                        	<td>${sd.unixHost}</td>
                        	<td>${sd.login_name}</td>
                        	<td>${sd.real_name}</td>
                        	<td>${sd.idcard_no}</td>
                        	<td>${durations[i.index]}</td>
                        </tr>
                        </c:forEach>
                        </c:when> 
                    	<c:when test="${tag==3}">
                        <tr>
                            <th>Unix 服务器IP</th>
                            <th>包月</th>
                            <th>套餐</th>
                            <th>计时</th>
                        </tr>
                        <c:forEach items="${reportCostUseds }" var="reportCostUsed" >            
                        <tr>
                        	<td>${reportCostUsed.host}</td>
                        	<td>${reportCostUsed.monthlycount}</td>
                        	<td>${reportCostUsed.packagecount}</td>
                        	<td>${reportCostUsed.timebasedcount}</td>
                        </tr>
                        </c:forEach>
                        </c:when>
                        </c:choose>                        
                    </table>
                </div>
                <!--分页-->
                <!--分页-->
			<div id="pages">
				<c:choose>
					<c:when test="${reportPage.currentPage==1 }">
						<a href="#">上一页</a>
					</c:when>
					<c:otherwise>
						<a href="findReport.do?currentPage=${reportPage.currentPage-1 }">上一页</a>
					</c:otherwise>
				</c:choose>

				<c:forEach begin="1" end="${reportPage.totalPage }" var="p">
					<c:choose>
						<c:when test="${p==reportPage.currentPage }">
							<a href="findReport.do?currentPage=${p }" class="current_page">${p
								}</a>
						</c:when>
						<c:otherwise>
							<a href="findReport.do?currentPage=${p }">${p }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:choose>
					<c:when test="${reportPage.currentPage==reportPage.totalPage }">
						<a href="#">下一页</a>
					</c:when>
					<c:otherwise>
						<a href="findReport.do?currentPage=${reportPage.currentPage+1 }">下一页</a>
					</c:otherwise>
				</c:choose>
			</div>
		
	</div>
	</div>
        <!--主要区域结束-->
        <div id="footer">
            <jsp:include page="/WEB-INF/main/foot.jsp" />
        </div>
    </body>
</html>
