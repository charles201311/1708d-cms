<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文章列表</title>
<!-- 引入样式 -->
<link href="/resource/css/bootstrap.css" rel="stylesheet">

</head>
<body>
<div class="container-fluid">
  <div style="margin-bottom: 10px" class="form-inline">
  <label for="title">标题:</label>
  <input id="title" class="form-control" type="text" name="title" value="${article.title }">
    &nbsp;
    审核状态:
    <select class="form-control" name="status" id="status">
     <option value="0">待审</option>
     <option value="1">已审</option>
     <option value="-1">驳回</option>
     <option value="99">全部</option>
    </select>
       &nbsp;
    <button class="btn btn-info" type="button" onclick="query()">
     查询</button>
  
  </div>

	<table class="table table-bordered table-hover">
		<tr align="center">
			<td>序号</td>
			<td>文章标题</td>
			<td>栏目</td>
			<td>分类</td>
			
			<td>作者</td>
			<td>文章状态</td>
			<td>发布时间</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${info.list}" var="a" varStatus="i">
			<tr align="center">
				<td>${i.count}</td>
				<td>${a.title }</td>
				<td>${a.channel.name }</td>
				<td>${a.category.name }</td>
				<td>${a.user.username }</td>
				<td>${a.status==0?"待审":a.status==1?"已审":"驳回" }
				</td>
				<td><fmt:formatDate value="${a.created }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td>详情			
				 </td>
			</tr>

		</c:forEach>
		<tr align="center">
			<td colspan="10">
			<jsp:include page="/WEB-INF/view/common/pages.jsp"/>

			</td>

		</tr>

	</table>
</div>
 </body>
 <script type="text/javascript">
 function goPage(page){
	 //location.href="/user/selects?page="+page
		var  url="/admin/article/selects?page="+page
		$("#center").load(url);	 //
			 
 }
 function query(){
	 var  url="/admin/article/selects?title="+$("[name='title']").val()+"&status="+$("[name='status']").val()
	 $("#center").load(url)
 }
 
 //让下拉框的查询条件回显
 $(function(){
	 $("#status").val('${article.status}');
 })
 
 </script>

</html>