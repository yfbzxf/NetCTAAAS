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
            <form action="" method="post">
                <!--查询-->
                <div class="search_add">                        
                    <div>账务账号：<span class="readonly width70">${billPage.login_name }</span></div>                            
                    <div>OS 账号：<span class="readonly width100">${service.os_username }</span></div>
                    <div>服务器 IP：<span class="readonly width100">${service.unix_host }</span></div>
                    <div>计费时间：<span class="readonly width70">${billPage.monthStr}</span></div>
                    <div>费用：<span class="readonly width70">${billPage.cost}</span></div>
                    <input type="button" value="返回" class="btn_add" onclick="location.href='bill_item.do?bill_Id=${bill_id}';" />
                </div>  
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                        <tr>
                            <th class="width150">客户登录 IP</th>
                            <th class="width150">登入时刻</th>
                            <th class="width150">登出时刻</th>
                            <th class="width100">时长（秒）</th>
                            <th class="width150">费用</th>
                            <th>资费</th>
                        </tr>
                        <c:forEach items="${serviceDetails }" var="serviceDetail">
	                        <tr>
	                            <td>${serviceDetail.client_host}</td>
	                            <td>${serviceDetail.login_time }</td>
	                            <td>${serviceDetail.logout_time }</td>
	                            <td>${serviceDetail.duration }</td>
	                            <td>${serviceDetail.cost }</td>
	                            <td>${service.costname}</td>
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
						<a href="bill_service_detail.do?currentPage=${billPage.currentPage-1 }">上一页</a>
					</c:otherwise>
				</c:choose>

				<c:forEach begin="1" end="${billPage.totalPage }" var="p">
					<c:choose>
						<c:when test="${p==billPage.currentPage }">
							<a href="bill_service_detail.do?currentPage=${p }" class="current_page">${p
								}</a>
						</c:when>
						<c:otherwise>
							<a href="bill_service_detail.do?currentPage=${p }">${p }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:choose>
					<c:when test="${billPage.currentPage==billPage.totalPage }">
						<a href="#">下一页</a>
					</c:when>
					<c:otherwise>
						<a href="bill_service_detail.do?currentPage=${billPage.currentPage+1 }">下一页</a>
					</c:otherwise>
				</c:choose>
				<a href="bill_service_detail.do?currentPage=${billPage.totalPage }">末页</a>
			</div>                     
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
            <jsp:include page="/WEB-INF/main/foot.jsp" />
        </div>
    </body>
</html>
