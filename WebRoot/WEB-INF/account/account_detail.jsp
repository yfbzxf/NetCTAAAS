<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%= basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中国电信－NetCTAAAS</title>
<link type="text/css" rel="stylesheet" media="all"
	href="styles/global.css" />
<link type="text/css" rel="stylesheet" media="all"
	href="styles/global_color.css" />
</head>
<body>
	<!--Logo区域开始-->
	<div id="header">
		<jsp:include page="/WEB-INF/main/head.jsp" />
	</div>
	<!--Logo区域结束-->
	<!--导航区域开始-->
	<div id="navi">
		<jsp:include page="/WEB-INF/main/menu.jsp" />
	</div>
	<!--导航区域结束-->
	<!--主要区域开始-->
	<div id="main">
		<form action="" method="post" class="main_form">
			<!--必填项-->
			<div class="text_info clearfix">
				<span>账务账号ID：</span>
			</div>
			<div class="input_info">
				<input type="text" readonly="readonly" class="readonly" value="${account.account_id}"/>

			</div>
			<div class="text_info clearfix">
				<span>姓名：</span>
			</div>
			<div class="input_info">
				<input type="text" readonly="readonly" class="readonly" value="${account.real_name}"/>
			</div>
			<div class="text_info clearfix">
				<span>身份证：</span>
			</div>
			<div class="input_info">
				<input type="text" readonly="readonly" class="readonly" value="${account.idcard_no}"/>
			</div>
			<div class="text_info clearfix">
				<span>登录账号：</span>
			</div>
			<div class="input_info">
				<input type="text" readonly="readonly" class="readonly" value="${account.login_name}"/>
			</div>
			<div class="text_info clearfix">
				<span>电话：</span>
			</div>
			<div class="input_info">
				<input type="text" readonly="readonly" class="readonly" value="${account.telephone}"/>
			</div>
			<div class="text_info clearfix">
				<span>推荐人账务账号ID：</span>
			</div>
			<div class="input_info">
				<input type="text" readonly="readonly" class="readonly" value="${account.recommender_id}"/>
			</div>
			
			<div class="text_info clearfix">
				<span>状态：</span>
			</div>
			<div class="input_info">
				<c:choose>
					<c:when test="${account.status==0 }">开通</c:when>
					<c:when test="${account.status==1 }">暂停</c:when>
					<c:otherwise>删除</c:otherwise>
				</c:choose>
			</div>
			<div class="text_info clearfix">
				<span>开通/暂停/删除时间：</span>
			</div>
			<div class="input_info">
				<input type="text" readonly="readonly" class="readonly" value="${account.create_date}"/>
			</div>
			<div class="text_info clearfix">
				<span>上次登录时间：</span>
			</div>
			<div class="input_info">
				<input type="text" readonly="readonly" class="readonly" value="${account.last_login_time}"/>
				</div>
			<div class="text_info clearfix">
				<span>上次登录IP：</span>
			</div>
			<div class="input_info">
				<input type="text" readonly="readonly" class="readonly" value="${account.last_login_ip}"/>
			</div>
			<!--可选项数据-->
			<div class="text_info clearfix">
				<span>生日：</span>
			</div>
			<div class="input_info">
				<input type="text" readonly="readonly" class="readonly" value="${account.birthdate}"/>
			</div>
			<div class="text_info clearfix">
				<span>Email：</span>
			</div>
			<div class="input_info">
				<input type="text" readonly="readonly" class="readonly" value="${account.email}"/>
			</div>
			<div class="text_info clearfix">
				<span>职业：</span>
			</div>
			<div class="input_info">
				<input type="text" readonly="readonly" class="readonly" value="${account.occupation}"/>
			</div>
			<div class="text_info clearfix">
				<span>性别：</span>
			</div>
			<div class="input_info fee_type">
				<input type="text" readonly="readonly" class="readonly" value="${account.gender}"/>
			</div>
			<div class="text_info clearfix">
				<span>通信地址：</span>
			</div>
			<div class="input_info">
				<input type="text" readonly="readonly" class="readonly" value="${account.mailaddress}"/>
			</div>
			<div class="text_info clearfix">
				<span>邮编：</span>
			</div>
			<div class="input_info">
				<input type="text" readonly="readonly" class="readonly" value="${account.zipcode}"/>
			</div>
			<div class="text_info clearfix">
				<span>QQ：</span>
			</div>
			<div class="input_info">
				<input type="text" readonly="readonly" class="readonly" value="${account.qq}"/></div>
			<!--操作按钮-->
			<div class="button_info clearfix">
				<input type="button" value="返回" class="btn_save"
					onclick="history.back();" />
			</div>
		</form>
	</div>
	<!--主要区域结束-->
	<div id="footer">
		<jsp:include page="/WEB-INF/main/foot.jsp" />
	</div>
</body>
</html>
