<%@page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中国电信－NetCTAAAS</title>
<link type="text/css" rel="stylesheet" media="all"
	href="../styles/global.css" />
<link type="text/css" rel="stylesheet" media="all"
	href="../styles/global_color.css" />
<script language="javascript" type="text/javascript">
            //保存成功的提示消息
            function showResult() {
                showResultDiv(true);
                window.setTimeout("showResultDiv(false);", 3000);
            }
            function showResultDiv(flag) {
                var divResult = document.getElementById("save_result_info");
                if (flag)
                    divResult.style.display = "block";
                else
                    divResult.style.display = "none";
            }
        </script>
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
		<!--保存操作后的提示信息：成功或者失败-->
		<div id="save_result_info" class="save_success">保存成功！</div>
		<form action="updateRole.do" method="post" class="main_form">
			<input type="hidden" name="role_id" value="${role.role_id }" />

			<div class="text_info clearfix">
				<span>角色名称：</span>
			</div>
			<div class="input_info">
				<input type="text" class="width200" name="name"
					value="${role.name }" /> <span class="required">*</span>
				<div class="validate_msg_medium error_msg">不能为空，且为20长度的字母、数字和汉字的组合</div>
			</div>
			<div class="text_info clearfix">
				<span>设置权限：</span>
			</div>
			<div class="input_info_high">
				<div class="input_info_scroll">
					<ul>
						<c:forEach items="${modules }" var="m">
							<li><input type="checkbox" value="${m.module_id }"
								name="moduleIds"
								<c:forEach items="${role.modules }" var="rm">
				                    		<c:if test="${rm.module_id==m.module_id }">checked</c:if>
				                    	</c:forEach> />${m.name
								}</li>
						</c:forEach>
					</ul>
				</div>
				<span class="required">*</span>
				<div class="validate_msg_tiny">至少选择一个权限</div>
			</div>
			<div class="button_info clearfix">
				<input type="submit" value="保存" class="btn_save" /> <input
					type="button" value="取消" class="btn_save" onclick="history.back();" />
			</div>
		</form>
	</div>
	<!--主要区域结束-->
	<div id="footer">
		<jsp:include page="/WEB-INF/main/foot.jsp" />
	</div>
</body>
</html>