<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>抱歉，您访问的页面不存在或已删除</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">  
	<!-- <meta http-equiv="refresh" content="20; url=#"> -->
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		body {margin-top:100px;background:#fff;font-family: Verdana, Tahoma;}
		a {color:#CE4614;}
		#msg-box {color: #CE4614; font-size:0.9em;text-align:center;}
		#msg-box .logo {border-bottom:5px solid #ECE5D9;margin-bottom:20px;padding-bottom:10px;}
		#msg-box .title {font-size:1.4em;font-weight:bold;margin:0 0 10px 0;}
		#msg-box .nav {margin-top:20px;}
	</style>
  </head>
  
  <body>
  	<div id='msg-box'>
	    <div class='title'>抱歉，您访问的页面不存在或已删除</div>
	    <div class='nav'><a href="javascript:history.go(-1)">返回上页</a> <a href="#">返回首页</a></div>
	  </div>
  	  <table align='center' style='margin-top:20px;'>
  	   <tr>
  	    <td><iframe scrolling='no' frameborder='0' src='http://yibo.iyiyun.com/js/yibo404/key/3985' width='640' height='464' style='display:block;'></iframe></td>
        </tr>
       </table>
  </div>
  </body>
</html>
