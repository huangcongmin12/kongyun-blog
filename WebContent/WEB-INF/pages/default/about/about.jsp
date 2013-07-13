<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>About | KongYun</title>

<link href="<c:url value="/resources/css/bootstrap.min.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet">
<script type="text/javascript"
	src="<c:url value="/resources/js/ga.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-1.8.2.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/function.js"/>"></script>

<link rel="stylesheet"
	href="<c:url value="/resources/kindeditor-4.1.6/plugins/code/prettify.css"/>" />
<script type="text/javascript"
	src="<c:url value="/resources/kindeditor-4.1.6/plugins/code/prettify.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/kindeditor-4.1.6/kindeditor.js"/>"></script>
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
						<li class="mun"><a
							href="${pageContext.request.contextPath }/"><small>Home</small></a>
						</li>
						<li class=" mun"><a
							href="${pageContext.request.contextPath }/articles/list/1"><small>Article</small></a></li>
						<li class="mun"><a
							href="${pageContext.request.contextPath }/about-me"><small>About
									Me</small></a></li>
					</ul>
					<form class="navbar-search pull-right">
						<input type="text" class="search-query span2" placeholder="搜索..."><i
							class="icon-search"></i>
					</form>
				</div>
			</div>
		</div>
		<!-- header end  -->


		<div class="row">
			<div class="span9 show">
				<div class="post article">
					<div class="content">

						<h3>关于我</h3>
						<p class="text-success"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;爱编程，爱折腾， 爱不断的学习新技术。 </p>
						<p class="text-success"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;爱音乐，爱生活，也爱篮球场上的挥汗如雨。</p>
						<p class="text-success"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;喜欢专研，喜欢思考，喜欢研究代码。</p>
						<p class="text-success"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;有耐心，有恒心，有信心。</p>
						<p class="text-success"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;专注Java，关注开源，崇尚技术，敬畏技术。</p>
						<p class="text-success"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;擅长B/S系统开发，使用技术，框架：Java EE ，SpringMVC，Struts2 ，Hibernate， MyBatis等。</p>
						<h3>软硬环境</h3>

						<p class="text-success">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操作系统：Windows 7 </p>
						<p class="text-success">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IDE：Eclipse With Java EE && MyEclipse </p>
						<p class="text-success">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;浏览器：Chrome，FireFox</p>
						<h3>关于Blog</h3>

						<p class="text-success">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;始于2012年末，定位于个人博客，没有固定主题，没有固定更新周期。</p>
						<p class="text-success">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;以Bootstrap，CSS，JavaScript，Ajax，JQuery为前端技术。</p>
						<p class="text-success">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;以SpringMVC + Spring + MyBatis 为后台开发基础。</p>
						<p class="text-success">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;主要用于记录生活，分享技术，分享人生。</p>
						
						<h3>联系我</h3>
						<p class="text-success">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email：huangcongmin12@gmail.com</p>
						<p class="text-success">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Weibo: @空云万里晴 </p>
						<p class="text-success">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;QQ:627878968</p>
						<h3>Github项目</h3>
						<p class="text-success">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;https://github.com/huangcongmin12</p>
						<h3>关于版权</h3>
						<p class="text-success">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如果您想转载，请署名及附上原文链接，转载时不得修改原文。</p>
						<p class="text-success">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如果本博侵犯您的权益，请邮件告知博主。</p>

					</div>

					<div class="muted">
						<small>
							<div>标签：关于我</div>
						</small>
					</div>

					<div class="row">
						<div class="span9">
							<!-- Baidu Button BEGIN -->
							<div id="bdshare" class="bdshare_t bds_tools get-codes-bdshare">
								<span class="bds_more">分享到：</span> <a class="bds_qzone">QQ空间</a>
								<a class="bds_tsina">新浪微博</a> <a class="bds_tqq">腾讯微博</a> <a
									class="bds_renren">人人网</a> <a class="bds_t163">网易微博</a> <a
									class="shareCount"></a>
							</div>
							<script type="text/javascript" id="bdshare_js"
								data="type=tools&amp;mini=1&amp;uid=5146054"></script>
							<script type="text/javascript" id="bdshell_js"></script>
							<script type="text/javascript">
								document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion="
										+ Math.ceil(new Date() / 3600000);
							</script>
							<!-- Baidu Button END -->
						</div>
					</div>
				</div>

				<div class="comments" id="comments"></div>

				<div class="respond">

					<!-- Duoshuo Comment BEGIN -->
					<div class="ds-thread"></div>
					<script type="text/javascript">
						var duoshuoQuery = {
							short_name : "blog3cm"
						};
						(function() {
							var ds = document.createElement('script');
							ds.type = 'text/javascript';
							ds.async = true;
							ds.src = 'http://static.duoshuo.com/embed.js';
							ds.charset = 'UTF-8';
							(document.getElementsByTagName('head')[0] || document
									.getElementsByTagName('body')[0])
									.appendChild(ds);
						})();
					</script>
					<!-- Duoshuo Comment END -->
					<!-- Baidu Button BEGIN -->
					<script type="text/javascript" id="bdshare_js"
						data="type=slide&amp;img=4&amp;pos=right&amp;uid=5146054"></script>
					<script type="text/javascript" id="bdshell_js"></script>
					<script type="text/javascript">
						document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion="
								+ Math.ceil(new Date() / 3600000);
					</script>
					<!-- Baidu Button END -->
				</div>
			</div>

			<!--sidebar start  -->
			<div class="sidebar">
				<div class="widget">
					<div class="textwidget">
						<iframe
							src="http://follow.v.t.qq.com/index.php?c=follow&a=quick&name=hcm627878968&style=5&t=1364623260852&f=1"
							frameborder="0" scrolling="auto" width="178" height="24"
							marginwidth="0" marginheight="0" allowtransparency="true"></iframe>
					</div>
				</div>
				<div class="widget">
					<div class="textwidget">
						<iframe width="100%" height="550" class="share_self"
							frameborder="0" scrolling="no"
							src="http://widget.weibo.com/weiboshow/index.php?language=zh_cn&width=0&height=550&fansRow=2&ptype=1&speed=300&skin=4&isTitle=1&noborder=1&isWeibo=1&isFans=1&uid=3201403375&verifier=323ccbb0&dpc=1"></iframe>
					</div>
				</div>

				<div class="widget">
					<h5 class="title muted ">分类</h5>
					<ul class="unstyled">
						<c:forEach var="category" items="${category }">
							<li><a
								href="${pageContext.request.contextPath }/${category.url }">${category.name
									}</a><small>(${category.acticleNum })</small></li>
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
							<li><a
								href="${pageContext.request.contextPath }/articles/listbymonth/1?date=${archives.date}">${archives.y_m
									}</a><small>(${archives.count })</small></li>
						</c:forEach>
					</ul>
				</div>

				<div class="widget">
					<h5 class="title muted">最近发表</h5>
					<ul>
						<c:forEach var="article_new" items="${article_new }">
							<li><a
								href="${pageContext.request.contextPath }/${article_new.url }">${article_new.title
									}</a></li>
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

		<!-- footer start -->
		<div class="footer">
			<hr>
			<span class="pull-right"><a href="#" rel="nofollow"
				title="返回页面顶部">↑回到顶部</a></span>
			<div>
				© 2013 HCM | Powered by <a style="text-decoration: none;"
					href="http://www.cloudfoundry.com/"><span
					style="color: #06CA19">Cloud Foundry</span></a>
			</div>
		</div>
		<!-- footer end -->
	</div>
	<!--end of container-->
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
</body>
</html>