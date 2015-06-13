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
        <script language="javascript" type="text/javascript">
         $(function(){
            	$('.bill_off').removeClass().addClass("bill_on");
            });
        </script>
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
        <!--主要区域开始-->
        <div id="main">            
                <!--查询-->
                <div class="search_add">                        
                    <div>账务账号：<span class="readonly width70">${bill.account.login_name }</span></div>                            
                    <div>身份证：<span class="readonly width150">${bill.account.idcard_no }</span></div>
                    <div>姓名：<span class="readonly width70">${bill.account.real_name }</span></div>
                    <div>计费时间：<span class="readonly width70">${month}</span></div>
                    <div>总费用：<span class="readonly width70">${bill.cost }</span></div>
                    <input type="button" value="返回" class="btn_add" onclick="location.href='findBill.do';" />
                </div>  
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                        <tr>
                            <th class="width70">账单明细ID</th>
                            <th class="width150">OS 账号</th>
                            <th class="width150">服务器 IP</th>
                            <th class="width70">账务账号ID</th>
                            <th class="width150">时长</th>
                            <th>费用</th>
                            <th class="width150">资费</th>
                            <th class="width50">${bill.account_id }</th>
                        </tr>
                        <c:forEach items="${billItems}" var="billItem" varStatus="i">                        
                        <tr>
                            <td>${billItem.item_id }</td>
                            <td>${billItem.service.os_username }</td>
                            <td>${billItem.service.unix_host }</td>
                            <td>${bill.account.account_id }</td>
                            <td>${durations[i.index] }</td>
                            <td>${billItem.cost }</td>
                            <td>${billItem.costname }</td>
                            <td><a href="bill_service_detail.do?service_id=${billItem.service.service_id}&month=${bill.bill_month}&cost=${billItem.cost }&bill_id=${bill.bill_id}" 
                            title="业务详单">详单</a></td>
                        </tr>
                        </c:forEach>                       
                    </table>
                </div>
                <!--分页-->
                <div id="pages">
				<a href="findBill.do?billPage=1">首页</a>
				<c:choose>
					<c:when test="${billPage.currentPage==1 }">
						<a href="#">上一页</a>
					</c:when>
					<c:otherwise>
						<a href="bill_item.do?currentPage=${billPage.currentPage-1 }">上一页</a>
					</c:otherwise>
				</c:choose>

				<c:forEach begin="1" end="${billPage.totalPage }" var="p">
					<c:choose>
						<c:when test="${p==billPage.currentPage }">
							<a href="bill_item.do?currentPage=${p }" class="current_page">${p
								}</a>
						</c:when>
						<c:otherwise>
							<a href="bill_item.do?currentPage=${p }">${p }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:choose>
					<c:when test="${billPage.currentPage==billPage.totalPage }">
						<a href="#">下一页</a>
					</c:when>
					<c:otherwise>
						<a href="bill_item.do?currentPage=${billPage.currentPage+1 }">下一页</a>
					</c:otherwise>
				</c:choose>
				<a href="bill_item.do?currentPage=${billPage.totalPage }">末页</a>
			</div>
		
		</div>
        <!--主要区域结束-->
        <div id="footer">
            <jsp:include page="/WEB-INF/main/foot.jsp" />
        </div>
    </body>
</html>
