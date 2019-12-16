<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>个人中心</title>
<!-- 引入样式 -->
<link href="/resource/css/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
</head>
<body>
	<div class="container">
		<!-- header -->
		<div class="row" style="height: 80px; margin-top: 8px">
			<div class="col-md-12" style="background-color: black">
				<img alt="" src="/resource/images/logo.png" height="80px"
					class="rounded-circle"> <font color="#ffffff">个人中心</font>
			</div>
		</div>
		<hr style="height: 1px; border: none; border-top: 1px dotted #185598;" />

		<div class="row" style="height: 550px">
			<!-- 菜单 -->
			<div class="col-md-3" style="background-color: #ccc" >
				<div class="list-group" style="margin-top: 20px">
					<a id="aaa" href="#" data="/my/article/articles" class="list-group-item list-group-item-action active">
						我的文章 </a> <a href="#" data="/my/article/publish"
						class="list-group-item list-group-item-action">发布文章</a> <a
						href="#" class="list-group-item list-group-item-action">我的收藏</a> <a
						href="#" class="list-group-item list-group-item-action">用户设置</a> <a
						href="#" class="list-group-item list-group-item-action disabled"
						tabindex="-1" aria-disabled="true">发布图片</a>
				</div>
			</div>
			<!-- 中间内容区域 -->
			<div class="col-md-9" id="center">
				<!-- 引入kindeditor ,但不显示-->
				<div style="display: none">
					<jsp:include page="/resource/kindeditor/jsp/demo.jsp" />
				</div>
			</div>


		</div>


	</div>


</body>
<script type="text/javascript">
	$(function() {
		 //默认现在我的文章列表
		$("#center").load("/my/article/articles");
		

		//为a标签添加点击事件
		$("a").click(function() {
			var url = $(this).attr("data");
			//先删除已有的选中样式
			$("a").removeClass("active");
			//再为点击的a标签添加点击样式
			$(this).addClass("active");
			//在中间区域加载url
			$("#center").load(url);
		})
	})
</script>
</html>