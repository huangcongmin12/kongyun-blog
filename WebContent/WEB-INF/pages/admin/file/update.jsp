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
    
    <title>更新下载</title>
    
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
		<h4>更新下载</h4>
		<table class="table table-condensed table-bordered table-striped table-hover"></table><p/>&nbsp;
			<div class="succ-toggle">
				<form id="_article-form" action="${pageContext.request.contextPath }/admin/file/update" enctype="multipart/form-data" method="post" >
					<input type="hidden" name="id" value=${file.id } readonly="readonly"/>
					<div class="control-group">
					<label class="control-label" for="title">标题</label>
					<input type="text" name="name" placeholder="标题" value="${file.name }" class="input-block-level"/>
					<span id="msg-title" class="help-block"></span>
					</div>
					
					<div class="control-group">
					<label class="control-label" for="url">保存路径</label>
					<span id="msg-tag" class="help-block">${file.path }</span>
					</div>
					
					<div class="control-group">
					<label class="control-label" for="tags">描述</label>
					<textarea name="description" placeholder="描述" rows="2" class="input-block-level">${file.description }</textarea>
					<span id="msg-description" class="help-block"></span>
					</div>
					
					<div class="control-group">
					<label class="control-label" for="rank">关键字</label>
					<input type="text" name="tags" placeholder="关键字" class="input-block-level" value="${file.tags }">
					<span id="msg-tag" class="help-block"></span>
					</div>

					<div class="control-group">
					<button type="submit" class="btn btn-primary pull-right">保存</button>
					</div>
				</form>
				<c:if test="${!empty success }">${success }</c:if>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/pages/admin/footer.jsp"/>
</div>
<script type="text/javascript" src="resources/js/form/jquery.form.js"></script>
<script type="text/javascript" charset="utf-8" src="resources/js/kindeditor/kindeditor.js"></script>
<script type="text/javascript" charset="utf-8" src="resources/js/kindeditor/lang/zh_CN.js"></script>
<script type="text/javascript" src="resources/js/admin.article.add.js"></script>
<script type="text/javascript">
$("#nav-file-list").addClass("active");
</script>
  </body>
</html>