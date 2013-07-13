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
    
    <title>新增友接</title>
    
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
		<h4>发布友链</h4>
		<table class="table table-condensed table-bordered table-striped table-hover"></table>
		<div id="info"></div>
		<c:if test="${!empty msg}">
		   <div class="alert alert-error"><font size=2>${msg}</font></div>
        </c:if>
			<div class="succ-toggle">
				<form id="link-form" action="${pageContext.request.contextPath }/admin/link/add" method="POST" >
					<div class="control-group">
					<label class="control-label" for="title">名称</label>
					<input type="text" name="name" id="name" placeholder="友链名称" value="" class="input-block-level"/>
					<span id="msg-title" class="help-block"></span>
					</div>
					
					<div class="control-group">
					<label class="control-label" for="url">友链地址</label>
					<input type="text" name="url" id="url" placeholder="友链地址" class="input-block-level" value="">
					<span id="msg-tag" class="help-block"></span>
					</div>
					
					<div class="control-group">
					<label class="control-label" for="tags">描述</label>
					<textarea name="description" placeholder="描述" rows="2" class="input-block-level"></textarea>
					<span id="msg-description" class="help-block"></span>
					</div>
					
					<div class="control-group">
					<label class="control-label" for="rank">排序</label>
					<input type="text" name="rank" placeholder="排序" class="input-block-level" value="">
					<span id="msg-tag" class="help-block"></span>
					</div>
					
					<div class="control-group">
					<button type="submit" id="submit" class="btn btn-primary pull-right">新增</button>
					</div>
				</form>
				<c:if test="${!empty success }">${success }</c:if>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/pages/admin/footer.jsp"/>
</div>
<script type="text/javascript" src="resources/js/form/jquery.form.js"></script>
<script type="text/javascript">
$("#nav-link-new").addClass("active");
$("#submit").click(function() {
	if ($("#name").attr("value").replace(/(^\s*)|(\s*$)/,"") == "") {
		$("#info").html("<div class='alert alert-error'><font size=2>请输入标题 !</font> </div>");
		return false;
	}
	if ($("#url").attr("value").replace(/(^\s*)|(\s*$)/,"") == "") {
		$("#info").html("<div class='alert alert-error'><font size=2>请输入链接地址 !</font> </div>");
		return false;
	}
});
</script>
  </body>
</html>