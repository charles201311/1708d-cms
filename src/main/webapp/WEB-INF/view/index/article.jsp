<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${article.title }</title>
<!-- 引入样式 -->
<link href="/resource/css/bootstrap.css" rel="stylesheet">

</head>
<body>
	<div class="container">
	  <h1 align="center">${article.title }</h1>
	  <h3>${a.user.username} <fmt:formatDate value="${article.created }" pattern="yyyy-MM-dd HH:mm:ss"/></h3>
	  <div align="center"> ${article.content }</div> 
	
	  <div>
	    <jsp:include page="/WEB-INF/view/index/comment.jsp"/>
	  
	  </div>
	  <div>
	    <dl>
	      <c:forEach items="${info.list}" var="comment">
	      <dt>${comment.user.username },<fmt:formatDate value="${comment.created }" pattern="yyyy-MM-dd HH:mm:ss"/>  </dt>
	      <dd>${comment.content }</dd>
	      <hr>
	      </c:forEach>
	   </dl>
	    
	  
	  </div>
	
	</div>
</html>