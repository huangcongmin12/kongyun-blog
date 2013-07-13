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
    
    <title>登录页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link type="text/css" rel="stylesheet" href="resources/css/bootstrap-responsive.css" />
	 <link type="text/css" rel="stylesheet" href="resources/css/bootstrap-responsive.min.css" />
	 <link type="text/css" rel="stylesheet" href="resources/css/bootstrap.css" />
	 <link type="text/css" rel="stylesheet" href="resources/css/bootstrap.min.css" />
	 <link type="text/css" rel="stylesheet" href="resources/css/core.css" />
	 <!-- <link rel="shortcut icon" type="image/png" href="resources/images/favicon.ico" /> -->
	<script src="resources/js/jquery-1.8.2.js"></script>
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/utils.js"></script>

  </head>
 <body>
    <div style = "height: 120px;"></div>
    <div class="container body-container " style="width: 300px;">
    	<h2 class="form-signin-heading">Please sign in</h2>
		<c:if test="${!empty msg}">
		   <div class="alert alert-error"><font size=2>${msg}</font></div>
        </c:if>
		<form id="login-form" action = "${pageContext.request.contextPath }/administrate/login" class="form-signin" method = "POST">
			<input type="text" name="email" id="email" class="input-block-level" placeholder="邮箱/登录帐号" value="${email}">
			<input type="password" name="password" id="password" class="input-block-level" placeholder="登录密码" value="${password }">
			<button type="submit" id="submit" class="btn btn-large btn-primary">Sign in</button>
		</form>
	</div>
  </body>
</html>