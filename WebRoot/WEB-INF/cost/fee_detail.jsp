<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>中国电信－NetCTAAAS</title>
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css" />
        <script type="text/javascript" src="../js/jquery-1.4.3.js" ></script>
        <script type="text/javascript">
        	$(function(){
        		$('.fee_off').removeClass().addClass("fee_on");
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
           
                <div class="text_info clearfix"><span>资费ID：</span></div>
                <div class="input_info">
                	<input type="text" readonly="readonly" class="readonly" value="${cost.cost_id}" />
                </div>
                <div class="text_info clearfix"><span>资费名称：</span></div>
                <div class="input_info">
                	<input type="text" readonly="readonly" class="readonly" value="${cost.name}" />
                	
                </div>
                <div class="text_info clearfix"><span>资费状态：</span></div>
                <div class="input_info">
                    <s:choose>
									<s:when test="${cost.status==0 }">开通</s:when>
									<s:when test="${cost.status==1 }">暂停</s:when>
									<s:otherwise>删除</s:otherwise>
					</s:choose>
                
                </div>
                <div class="text_info clearfix"><span>资费类型：</span></div>
                <div class="input_info fee_type">
                	<input type="text" readonly="readonly" class="readonly" value="${cost.cost_type}" />

                </div>
                <div class="text_info clearfix"><span>基本时长：</span></div>
                <div class="input_info">
                	<input type="text" readonly="readonly" class="readonly" value="${cost.base_duration}" />

                    <span>小时</span>
                </div>
                <div class="text_info clearfix"><span>基本费用：</span></div>
                <div class="input_info">
                	<input type="text" readonly="readonly" class="readonly" value="${cost.base_cost}" />
                
                    <span>元</span>
                </div>
                <div class="text_info clearfix"><span>单位费用：</span></div>
                <div class="input_info">
                	<input type="text" readonly="readonly" class="readonly" value="${cost.unit_cost}" />
                
                    <span>元/小时</span>
                </div>
                <div class="text_info clearfix"><span>创建时间：</span></div>
                <div class="input_info">
                	<input type="text" readonly="readonly" class="readonly" value="${cost.creatime}" />
                
                </div>      
                <div class="text_info clearfix"><span>启动时间：</span></div>
                <div class="input_info">
                	<input type="text" readonly="readonly" class="readonly" value="${cost.startime}" />
                
                </div>      
                <div class="text_info clearfix"><span>资费说明：</span></div>
                <div class="input_info_high">
                	<textarea class="width300 height70 readonly" readonly="readonly"> ${cost.descr}</textarea>
                
                </div>                    
                <div class="button_info clearfix">
                    <input type="button" value="返回" class="btn_save" onclick="history.back();" />
                </div>
                
              
        </div>
        <!--主要区域结束-->
        <div id="footer">
            <jsp:include page="/WEB-INF/main/foot.jsp" />
        </div>
    </body>
</html>
