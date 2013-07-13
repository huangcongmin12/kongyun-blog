<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${article.title } | KongYun</title>

<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet">
<script type="text/javascript" src="<c:url value="/resources/js/ga.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-1.8.2.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/function.js"/>"></script>

<link rel="stylesheet" href="<c:url value="/resources/kindeditor-4.1.6/plugins/code/prettify.css"/>"/>
<script type="text/javascript" src="<c:url value="/resources/kindeditor-4.1.6/plugins/code/prettify.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/kindeditor-4.1.6/kindeditor.js"/>"></script>
</head>
<body>
	<div class="container">
		<div class="header">
			<h1 class="site-title">
				<a href="${pageContext.request.contextPath }/" rel="home" >Kong Yun </a>
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
					</ul>
					<form class="navbar-search pull-right">
  						<input type="text"  class="search-query span2" placeholder="搜索..."><i class="icon-search"></i>
					</form>
				</div>
			</div>
		</div>
		<!-- header end  -->
		
		
		<div class="row">
			<div class="span9 show">
				<div class="post article">
					<div class="post-title">
					${article.title}
					</div>
					<div class="meta-date">
						<span>${article.time }</span>
					</div>
					<div class="content">${article.content }</div>
					
					<div class="muted">
						<small>
						<div> 
							分类：<a href="${pageContext.request.contextPath }/${article.category.url} " title="${article.category.name }">${article.category.name }</a>
							&nbsp; | &nbsp;阅读：<span >(${article.viewCount })</span>
						</div>
						<div>
							标签：<a   href="http://blog.wamaker.net/tag/chrome" title="查看chrome中的全部文章">${article.tags }</a>
						</div>
						</small>
					</div>

					<div class="row">
						<div class="span4 pull-left muted">
							<small>
							前一篇：
							<c:choose>
							  <c:when test="${! empty preArticle}"><a href="${pageContext.request.contextPath }/${preArticle.url }">${preArticle.title }</a></c:when>
							  <c:otherwise>没有了</c:otherwise>
							</c:choose> 
							</small>
						</div>
						<div class="span4 pull-right muted" style="text-align: right"> 
						   	<small>
						   	  后一篇：
						   	<c:choose>
							  <c:when test="${! empty afterArticle}"><a href="${pageContext.request.contextPath }/${afterArticle.url }">${afterArticle.title }</a></c:when>
							  <c:otherwise>没有了</c:otherwise>
							</c:choose> 
							</small>
						</div>
						 <div class="span9">
							<!-- Baidu Button BEGIN -->
							<div id="bdshare" class="bdshare_t bds_tools get-codes-bdshare">
							<span class="bds_more">分享到：</span>
							<a class="bds_qzone">QQ空间</a>
							<a class="bds_tsina">新浪微博</a>
							<a class="bds_tqq">腾讯微博</a>
							<a class="bds_renren">人人网</a>
							<a class="bds_t163">网易微博</a>
							<a class="shareCount"></a>
							</div>
							<script type="text/javascript" id="bdshare_js" data="type=tools&amp;mini=1&amp;uid=5146054" ></script>
							<script type="text/javascript" id="bdshell_js"></script>
							<script type="text/javascript">
							document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date()/3600000);
							</script>
							<!-- Baidu Button END -->
						</div> 
					</div>
				</div>
				
				<div class="comments" id="comments">
				</div>
				
				<div class="respond">

				<!-- Duoshuo Comment BEGIN -->
				<div class="ds-thread"></div>
				<script type="text/javascript">
				var duoshuoQuery = {short_name:"blog3cm"};
					(function() {
						var ds = document.createElement('script');
						ds.type = 'text/javascript';ds.async = true;
						ds.src = 'http://static.duoshuo.com/embed.js';
						ds.charset = 'UTF-8';
						(document.getElementsByTagName('head')[0] 
						|| document.getElementsByTagName('body')[0]).appendChild(ds);
					})();
					</script>
				<!-- Duoshuo Comment END -->
				<!-- Baidu Button BEGIN -->
				<script type="text/javascript" id="bdshare_js" data="type=slide&amp;img=4&amp;pos=right&amp;uid=5146054" ></script>
				<script type="text/javascript" id="bdshell_js"></script>
				<script type="text/javascript">
				document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date()/3600000);
				</script>
				<!-- Baidu Button END -->
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
		
		<!-- footer start -->
			<div class="footer">
				<hr>
				<span class="pull-right"><a href="#"
					rel="nofollow" title="返回页面顶部">↑回到顶部</a></span>
				<div>
					© 2013 HCM | Powered by <a style="text-decoration: none;" href="http://www.cloudfoundry.com/"><span style="color: #06CA19 ">Cloud Foundry</span></a>
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
  _gaq.push(['_setAccount', 'UA-36220755-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
</body>
</html>