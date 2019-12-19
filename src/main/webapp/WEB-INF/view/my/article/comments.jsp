<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <div>
	    <dl>
	      <c:forEach items="${info.list}" var="comment">
	       <dt style="font-size: 20px"><a href="/article?id=${comment.articleId }" target="_blank">${comment.article.title }</a></dt>
	       	 <dt>${comment.user.username },<fmt:formatDate value="${comment.created }" pattern="yyyy-MM-dd HH:mm:ss"/>  </dt>
	       
	      <dd>${comment.content }</dd>
	      <hr>
	      </c:forEach>
	   </dl>
	    
	  
	  </div>
</body>
</html>