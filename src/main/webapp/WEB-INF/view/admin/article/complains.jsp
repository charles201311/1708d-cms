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

$(function(){
	$("#typename").val('${complainVO.typename}');
	
	
})
	


 function goPage(page){
	 //location.href="/user/selects?page="+page
			 var orderMethod = '${complainVO.orderMethod}';
			 var orderName = '${complainVO.orderName}';
		var  url="/admin/article/complains?page="+page+$("#form1").serialize()+"&orderName="+orderName+"&orderMethod="+orderMethod;
		$("#center").load(url);	 //
			 
 }
 function query(){
	 //获取举报类型
	 var  url="/admin/article/complains?"+$("#form1").serialize();
	 $("#center").load(url)
 }
 
 //排序
 function myOrder(orderName){
	 
	 var orderMethod ='${complainVO.orderMethod=="desc"?"asc":"desc"}';
	var url="/admin/article/complains?orderName="+orderName+"&orderMethod="+orderMethod 
	 $("#center").load(url);
 }
 
 </script>
</head>
<body>
	<div class="container-fluid">
	 <form id="form1">
		<div class="form-group form-inline">
         
			举报类型:<select name="typename" class="form-control" id="typename">
				<option value="">所有</option>
				<option>垃圾广告</option>
				<option>政治反动</option>
				<option>钓鱼网站</option>
			</select> 投诉次数：<input class="form-control" type="text" name="startNum"
				value="${complainVO.startNum}">-- <input
				class="form-control" type="text" name="endNum"
				value="${complainVO.endNum}">
		</div>
		<div class="form-group form-inline">
			投诉日期：<input class="form-control" type="text" name="startTime"
				value="${ complainVO.startTime }">-- <input
				class="form-control" type="text" name="endTime"
				value="${ complainVO.endTime }">

			<button class="btn btn-info" type="button"
				onclick="query()">查询</button>
		</div>
		</form>
	</div>

	<table class="table table-bordered table-hover">
		<tr align="center">
			<td>序号</td>
			<td>文章标题</td>
			<td>文章url</td>
			<td>举报类型</td>
			<td>举报内容</td>
			<td>举报人</td>
			<td><a href="javascript:myOrder('created')">举报时间</a></td>
			<td><a href="javascript:myOrder('complain_num')">举报数量</a></td>
			<td>操作</td>
		</tr>
		<c:forEach items="${info.list}" var="u" varStatus="i">
			<tr align="center">
				<td>${i.count}</td>
				<td>${u.article.title }</td>
				<td>${u.url }</td>
				<td>${u.typename }</td>
				<td>${u.content }</td>
				<td>${u.user.username }</td>
				<td>${u.created }</td>
				<td>${u.article.complainNum }</td>
				  <!-- status:0:待審核，1：已審核 -1 駁回， 2 禁止 -->
				<td><c:if test="${u.article.status==1}">
				 <button type="button" class="btn btn-success" onclick="update(${u.article.id},this)">正常</button>
				
				</c:if>
				<c:if test="${u.article.status==2}">
				 <button type="button" class="btn btn-warning" onclick="update(${u.article.id},this)">停用</button>
				
				</c:if>
				
				 </td>
			</tr>

		</c:forEach>
		<tr align="center">
			<td colspan="10"><jsp:include
					page="/WEB-INF/view/common/pages.jsp" /></td>

		</tr>

	</table>
	</div>
</body>
<script type="text/javascript">
//更新用户状态 locked   1:停用, 0:正常
function update(id,obj){
	//要改变为的状态
	var status =$(obj).text()=="正常"?2:1;
	
	$.post("/admin/article/update",{id:id,status:status},function(flag){
		if(flag){
			//alert("操作成功");
			//改变内容
			$(obj).text(status==2?"停用":"正常");
			//改变颜色
			$(obj).attr("class",status==2?"btn btn-warning":"btn btn-success")
		}else{
			alert("操作失败")
		}
	})
	
	
}

</script>

</html>