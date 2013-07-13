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
    
    <title>更新友链</title>
    
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
		<h4>更新友链</h4>
        <table class="table table-condensed table-bordered table-striped table-hover"></table>
			<div class="succ-toggle">
				<form id="_article-form" action="${pageContext.request.contextPath }/admin/link/update" method="post" >
					<input type="hidden" name="id" value=${link.id } readonly="readonly"/>
					<div class="control-group">
					<label class="control-label" for="title">名称</label>
					<input type="text" name="name" placeholder="友链名称" value="${link.name }" class="input-block-level">
					<span id="msg-title" class="help-block"></span>
					</div>
					
					<div class="control-group">
					<label class="control-label" for="url">友链地址</label>
					<input type="text" name="url" placeholder="友链地址" class="input-block-level" value="${link.url }">
					<span id="msg-tag" class="help-block"></span>
					</div>
					
					<div class="control-group">
					<label class="control-label" for="tags">描述</label>
					<textarea name="description" placeholder="描述" rows="2" class="input-block-level">${link.description }</textarea>
					<span id="msg-description" class="help-block"></span>
					</div>
					
					<div class="control-group">
					<label class="control-label" for="rank">排序</label>
					<input type="text" name="rank" placeholder="排序" class="input-block-level" value="${link.rank }">
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
<script type="text/javascript">
$("#nav-link-list").addClass("active");
</script>
  </body>
</html>