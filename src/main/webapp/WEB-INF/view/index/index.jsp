<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CMS首页</title>
<!-- 引入样式 -->
<link href="/resource/css/bootstrap.css" rel="stylesheet">
<link href="/resource/css/index.css" rel="stylesheet">
<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/resource/js/bootstrap.min.js"></script>

<style type="text/css">
.subchannel {
	height: 38px;
	width: 100%;
	z-index: 50;
	margin-bottom: 16px;
}

.subchannel .sub-list {
	top: -50px;
	background: #fff;
	height: 38px;
	border-bottom: 2px solid #f2f2f2;
}

.subchannel .sub-item:first-child {
	margin-left: 0 !important;
}

.subchannel .sub-selected {
	color: #f85959;
	border-bottom: 2px solid #f85959;
}

.subchannel .sub-item {
	line-height: 38px;
	font-size: 16px;
	display: inline-block;
	color: #444;
	margin-left: 33px;
	background: #fff;
}

li {
	list-style: none;
}
</style>

<style type="text/css">
.ex {
	white-space: nowrap; /*不换行的*/
	overflow: hidden; /*超出范围隐藏*/
	text-overflow: ellipsis; /*超出用省略号 */
}
</style>
</head>
<body>

	<div class="container-fluid">
		<div class="row" style="height: 34px; background-color: #222222">
			<a href="#"><font color="#FFFFFF" size="3px">下载APP</font></a>
			<div style="left: -8px">
				<a href="/passport/login"> 登录</a>|<a href="/passport/reg"> 注册</a>
			</div>
		</div>
	</div>
	<div class="container" style="margin-top: 5px">
		<div class="row">
			<!-- 左侧栏目 -->
			<div class="col-md-2" style="height: 550px">
				<img alt="" src="/resource/images/logo-index.jpg">
				<ul class="list-group">
					<li class="channel-item ${article.channelId==null?"active":"" }" ><a
						href="/">推荐</a></li>

					<c:forEach items="${channels}" var="c">

						<li class="channel-item ${c.id==article.channelId?"active":"" }" ><a
							href="?channelId=${c.id }">${c.name } </a></li>

					</c:forEach>
				</ul>
			</div>
			<div class="col-md-7">
				<!--轮播图-->
				<c:if test="${null==article.channelId }">
					<div>

						<div id="carouselExampleCaptions" class="carousel slide"
							data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carouselExampleCaptions" data-slide-to="0"
									class="active"></li>
								<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
								<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
							</ol>
							<div class="carousel-inner">

								<c:forEach items="${slides}" var="s" varStatus="i">
									<div class="carousel-item ${i.index==0?"active":"" }" >
										<img src="/pic/${s.url }" class="d-block w-100" alt="...">
										<div class="carousel-caption d-none d-md-block">
											<h5>${s.title }</h5>
										</div>
									</div>
								</c:forEach>

							</div>

							<a class="carousel-control-prev" href="#carouselExampleCaptions"
								role="button" data-slide="prev"> <span
								class="carousel-control-prev-icon" aria-hidden="true"></span> <span
								class="sr-only">Previous</span>
							</a> <a class="carousel-control-next" href="#carouselExampleCaptions"
								role="button" data-slide="next"> <span
								class="carousel-control-next-icon" aria-hidden="true"></span> <span
								class="sr-only">Next</span>
							</a>
						</div>
					</div>
				</c:if>

				<!-- 中间的分类 -->
				<div>
					<ul class="subchannel">
						<li class="sub-item ${article.categoryId==null?"sub-selected":"" }"><a
							class="nav-link" href="?channelId=${article.channelId}">全部 </a></li>
						<c:forEach items="${categorys}" var="c">
							<li class="sub-item ${c.id==article.categoryId?"sub-selected":"" }"><a
								class="nav-link"
								href="?channelId=${article.channelId}&categoryId=${c.id }">${c.name }
							</a></li>
						</c:forEach>

					</ul>

				</div>
				<hr>
				<!-- 分类文章 -->
				<div>
					<c:forEach items="${info.list}" var="a">
						<div class="media">
							<a href="/article?id=${a.id}" target="_blank"><img src="/pic/${a.picture }" class="mr-3" alt="..."
								style="width: 156px; height: 101.8px"></a>
							<div class="media-body">
								<h5 class="mt-0"><a href="/article?id=${a.id}" target="_blank">${a.title }</a></h5>
								<h5 style="margin-top: 5px">${a.user.username}
									<fmt:formatDate value="${a.created}"
										pattern="yyyy-MM-dd HH:mm:ss" />
								</h5>
							</div>
						</div>
						<hr />
					</c:forEach>

					<jsp:include page="/WEB-INF/view/common/pages.jsp"></jsp:include>
				</div>
			</div>
			<div class="col-md-3">

				<div class="card" style="width: 18rem; padding-left: 2px">
					<div class="card-header">最新文章</div>
					<br>
					<c:forEach items="${lastInfo.list }" var="last">
						<div class="class-body">
							<div class="media">
								<a href="/article?id=${last.id}" target="_blank"><img src="/pic/${last.picture }" class="mr-3" alt="..." style="height: 60px;width: 60px"></a>
								<div class="media-body">
								      <h6><a href="/article?id=${last.id}" target="_blank">${last.title }</a></h6>
								</div>
							</div>
						</div>
						<hr>
					</c:forEach>
				</div>




			</div>
		</div>

	</div>
	</div>
	<script type="text/javascript">
		function goPage(page) {
              var  channelId='${article.channelId}';
              var  categoryId='${article.categoryId}';
              
			location.href = "?channelId="+channelId+"&categoryId="+categoryId+"&page="
					+ page;

		}
	</script>

</body>
</html>