<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>400</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style>
.pagination{
padding: 2px;
}
.pagination ul{
margin: 0;
padding: 0;
text-align: left; 
font-size: 12px;
}
.pagination li{
list-style-type: none;
display: inline;
padding-bottom: 1px;
}
.pagination a, .pagination a:visited{
padding: 0 5px;
border: 1px solid #9aafe5;
text-decoration: none; 
color: #2e6ab1;
}
.pagination a:hover, .pagination a:active{
border: 1px solid #2b66a5;
color: #000;
background-color: lightyellow;
}
.pagination li.currentpage{
font-weight: bold;
padding: 0 5px;
border: 1px solid navy;
background-color: #2e6ab1;
color: #FFF;
}
.pagination li.disablepage{
padding: 0 5px;
border: 1px solid #929292;
color: #929292;
}
.pagination li.nextpage{
font-weight: bold;
}

* html .pagination li.currentpage, * html .pagination li.disablepage{
margin-right: 5px;
padding-right: 0;
}
</style>
</head>
 
<body>
 
<div class="pagination">
<ul>
<li class="disablepage">上一页</li>
<li class="currentpage">1</li>
<li><a href="#">2</a></li>
<li><a href="#">3</a></li>
<li><a href="#">4</a></li>
<li><a href="#">5</a></li>
<li><a href="#">6</a></li>
<li><a href="#">7</a></li>
<li><a href="#">8</a></li>
<li><a href="#">9</a>...</li>
<li><a href="#">15</a></li>
<li><a href="#">16</a></li>
<li class="nextpage"><a href="#">下一页</a></li>
</ul>
</div>
</body>
</html>