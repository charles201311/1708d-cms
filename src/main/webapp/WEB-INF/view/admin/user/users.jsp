<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户列表</title>
<!-- 引入样式 -->
<link href="/resource/css/bootstrap.css" rel="stylesheet">
 <script type="text/javascript">
 function goPage(page){
	 location.href="/user/selects?page="+page
	 
 }
 
 </script>
</head>
<body>

	<table class="table table-dark table-bordered table-hover">
		<tr>
			<td>序号</td>
			<td>用户名</td>
			<td>昵称</td>
			<td>生日</td>
			<td>注册时间</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${info.list}" var="u" varStatus="i">
			<tr>
				<td>${i.count}</td>
				<td>${u.username }</td>
				<td>${u.nickname }</td>
				<td><fmt:formatDate value="${u.birthday }" pattern="yyyy-MM-dd" />
				</td>
				<td><fmt:formatDate value="${u.created }" pattern="yyyy-MM-dd" /></td>
				<td>${u.locked==0?"正常":"停用" }</td>
			</tr>

		</c:forEach>
		<tr>
			<td colspan="100">
			<jsp:include page="/WEB-INF/view/common/pages.jsp"/>

			</td>

		</tr>

	</table>

</body>
</html>