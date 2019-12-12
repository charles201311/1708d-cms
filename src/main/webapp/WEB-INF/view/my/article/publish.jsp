<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<title>KindEditor JSP</title>
<link rel="stylesheet"
	href="/resource/kindeditor/themes/default/default.css" />
<link rel="stylesheet"
	href="/resource/kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="/resource/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="/resource/kindeditor/lang/zh-CN.js"></script>
<script charset="utf-8"
	src="/resource/kindeditor/plugins/code/prettify.js"></script>
<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content1"]', {
				cssPath : '/resource/kindeditor/plugins/code/prettify.css',
				uploadJson : '/resource/kindeditor/jsp/upload_json.jsp',
				fileManagerJson : '/resource/kindeditor/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
</head>
<body>
	<%=htmlData%>



	<form name="example" method="post" action="demo.jsp">
		<div class="form-group">
			<label for="title">文章标题:</label> <input id="title"
				class="form-control" type="text" name="title">

		</div>
		<div class="form-group form-inline">
			<label>文章栏目:</label> <select class="form-control" name="channelId" id="channel">
                   <option>请选择</option>

			</select>
			
			<label>文章分类:</label> <select class="form-control" name="categoryId" id="category">
               <option>请选择</option>

			</select>
		</div>
        <div  class="form-group">
         文章标题图片:
         <input type="file" name="file" class="form-control">
        
        </div>


		<textarea name="content1" cols="100" rows="8"
			style="width: 100%; height: 250px; visibility: hidden;"><%=htmlspecialchars(htmlData)%></textarea>
		<br /> <input type="submit" name="button" value="提交内容" />


	</form>
</body>

<script type="text/javascript">
$(function(){
	
	//查询所有栏目并回显
	$.get("/my/channel/selects",function(list){
		for(var i in list){
			$("#channel").append("<option value='"+list[i].id+"'>"+list[i].name+"</option>")
			
		}
		
	})
	//为栏目添加改变事件,即当栏目改变时去查询栏目下的分类
	$("#channel").change(function(){
		var channelId =$(this).val();
		
		//先清空原有的栏目
		$("#category").empty();
		$("#category").append("<option>请选择</option>");
		if(channelId=="请选择")
			return ;
		$.get("/my/category/selectsByChannelId",{channelId:channelId},function(list){
			for(var i in list){
				$("#category").append("<option value='"+list[i].id+"'>"+list[i].name+"</option>")
				
			}
			
		})
	})
	
	
})

</script>
</html>
<%!
private String htmlspecialchars(String str) {
	str = str.replaceAll("&", "&amp;");
	str = str.replaceAll("<", "&lt;");
	str = str.replaceAll(">", "&gt;");
	str = str.replaceAll("\"", "&quot;");
	return str;
}
%>