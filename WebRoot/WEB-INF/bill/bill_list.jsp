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
            //写入下拉框中的年份和月份
            function initialYearAndMonth() {
                //写入最近3年
                var yearObj = document.getElementById("selYears");
                var year = (new Date()).getFullYear();
                for (var i = 0; i <= 2; i++) {
                    var opObj = new Option(year - i, year - i);
                    yearObj.options[i] = opObj;
                    var year1 = '${year}';
                    if (year - i == year1) {
                    	opObj.selected = true;
                    }
                }
                //写入 12 月
                var monthObj = document.getElementById("selMonths");
                var opObj = new Option("全部", "0");
                monthObj.options[0] = opObj;
                for (var i = 1; i <= 12; i++) {
                    var opObj = new Option(i, i);
                    monthObj.options[i] = opObj;
                    var month1 = '${month}';
                    if (month1 == i) {
                    	opObj.selected = true;
                    }
                }
            }
            function changePage(page){
            	var form = document.getElementById(
        				"searchForm");
        		form.action = "bill_list?page="+page;
        		form.submit();//提交搜索表单
        		return false;//阻止href动作
            }
            $(function(){
            	$('.bill_off').removeClass().addClass("bill_on");
            });
        </script>
    </head>
    <body onload="initialYearAndMonth();">
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
            <form action="findBill.do" method="post" id="searchForm" >
                <!--查询-->
                <div class="search_add">                        
                    <div>身份证：<input type="text" class="text_search" name="idcard_no" value="${billPage.idcard_no }" /></div>
                    <div>账务账号：<input type="text" class="text_search" name="login_name" value="${billPage.login_name }" /></div>                            
                    <div>姓名：<input type="text" class="text_search" name="real_name" value="${billPage.real_name }" /></div>
                    <div>
                        <select class="select_search" id="selYears" name="year" >
                        </select>
                        年
                        <select class="select_search" id="selMonths" name="month">
                        </select>
                        月
                    </div>
                    <div><input type="submit" value="搜索" class="btn_search" /></div>
                </div>
                </form>  
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                    <tr>
                        <th class="width50">账单ID</th>
                        <th class="width70">姓名</th>
                        <th class="width150">身份证</th>
                        <th class="width150">账务账号</th>
                        <th>费用</th>
                        <th class="width100">月份</th>
                        <th class="width100">支付方式</th>
                        <th class="width100">支付状态</th>                                                        
                        <th class="width50"></th>
                    </tr>
                    <c:forEach items="${bills }" var="bill">
                    
                    <tr>
                        <td>${bill.bill_id}</td>
                        <td>${bill.account.real_name}</td>
                        <td>${bill.account.idcard_no}</td>
                        <td>${bill.account.login_name}</td>
                        <td>${bill.cost}</td>
                        <td>${bill.bill_month}</td>
                        <td><c:choose>
                        	<c:when test="${bill.payment_mode == 0}">现金</c:when>
                        	<c:when test="${bill.payment_mode == 1}">银行转账</c:when>
                        	<c:when test="${bill.payment_mode == 2}">邮局汇款</c:when>
                        	<c:when test="${bill.payment_mode == 3}">其他</c:when>
                        	</c:choose>
                        </td>
                        <td><c:choose>
                        	<c:when test="${bill.pay_state == 0}">未支付</c:when>
                        	<c:when test="${bill.pay_state == 1}">已支付</c:when>
                        	</c:choose>
                        </td>                            
                        <td><a href="bill_item.do?bill_id=${bill.bill_id}" title="账单明细">明细</a></td>
                    </tr>
                    </c:forEach>                    
                </table>
                
                <p>业务说明：<br />
                1、设计支付方式和支付状态，为用户自服务中的支付功能预留；<br />
                2、只查询近 3 年的账单，即当前年和前两年，如2013/2012/2011；<br />
                3、年和月的数据由 js 代码自动生成；<br />
                4、由数据库中的ｊｏｂ每月的月底定时计算账单数据。</p>
                </div>                    
                <!--分页-->
                <div id="pages">
				<a href="findBill.do?billPage=1">首页</a>
				<c:choose>
					<c:when test="${billPage.currentPage==1 }">
						<a href="#">上一页</a>
					</c:when>
					<c:otherwise>
						<a href="findBill.do?currentPage=${billPage.currentPage-1 }">上一页</a>
					</c:otherwise>
				</c:choose>

				<c:forEach begin="1" end="${billPage.totalPage }" var="p">
					<c:choose>
						<c:when test="${p==billPage.currentPage }">
							<a href="findBill.do?currentPage=${p }" class="current_page">${p
								}</a>
						</c:when>
						<c:otherwise>
							<a href="findBill.do?currentPage=${p }">${p }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:choose>
					<c:when test="${billPage.currentPage==billPage.totalPage }">
						<a href="#">下一页</a>
					</c:when>
					<c:otherwise>
						<a href="findBill.do?currentPage=${billPage.currentPage+1 }">下一页</a>
					</c:otherwise>
				</c:choose>
				<a href="findBill.do?currentPage=${billPage.totalPage }">末页</a>
			</div>
		
	</div>
        <!--主要区域结束-->
        <div id="footer">
            <jsp:include page="/WEB-INF/main/foot.jsp" />
        </div>
    </body>
</html>
