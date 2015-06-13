<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<img src="../images/logo.png" alt="logo" class="left" />
	<span style="color: white;"> <marquee scrollamount="3"
			onmouseout="this.start()" onmouseover="this.stop()" behavior="scroll"
			direction="left" width="150px">
			<strong style="color: #902E24"> ${admin.name},欢迎你回来！ </strong>
		</marquee>
	</span>
	<a href="../login/toLogin.do">[退出]</a>

</body>
</html>