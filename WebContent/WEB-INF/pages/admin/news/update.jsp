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
    
    <title>文章更新</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/select2.css"/>" />
	<link rel="stylesheet" href="<c:url value="/resources/kindeditor-4.1.6themes/default/default.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/kindeditor-4.1.6/plugins/code/prettify.css"/>"/>
	<script type="text/javascript" src="<c:url value="/resources/kindeditor-4.1.6/plugins/code/prettify.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/kindeditor-4.1.6/kindeditor.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/kindeditor-4.1.6/lang/zh_CN.js"/>"></script>
	
  </head>
  
  <body>
    <div class="container body-container">
    <jsp:include page="/WEB-INF/pages/admin/head.jsp"/>
		<div class="row">
			<jsp:include page="/WEB-INF/pages/admin/side.jsp"/>
			<div class="span9">
			    <h4>文章更新</h4>
				<table class="table table-condensed table-bordered table-striped table-hover"></table><p/>&nbsp;
				<div class="succ-toggle">
					<form id="_article-form" action="${pageContext.request.contextPath }/admin/news/update" method="post">
						<input type="hidden" name="id" value=${article.id } readonly="readonly"/>
						<div class="control-group">
						<label class="control-label" for="title">标题</label>
						<input type="text" name="title" placeholder="文章标题" value="${article.title }" rows="3" class="input-block-level">
						<span id="msg-title" class="help-block"></span>
						</div>
						<div class="control-group">
						<label class="control-label" for="categoryId">文章分类</label>
						<select name="category.id" class="span2" id="category">
							<option value=-1  >--请选择--</option>
							<c:forEach var="category" items="${category}">
								<option value=${category.id }  ${category.id==article.category.id ? 'selected':''}>${category.name }</option>
							</c:forEach>
						</select>
						<span id="msg-signName" class="help-block"></span>
						</div><br><p>&nbsp;
						
						<div class="control-group">
						<label class="control-label" for="content">内容</label>
						<textarea id="aeditor" name="content" placeholder="你想说的东西"  rows="20" class="input-block-level">${(article.content)}</textarea>
						<span id="msg-content" class="help-block"></span>
						</div>
						<div class="control-group">
						<textarea name="description" placeholder="文章简要描述" rows="3" class="input-block-level">${article.description }</textarea>
						<span id="msg-description" class="help-block"></span>
						</div>
						<div class="control-group">
						<label class="control-label" for="tags">标签</label>
						<input type="text" name="tags" placeholder="随便" class="input-block-level" value="${article.tags }">
						<span id="msg-tag" class="help-block"></span>
						</div>
						<div class="control-group">
						<button type="submit" class="btn btn-primary pull-right">保存</button>
						</div>
					</form>
				    <c:if test="${!empty msg }">${msg }</c:if>
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/pages/admin/footer.jsp"/>
	</div>
<script type="text/javascript" src="<c:url value="/resources/js/select2.js"/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#category").select2();
	});
	$("#nav-article-new").addClass("active");
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="content"]', {
		themeType : 'default', 
		resizeType : 1,
		urlType: 'domain',
		shadowMode : false,
		cssPath : '<c:url value="/resources/kindeditor-4.1.6/plugins/code/prettify.css"/>',
		uploadJson : 'FileUploadServlet',
		fileManagerJson : 'FileManagerServlet',
		allowFileManager : false,
		afterCreate : function() {
			var self = this;
			K.ctrl(document, 13, function() {
				self.sync();
				document.forms['article-form'].submit();
			});
			K.ctrl(self.edit.doc, 13, function() {
				self.sync();
				document.forms['article-form'].submit();
			});
		},
		items : ['bold', 'italic', 'underline', 'strikethrough', 'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'formatblock', 'insertorderedlist', 'insertunorderedlist', '|','forecolor',
				 'hilitecolor', 'fontname', 'fontsize', '|','link', 'unlink', 'emoticons', 'code', 'image', 'flash', 'table', 'quote', '|', 'fullscreen', 'source', 'about'],
		htmlTags:
		{
			script : ['src'],
            font : ['color', 'size', 'face', '.background-color'],
            span : [
                    '.color', '.background-color', '.font-size', '.font-family', '.background',
                    '.font-weight', '.font-style', '.text-decoration', '.vertical-align', '.line-height'
            ],
            div : [
                    'align', '.border', '.margin', '.padding', '.text-align', '.color',
                    '.background-color', '.font-size', '.font-family', '.font-weight', '.background',
                    '.font-style', '.text-decoration', '.vertical-align', '.margin-left'
            ],
            table: [
                    'border', 'cellspacing', 'cellpadding', 'width', 'height', 'align', 'bordercolor',
                    '.padding', '.margin', '.border', 'bgcolor', '.text-align', '.color', '.background-color',
                    '.font-size', '.font-family', '.font-weight', '.font-style', '.text-decoration', '.background',
                    '.width', '.height', '.border-collapse'
            ],
            'td,th': [
                    'align', 'valign', 'width', 'height', 'colspan', 'rowspan', 'bgcolor',
                    '.text-align', '.color', '.background-color', '.font-size', '.font-family', '.font-weight',
                    '.font-style', '.text-decoration', '.vertical-align', '.background', '.border'
            ],
            a : ['href', 'target', 'name'],
            embed : ['src', 'width', 'height', 'type', 'loop', 'autostart', 'quality', '.width', '.height', 'align', 'allowscriptaccess'],
            img : ['src', 'width', 'height', 'border', 'alt', 'title', 'align', '.width', '.height', '.border'],
            'p,ol,ul,li,blockquote,h1,h2,h3,h4,h5,h6' : [
                    'align', '.text-align', '.color', '.background-color', '.font-size', '.font-family', '.background',
                    '.font-weight', '.font-style', '.text-decoration', '.vertical-align', '.text-indent', '.margin-left'
            ],
            pre : ['class'],
            hr : ['class', '.page-break-after'],
            'br,tbody,tr,strong,b,sub,sup,em,i,u,strike,s,del' : []
		}
	});
	prettyPrint();
	});
	$("#submit").click(
		function() {
		 	editor.sync();
			if ($("#title").attr("value").replace(/(^\s*)|(\s*$)/, "") == "") {
				alert("请输入文章标题 。");
				return false;
			}
			if ($("#category").attr("value").replace(/(^\s*)|(\s*$)/, "") == -1) {
				alert("请选择分类 。");				
				return false;
			}
			if ($("#aeditor").val() == "") {
				alert("请输入内容。");
				return false;
			}
	});
</script>
</body>
</html>