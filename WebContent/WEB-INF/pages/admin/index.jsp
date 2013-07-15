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
    
    <title>后台管理中心</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="resources/jBox/select2.css" />
  </head>
  <body>
    <div class="container body-container">
   		<jsp:include page="/WEB-INF/pages/admin/head.jsp"/>
		<div class="row">
			<jsp:include page="/WEB-INF/pages/admin/side.jsp"/>
			<div class="span9">
				<div class="page-header" style="text-align: center;">
						<h3>管理后台</h3>
				</div>	
				<p> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;欢迎进入后他管理系统！<p>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;你可以
				<a href="news/add">发表新文章</a>
				、<a href="news/list/1">管理已发表的文章</a>
				、<a href="nav/add">增加导航</a>
				、<a href="nav/list/1">管理导航</a>
				、<a href="link/add">增加友情链接</a>
				、<a href="link/list/1">管理友情链接</a>。
				</p>
				<p>
				<%-- 此外你还可以
				<a href="${contextPath}/admin/settings/webInfo">设置网站的显示信息</a>
				、<a href="${contextPath}/admin/settings/webSetting">网站的配置</a>
				、<a href="${contextPath}/admin/settings/webSkin">网站的皮肤</a>
				以及文章后使用的<a href="${contextPath}/admin/settings/userSign">签名档</a>。 --%>
				</p>
				</p>
				<p>
				更多丰富功能正在加紧开发中，相信你会满意。
				</p>
				<p>
			</div>
		</div>
		<jsp:include page="/WEB-INF/pages/admin/footer.jsp"/>
	</div>
	<script type="text/javascript" src="resources/js/select2.js"></script>
	<script type="text/javascript">
	$(document).ready(function() { $("#e1").select2(); });
	</script>
</body>
</html>

