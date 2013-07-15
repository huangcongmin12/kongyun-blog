<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${date} | KongYun</title>
<link href="<c:url value="/resources/css/bootstrap.min.css"/>" 	rel="stylesheet">
<link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet">
<link rel="stylesheet" href="<c:url value="/resources/kindeditor-4.1.6/plugins/code/prettify.css"/>"/>
<script type="text/javascript" 	src="<c:url value="/resources/js/ga.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-1.8.2.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/function.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/kindeditor-4.1.6/plugins/code/prettify.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/kindeditor-4.1.6/kindeditor.js"/>"></script>

<script type="text/javascript">
	KindEditor.ready(function(K) {
		prettyPrint();
	});
	var _gaq = _gaq || [];
	_gaq.push([ '_setAccount', 'UA-36220755-1' ]);
	_gaq.push([ '_trackPageview' ]);
	(function() {
		var ga = document.createElement('script');
		ga.type = 'text/javascript';
		ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl'
				: 'http://www')
				+ '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(ga, s);
	})();
</script>
</head>
<body>
	<div class="container">
		<div class="header">
			<h1 class="site-title">
				<a href="${pageContext.request.contextPath }/" rel="home">Kong
					Yun </a>
			</h1>
			<h6 class="site-description">Kong Yun</h6>


			<div class="navbar">
				<div class="navbar-inner">
				   <ul class="nav nav-pills">
					  <li class="mun" >
					    <a   href="${pageContext.request.contextPath }/"><small >Home</small></a>
					  </li>
					  <li class=" mun" ><a href="${pageContext.request.contextPath }/articles/list/1"><small>Article</small></a></li>
					  <li class="mun" ><a href="${pageContext.request.contextPath }/about-me"><small>About Me</small></a></li>
					   <li class="mun"><a	href="${pageContext.request.contextPath }/resume"><small>Resume</small></a></li>
					</ul>
					<form class="navbar-search pull-right">
  						<input type="text"  class="search-query span2" placeholder="搜索..."><i class="icon-search"></i>
					</form>
				</div>
			</div>
		</div>
		<!-- header end  -->

		<!-- main start -->
		<div class="row">
			<div class="span9 main">
				<!-- article start-->
				<c:forEach var="article" items="${article }">
					<div class="entry">
						<div class="row">
							<div class="time span2">
								<time datetime="${article.time}"></time>
								<div class="day">${article.createTime.date}</div>
								${article.yearAndMonth}
							</div>
							<div class="span8" style="margin-left: 10px">
								<div class="entry-title">
									<h3>
										<a href="${pageContext.request.contextPath }/${article.url}"
											title="${article.title}">${article.title}</a>
									</h3>
								</div>
								<div class="entry-meta">
									</i> <small class="muted"> 分类：<a
										href="${pageContext.request.contextPath }/${article.category.url}"
										title="${article.category.name}">${article.category.name}</a>
										&nbsp; | &nbsp;阅读：<span>(${article.viewCount })</span> 
									</small>
								</div>
							</div>
						</div>
						<div class="entry-content ">
							<span>${article.content}</span>
						</div>

						<div class="entry-tags">
							<small class="muted">标签：<a href="#"
								title="查看chrome中的全部文章">${article.tags}</a></small>
						</div>
						<small class="muted"><a href="${pageContext.request.contextPath }/${article.url}" class="btn-more ">
						阅读全文...</a></small>
					</div>
				</c:forEach>
				<!-- article end -->
				<!-- pagination -->
				<div class="pagination">
					${page.pageHTML }
				</div>
			</div>

			<!--sidebar start  -->
			<div class="sidebar">
				<div class="widget">
					<div class="textwidget">
							<iframe src="http://follow.v.t.qq.com/index.php?c=follow&a=quick&name=hcm627878968&style=5&t=1364623260852&f=1" frameborder="0" scrolling="auto" width="178" height="24" marginwidth="0" marginheight="0" allowtransparency="true"></iframe>
					</div>
				</div>
				<div class="widget">
					<div class="textwidget">
					 <iframe width="100%" height="550" class="share_self"  frameborder="0" scrolling="no" src="http://widget.weibo.com/weiboshow/index.php?language=zh_cn&width=0&height=550&fansRow=2&ptype=1&speed=300&skin=4&isTitle=1&noborder=1&isWeibo=1&isFans=1&uid=3201403375&verifier=323ccbb0&dpc=1"></iframe>
					</div>
				</div>

				<div class="widget">
					<h5 class="title muted ">分类</h5>
					<ul class="unstyled">
						<c:forEach var="category" items="${category }">
							<li><a href="${pageContext.request.contextPath }/${category.url }">${category.name }</a><small>(${category.acticleNum })</small></li>
						</c:forEach>
					</ul>
				</div>

				<!-- <div class="widget">
					<h5 class="title muted">标签</h5>
					<div class="tagcloud">
						<a href=""> mac </a> <a href=""> linux </a>
					</div>
				</div> -->

				<div class="widget">
					<h5 class="title muted">日志归档</h5>
					<ul>
						<c:forEach var="archives" items="${archives }">
							<li><a href="${pageContext.request.contextPath }/articles/listbymonth/1?date=${archives.date}">${archives.y_m }</a><small>(${archives.count })</small></li>
						</c:forEach>
					</ul>
				</div>

				<div class="widget">
					<h5 class="title muted">最近发表</h5>
					<ul>
					    <c:forEach var="article_new" items="${article_new }">
					    	<li><a href="${pageContext.request.contextPath }/${article_new.url }">${article_new.title }</a></li>
					    </c:forEach>
					</ul>
				</div>

				<div class="widget">
					<h5 class="title muted">友情链接</h5>
					<ul>
						<c:forEach var="link" items="${link }">
							<li><a href="${link.url }" title="${link.name }"
								rel="external nofollow">${link.name }</a></li>
						</c:forEach>
					</ul>
				</div>

			</div>
			<!-- side end -->
		</div>
		<!-- main end -->


<!-- footer start -->
			<div class="footer">
				<hr>
				<span class="pull-right"><a href="#"
					rel="nofollow" title="返回页面顶部">↑回到顶部</a></span>
				<div>
					© 2013 HCM | <span style="color: #06CA19 ">伊妹：huangcongmin12@gmail.com</span>
				</div>
			</div>
			<!-- footer end -->
	</div>


	<!--end of container-->
	<!-- <script type="text/javascript" src="./WAmaker_files/addfeed.js" charset="UTF-8"></script> -->
	<script type="text/javascript"
		src="<c:url value="/resources/syntaxhighlighter/scripts/brush.js"/>"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							SyntaxHighlighter.config.clipboardSwf = 'resources/syntaxhighlighter/scripts/clipboard.swf';
							SyntaxHighlighter.all();
						});
	</script>
</body>
</html>