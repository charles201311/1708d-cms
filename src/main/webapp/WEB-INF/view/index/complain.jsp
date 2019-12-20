<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>举报</title>
<!-- 引入样式 -->
<link href="/resource/css/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>

<script type="text/javascript">

function add(){
	$.post("/complain",$("#form1").serialize(),function(flag){
		if(flag){
			alert("举报成功");
			location.href="/"
		}else{
			alert("举报失败");
		}
	})
}
</script>
</head>
<body>
	<div align="center" class="container" style="width: 600px">
		<h1>举报信息</h1>
		<hr>
		<form action="" id="form1">
		 <input type="hidden" name="articleId" value="${article.id }">
		 <input type="hidden" name="user_id" value="${article.user.id }">
			<div class="form-group form-inline">
				举报类型:<select name="typename" class="form-control">
					<option>垃圾广告</option>
					<option>政治反动</option>
					<option>钓鱼网站</option>
				</select>
			</div>
			<div class="form-group form-inline">
				举报地址：<input type="text" name="url" class="form-control">
			</div>
			<div class="form-group form-inline">
				举报内容：
				<textarea rows="10" cols="100" name="content" class="form-control"></textarea>
			</div>
			<div class="form-group form-inline">
				附近：<input type="file" name="file" class="form-control">
			</div>
			<div class="form-group form-inline">
				<button type="button" onclick="add()">举报</button>
			</div>
		</form>
	</div>
</body>
</html>