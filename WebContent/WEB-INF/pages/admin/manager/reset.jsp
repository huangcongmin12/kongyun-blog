<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>重置密码</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
 <body>
    <div class="container body-container">
    	<jsp:include page="/WEB-INF/pages/admin/head.jsp"/>
		<div class="row">
		<jsp:include page="/WEB-INF/pages/admin/side.jsp"/>
		<div class="span9">
		<h4>重置密码</h4>
		<table class="table table-condensed table-bordered table-striped table-hover"></table>
		<c:if test="${!empty msg}">
		   <div class="alert alert-error"><font size=2>${msg}</font></div>
        </c:if>
			<div class="succ-toggle">
				<form  action="${pageContext.request.contextPath }/admin/manager/reset" method="POST" >
					<input type="hidden" name="id" value=${sessionManager.id } readonly="readonly"/>
					
					<div class="control-group">
					<label class="control-label" for="password">原始密码</label>
					<input type="password" name="passwordOld" id="passwordOld" placeholder="原始密码"  class="input-block-level"/>
					<span id="msg-title" class="help-block"></span>
					</div>
					
					<div class="control-group">
					<label class="control-label" for="password">新密码</label>
					<input type="password" name="password" id="password" placeholder="新密码"  class="input-block-level"/>
					<span id="msg-title" class="help-block"></span>
					</div>
					
					<div class="control-group">
					<label class="control-label" for="password">确认密码</label>
					<input type="password" name="passwordConfirm" id="passwordConfirm" placeholder="确认密码"  class="input-block-level"/>
					<span id="msg-title" class="help-block"></span>
					</div>
					
					<span id="msg-tag" class="help-block"></span>
					<div class="control-group">
					<button type="submit" class="btn btn-primary pull-right" id="submit">修改</button>
					</div>
				</form>
				<c:if test="${!empty success}">${success }</c:if>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/pages/admin/footer.jsp"/>
</div>
<script type="text/javascript" src="resources/js/form/jquery.form.js"></script>
<script type="text/javascript">
$("#nav-manager-reset").addClass("active");
$("#submit").click(function() {
	if ($("#passwordOld").attr("value").replace(/(^\s*)|(\s*$)/,"") == "") {
		alert("请输入原始密码");
		return false;
	}
	if ($("#password").attr("value").replace(/(^\s*)|(\s*$)/,"") == "") {
		alert("请输入新密码");
		return false;
	}
	if ($("#passwordConfirm").attr("value").replace(/(^\s*)|(\s*$)/,"") == "") {
		alert("请输入确认密码");
		return false;
	}
	if ($("#passwordConfirm").attr("value").replace(/(^\s*)|(\s*$)/,"") != 
			$("#password").attr("value").replace(/(^\s*)|(\s*$)/,"")) {
		alert("两次密码不一致");
		return false;
	}
});
</script>
  </body>
</html>