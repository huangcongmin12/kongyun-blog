<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>导航管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link type="text/css" rel="stylesheet" href="resources/css/select2.css" />
</head>

<body>
	<div class="container body-container">
		<jsp:include page="/WEB-INF/pages/admin/head.jsp" />
		<div class="row">
			<jsp:include page="/WEB-INF/pages/admin/side.jsp" />
			<div class="span9">
				<h4>导航管理</h4>
				<div class="data-table-grid">
					<table
						class="table table-condensed table-bordered table-striped table-hover"></table>
					<p />
					&nbsp;
					<table
						class="table table-condensed table-bordered table-striped table-hover">
						<tr>
							<th style="width: 35px; text-align: center;">序号</th>
							<th style="text-align: center;">名称</th>
							<th style="text-align: center;">类别</th>
							<th style="text-align: center;">描述</th>
							<th style="width: 20%; text-align: center;">链接</th>
							<th style="width: 40px; text-align: center;">操作</th>
						</tr>
						<c:forEach var="category" varStatus="status" items="${category}">
							<tr>
								<td>${status.count+(page.pageNow-1)*page.pageSize}</td>
								<td style="text-align: center;">${category.name}</td>
								<td style="text-align: center;">${category.alias}</td>
								<td style="text-align: center;">${category.description}</td>
								<td style="text-align: center;">${category.url}&nbsp;</td>
								<td style="text-align: center;"><a title="编辑"
									class="icon-edit"
									href="${pageContext.request.contextPath }/admin/nav/${category.id}/edit"
									rel="tooltip"></a>&nbsp;&nbsp; <a title="删除"
									data-id="${category.id}" class="delete icon-remove"
									rel="tooltip"></a></td>
							</tr>
						</c:forEach>
					</table>

					<div class="pagination  pagination-right">
						<ul>
							<!-- 首页始终显示第一页 -->
							<li><a
								href="${pageContext.request.contextPath }/admin/nav/list/1">首页</a></li>
							<!-- 如果有前一页就提交前一页的pageNow值 -->
							<c:choose>
								<c:when test="${page.hasPre}">
									<li><a
										href="${pageContext.request.contextPath }/admin/nav/list/${page.pageNow-1}">上一页</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="${pageContext.request.contextPath }/admin/nav/list/1">上一页</a></li>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${page.hasNext}">
									<li><a
										href="${pageContext.request.contextPath }/admin/nav/list/${page.pageNow+1}">下一页</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="${pageContext.request.contextPath }/admin/nav/list/${page.totalPage}">下一页</a></li>
								</c:otherwise>
							</c:choose>
							<!-- 末页始终提交最后一页的pageNow值 -->
							<li><a
								href="${pageContext.request.contextPath }/admin/nav/list/${page.totalPage}">末页</a></li>
							<li>
								<form name="form" action="" style="display: inline;">
									<select size="1" name="pageNow" id="e1" style="width: 66px;"
										onchange="option()">
										<c:forEach begin="1" end="${page.totalPage}"
											varStatus="status">
											<option value="${status.index}"
												${status.index == page.pageNow ? 'selected' : ''}>
												${status.index}</option>
										</c:forEach>
									</select>
								</form>
							</li>
						</ul>
						<ul class="pull-left">
							<li class="disabled"><a>第${page.firstRow } -
									${page.lastRow}条记录 / 共${page.totalSize }条</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/pages/admin/footer.jsp" />
	</div>
	<script type="text/javascript" src="resources/js/select2.js"></script>
	<script type="text/javascript">
	$(document).ready(function() { $("#e1").select2(); });
		function option() {
			var from = document.form;
			var pageNow = from.pageNow.value;
			location = "${pageContext.request.contextPath }/admin/nav/list/"
					+ pageNow;
		};
		$("#nav-nav-list").addClass("active");
		$(".delete")
				.click(
						function() {
							var id = $(this).attr("data-id");
							if (confirm("您确定要删除吗？")) {
								$
										.ajax({
											url : "${pageContext.request.contextPath }/admin/nav/"
													+ id + "/delete.json",
											type : "DELETE",
											dataType : "json",
											error : function(xhr, status, error) {
											},
											success : function(data) {
												if (data.success == "true") {
													alert("提示:删除成功！");
													window.location.reload();
												} else {
													alert("提示:删除失败！");
												}
											}
										});
							}
						});
	</script>
</body>
</html>