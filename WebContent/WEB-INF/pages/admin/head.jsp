<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
	 <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/bootstrap-responsive.min.css"/>" />
	 <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>" />
	 <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/core.css"/>" />
	 <!-- <link rel="shortcut icon" type="image/png" href="resources/images/favicon.ico" /> -->
	<script src="<c:url value="/resources/js/jquery-1.8.2.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/js/utils.js"/>"></script> 
</head>
<body>
	<div class="row">
        <div class="span6">
          <h1>管理中心</h1>
        </div>
      </div>
      <div class="navbar" id="main-navbar">
        <div class="navbar-inner">
          <div class="container">
            <a class="brand" href="#"></a>
            <div class="nav-collapse">
              <ul class="nav">
                <li id="home"><a href=""><i class="icon-home"></i>Home</a></li>
              </ul>
              <ul class="nav pull-right">
               <!--  <li>
                  <a href="#" rel="tooltip" data-original-title="first tooltip">tooltip</a>
                </li>
                <li class="divider-vertical"></li> -->
            
                <li>
                  <a>${sessionManager.role.name}：${sessionManager.name }，你好！</a>
                </li>
               
                <li>
                  <a id="loginHref" href="${pageContext.request.contextPath }/admin/loginOut" rel="tooltip" data-original-title="安全退出">安全退出</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
	</body>
</html>