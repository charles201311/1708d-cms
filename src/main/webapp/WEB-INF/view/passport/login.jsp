<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CMS登录</title>
<!-- 引入样式 -->
<link href="/resource/css/bootstrap.css" rel="stylesheet">
<link href="/resource/css/index.css" rel="stylesheet">
<link href="/resource/css/jquery/screen.css" rel="stylesheet">
<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/resource/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resource/js/jquery.validate.js"></script>
</head>
<body>

	<div class="container">
		<h1>用户登录</h1>
		<hr>
		<span style="color: red">${error }</span>
		<div class="row">
			<div class="col-md-4">
				<form id="form1" action="/passport/login" method="post">
					<div class="form-group">
						<label for="username">用户名:</label> <input id="username"
							class="form-control" type="text" name="username"
							value="${username}">
					</div>
					<div class="form-group">
						<label for="password">密码:</label> <input id="password"
							class="form-control" type="password" name="password">
					</div>
					<div class="form-group form-inline">
						<label for="isRemember">30天免登陆:</label> <input 
							class="form-check-input" type="checkbox" name="isRemember">
					</div>
					<div class="form-group">
						<button class="btn btn-info" type="submit">登录</button>
						<button class="btn btn-info" onclick="goReg()" type="button">去注册</button>
						<button class="btn btn-warning" type="reset">重置</button>
					</div>

				</form>

			</div>
			<div class="col-md-8">
				<img alt="" src="/resource/images/login-bg.jpg"
					style="width: 450px; height: 350px" class="rounded-circle">
			</div>
		</div>
	</div>


	</div>
	<script type="text/javascript">
		function goReg() {
			location.href = "/passport/reg";
		}

		$(function() {

			//页面加载时.执行校验
			$("#form1").validate({
				//1.定义校验规则
				rules : {
					username : {
						required : true,
					},
					password : {
						required : true,
					}
				},

				//规则提示
				messages : {
					username : {
						required : "用户名必须输入",
					},
					password : {
						required : "密码必须输入",

					}
				}

			})

		})
	</script>
</body>
</html>