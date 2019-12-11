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
	 //location.href="/user/selects?page="+page
		var  url="/user/selects?page="+page
		$("#center").load(url);	 //
			 
 }
 function query(){
	 var  url="/user/selects?username="+$("[name='username']").val()
	 $("#center").load(url)
 }
 
 </script>
</head>
<body>
<div class="container-fluid">
  <div style="margin-bottom: 10px" class="form-inline">
  <label for="username">用户名:</label>
  <input id="username" class="form-control" type="text" name="username" value="${username }">
    &nbsp;
    <button class="btn btn-info" type="button" onclick="query()"> 查询</button>
  
  </div>

	<table class="table table-bordered table-hover">
		<tr align="center">
			<td>序号</td>
			<td>用户名</td>
			<td>昵称</td>
			<td>生日</td>
			<td>注册时间</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${info.list}" var="u" varStatus="i">
			<tr align="center">
				<td>${i.count}</td>
				<td>${u.username }</td>
				<td>${u.nickname }</td>
				<td><fmt:formatDate value="${u.birthday }" pattern="yyyy-MM-dd" />
				</td>
				<td><fmt:formatDate value="${u.created }" pattern="yyyy-MM-dd" /></td>
				<td><c:if test="${u.locked==0}">
				 <button type="button" class="btn btn-success" onclick="update(${u.id},this)">正常</button>
				
				</c:if>
				<c:if test="${u.locked==1}">
				 <button type="button" class="btn btn-warning" onclick="update(${u.id},this)">停用</button>
				
				</c:if>
				
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
//更新用户状态 locked   1:停用, 0:正常
function update(id,obj){
	//要改变为的状态
	var locked =$(obj).text()=="正常"?1:0;
	
	$.post("/user/update",{id:id,locked:locked},function(flag){
		if(flag){
			//alert("操作成功");
			//改变内容
			$(obj).text(locked==1?"停用":"正常");
			//改变颜色
			$(obj).attr("class",locked==1?"btn btn-warning":"btn btn-success")
		}else{
			alert("操作失败")
		}
	})
	
	
}

</script>

</html>