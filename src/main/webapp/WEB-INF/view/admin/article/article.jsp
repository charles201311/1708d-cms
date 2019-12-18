<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${a.title }</title>
<!-- 引入样式 -->
<link href="/resource/css/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
 <script type="text/javascript">
  function chk(status,id){
	  $.post("/admin/article/update",{id:id,status:status},function(flag){
		  if(flag){
			  alert("操作成功");
		  }else{
			  alert("操作失败");
		  }
	  })
  }
 
 </script>
</head>
<body>
	<div class="container">
	 
	  <h1 align="center">${a.title }</h1>
	  <div>
	  <button type="button" class="btn btn-success" onclick="chk(1,${a.id})">同意</button>
	  <button type="button" class="btn btn-danger"  onclick="chk(-1,${a.id})">驳回</button>
	  <button type="button" class="btn btn-info"  onclick="window.close()">关闭</button>
	  
	  </div>
	  <h3>${a.user.username} <fmt:formatDate value="${a.created }" pattern="yyyy-MM-dd HH:mm:ss"/></h3>
	  <div align="center"> ${a.content }</div> 
	
	</div>
</html>