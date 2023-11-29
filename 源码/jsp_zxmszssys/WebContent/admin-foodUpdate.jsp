<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>后台管理系统</title>
<link rel="stylesheet" type="text/css"
	href="static/admin/layui/css/layui.css" />
<link rel="stylesheet" type="text/css" href="static/admin/css/admin.css" />
<script src="static/admin/layui/layui.js" type="text/javascript"
	charset="utf-8"></script>
<script src="static/admin/js/jquery-3.2.1.min.js"></script>
</head>
<body>
	<div class="layui-tab page-content-wrap">
		<form action="FoodServlet"
			enctype="multipart/form-data" >
			<input type="hidden" name="method" value="updateFood1">
			<input type="hidden" name="fooId" value="${food.foo_id }">
			<div class="layui-form-item">
				<label class="layui-form-label">选择景点：</label>
				<div class="layui-input-block">
					<select id="fooId" name="sceId" lay-verify="required"><option value="${food.sce_id }">${food.sce_name }</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">美食名称：</label>
				<div class="layui-input-block">
					<input type="text" id="fooName" name="fooName" required lay-verify="required"
						value="${food.foo_name }" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">图片：</label>
				<div class="layui-input-block">
						<img src="/zxmszssys/${food.img_url}" width="200px" class="img-responsive"> 
						<input type="hidden" name="imgUrl" value="/zxmszssys/${food.img_url}"> 
						<input name="Savatar" type="file" class="layui-input">
					</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">详细地址：</label>
				<div class="layui-input-block">
					<input type="text" id="address" name="address" required lay-verify="required"
						value="${food.address}" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">描述：</label>
				<div class="layui-input-block">
					<textarea id="orgAuditDesc" name="description"
						style="font-size: 20px; width: 1000px; height: 200px;">${food.description}</textarea>
					<p>
						<span id="text-count">255</span>/255
					</p>

				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<input class="layui-btn " type="submit" value="提交" onclick="ok()">
				</div>
			</div>
		</form>
	</div>
</body>
<style >
select {
	width: 200px;
	height: 40px;
	font-size:16px;
}
</style>
<script type="text/javascript">

$(function() {
	$.ajax({
		type: "POST",
		async: false,
		url: "ScenicServlet",
		data: {
			"method": "scenic"
		},
		dataType: "json",
		success: function(data) {
			console.log(data);
			var option = '';
			$.each(data, function(i, n) {
				option += '<option value="' + n.sce_id + '">' + n.sce_name +'</option>';
			})
			$("#fooId").append(option);
		}
	});
})



	/*字数限制*/
	$("#orgAuditDesc").on("input propertychange", function() {
		var $this = $(this), _val = $this.val(), count = "";
		if (_val.length > 255) {
			$this.val(_val.substring(0, 255));
		}
		count = 255 - $this.val().length;
		$("#text-count").text(count);
	});
	function ok() {
		alert("成功！");
	}
</script>
</html>