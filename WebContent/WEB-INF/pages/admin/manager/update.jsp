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
    
    <title>更新管理员</title>
    
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
		<h4>更新管理员</h4>
		<table class="table table-condensed table-bordered table-striped table-hover"></table>
		<c:if test="${!empty msg}">
		   <div class="alert alert-error"><font size=2>${msg}</font></div>
        </c:if>
			<div class="succ-toggle">
				<form id="link-form" action="${pageContext.request.contextPath }/admin/manager/update" method="POST" >
					<input type="hidden" name="id" value=${manager.id } readonly="readonly"/>
					<div class="control-group">
					<label class="control-label" for="name">登录帐号</label>
					<input type="text" name="name" id="name" placeholder="登录帐号" value="${manager.name }" class="input-block-level"/>
					<span id="msg-title" class="help-block"></span>
					</div>
					
					<div class="control-group">
					<label class="control-label" for="email">邮箱</label>
					<input type="text" name="email" id="email" placeholder="邮箱" class="input-block-level" value="${manager.email}">
					<span id="msg-tag" class="help-block"></span>
					</div>
					
					<div class="control-group">
					<label class="control-label" for="password">登录密码</label>
					<input type="password" name="password" id="password" placeholder="登录密码" class="input-block-level" value="${manager.password }">
					<span id="msg-tag" class="help-block"></span>
					</div>
					
					
					<div class="control-group">
					<label class="control-label" for="rank">角色</label>
					<select name="role.id" class="span2" id="categoryId">
						<c:forEach var="role" items="${role}">
							<option value=${role.id }  ${role.id==manager.role.id ? 'selected':''}>${role.name }</option>
						</c:forEach>
					</select>
					<p>&nbsp;
					<label class="radio">  
					 	<input type="radio" name="status" value="0"  ${0==manager.status ? 'Checked':''}  >禁用  
					</label> 
					<label class="radio">  
					 	<input type="radio" name="status" value="1"  ${1==manager.status ? 'Checked':''}  >恢复  
					</label> 
					
					
					<%-- <div class="control-group">
					<label class="control-label" for="password">状态</label>
					<input type="password" name="password" id="password" placeholder="登录密码" class="input-block-level" value="${manager.status }">
					<span id="msg-tag" class="help-block"></span>
					</div> --%>
					
					
					<span id="msg-tag" class="help-block"></span>
					</div>
					<div class="control-group">
					<button type="submit" id="submit" class="btn btn-primary pull-right">保存</button>
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
$("#nav-manager-list").addClass("active");
</script>
  </body>
</html>