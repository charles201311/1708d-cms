<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CMS注册</title>
<!-- 引入样式 -->
<link href="/resource/css/bootstrap.css" rel="stylesheet">
<link href="/resource/css/jquery/screen.css" rel="stylesheet">
<link href="/resource/css/.css" rel="stylesheet">
<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/resource/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resource/js/jquery.validate.js"></script>

</head>
<body>

	<div class="container">
		<h1>用户注册</h1>
		<hr>
			<span style="color: red">${error }</span>
		<div class="row">
			<div class="col-md-4">
				<form id="form1" action="/passport/reg" method="post">
					<div class="form-group">
						<label for="username">用户名:</label> <input id="username"
							class="form-control" type="text" name="username" value="${user.username }">
					</div>
					<div class="form-group">
						<label for="password">密码:</label> <input id="password"
							class="form-control" type="password" name="password" value="${user.password }">
					</div>
					<div class="form-group">
						<label for="repassword">确认密码:</label> <input id="repassword"
							class="form-control" type="password" name="repassword" value="${user.repassword }">
					</div>
					<div class="form-group  form-inline">
						<label>性别:</label> <input type="radio" name="gender"
							class="form-control" value="0" checked="checked">男 <input
							type="radio" name="gender" class="form-control" value="1">女
					</div>

					<div class="form-group">
						<button class="btn btn-info" type="submit">注册</button>
						<button class="btn btn-warning" type="reset">重置</button>
					</div>

				</form>

			</div>
			<div class="col-md-8">
				<img alt="" src="/resource/images/reg-bg.jpg"
					style="width: 450px; height: 350px" class="rounded-circle">
			</div>
		</div>
	</div>

	<script type="text/javascript">
		
		$(function(){
			
			//页面加载时.执行校验
			$("#form").validate({
			 //1.定义校验规则
			  rules:{
				  username:{
					  required:true,
					  rangelength:[2,10],//用户名的长度必须在2-10之间
				  },
				  password:{
					  required:true,
					  rangelength:[6,12]  ,//密码长度在6-12之间
				  },
				  repassword:{
					  required:true,
					  equalTo:"#password",//两次密码必须一致
				  }
			  },
			
			//规则提示
			messages:{
				username:{
					  required:"用户名必须输入",
					  rangelength:"用户名的长度必须在2-10之间",
				  },
				  password:{
					  required:"密码必须输入",
					  rangelength:"密码长度在6-12之间",
				  },
				  repassword:{
					  required:"确认密码必须输入",
					  equalTo:"两次密码必须一致",
				  }
			}
				
				
			})
			
			
		})
		
		
		</script>
</body>
</html>