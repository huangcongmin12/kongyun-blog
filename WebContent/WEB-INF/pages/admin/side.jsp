<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<div class="span3">
		<div class="well sidebar-nav">
			<ul class="nav nav-list">
				<li class="nav-header">文章</li>
				<li id="nav-article-new"><a
					href="${pageContext.request.contextPath }/admin/news/add">发布文章</a></li>
				<li id="nav-article-list"><a
					href="${pageContext.request.contextPath }/admin/news/list/1">文章管理</a></li>
				<li class="nav-header">导航</li>
				<li id="nav-nav-new"><a
					href="${pageContext.request.contextPath }/admin/nav/add">新增分类</a></li>
				<li id="nav-nav-list"><a
					href="${pageContext.request.contextPath }/admin/nav/list/1">分类管理</a></li>
				<li class="nav-header">友情链接</li>
				<li id="nav-link-new"><a
					href="${pageContext.request.contextPath }/admin/link/add">发布友链</a></li>
				<li id="nav-link-list"><a
					href="${pageContext.request.contextPath }/admin/link/list/1">友链管理</a></li>
				<li class="nav-header">相关下载</li>
				<li id="nav-file-new"><a
					href="${pageContext.request.contextPath }/admin/file/upload">发布下载</a></li>
				<li id="nav-file-list"><a
					href="${pageContext.request.contextPath }/admin/file/list/1">下载管理</a></li>
				
				
				
				<c:choose>
				  <c:when test="${sessionManager.role.id eq 1}">
					<li class="nav-header">管理员</li>
					<li id="nav-manager-new"><a
						href="${pageContext.request.contextPath }/admin/manager/add">新增管理员</a></li>
					<li id="nav-manager-list"><a
						href="${pageContext.request.contextPath }/admin/manager/list/1">管理员管理</a></li>
				</c:when>
				  <c:otherwise>
					<li class="nav-header">密码</li>
					<li id="nav-manager-reset"><a href="${pageContext.request.contextPath }/admin/manager/reset">重置密码</a></li>
				</c:otherwise>
				</c:choose> 
				
				
<%-- 				<li class="nav-header">设置</li>
				<li id="nav-settings-webInfo"><a
					href="${contextPath}/admin/settings/webInfo">网站信息</a></li>
				<li id="nav-settings-webSetting"><a
					href="${contextPath}/admin/settings/webSetting">网站参数</a></li>
				<li id="nav-settings-webSkin"><a
					href="${contextPath}/admin/settings/webSkin">皮肤</a></li>
				<li id="nav-settings-userSign"><a
					href="${contextPath}/admin/settings/userSign">签名档</a></li>
				<li id="nav-settings-socialSetting"><a
					href="${contextPath}/admin/settings/socialSetting">同步设置</a></li>
				<li id="nav-settings-duoshuoSetting"><a
					href="${contextPath}/admin/settings/duoshuoSetting">评论设置</a></li>
				<li class="nav-header">工具</li>
				<li id="nav-tools-dwz"><a href="${contextPath}/admin/tools/dwz">短网址</a></li> --%>
			</ul>
		</div>
	</div>
</body>
</html>