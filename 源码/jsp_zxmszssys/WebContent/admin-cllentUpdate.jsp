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
</head>
<body>
	<div class="wrap-container">
		<form id="form1" class="layui-form" style="width: 90%; padding-top: 20px;" action="" >
			<input type="hidden" name="method" value="updateCllent1">
			<div class="layui-form-item">
				<label class="layui-form-label">用户账号：</label>
				<div class="layui-input-block">
					<input type="text" name="ctel" readonly="readonly" required lay-verify="required"
						placeholder="请输入电话号码" autocomplete="off" value="${cllent.ctel }" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">用户姓名：</label>
				<div class="layui-input-block">
					<input type="text" name="cllName" required lay-verify="required"
						placeholder="请输入姓名" autocomplete="off" value="${cllent.cll_name }" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">性别：</label>
				<div class="layui-input-block">
					<select name="csex"><option value="${cllent.csex }">${cllent.csex }</option><option value="男">男</option><option value="女" >女</option></select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">年龄：</label>
				<div class="layui-input-block">
					<input type="text" id="age" name="age" required lay-verify="required"
						placeholder="请输入年龄" autocomplete="off" value="${cllent.age }" class="layui-input">
						</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">唯一标识码：</label>
				<div class="layui-input-block">
					<input type="text" name="idCode" required lay-verify="required"
						placeholder="请输入标识码" autocomplete="off" value="${cllent.id_code }" class="layui-input">
						</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
				<button class="layui-btn" type="button" lay-filter="reg" lay-submit="" onclick="cllentAdd()" id="signuppass">提交</button>
				</div>
			</div>
		</form>
	</div>

	<script src="static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<script src="static/admin/js/jquery.js"></script>
	<script>
		//Demo
		layui.use([ 'form' ], function() {
			var form = layui.form();
			form.render();
		});
		
	</script>
</body>
<script type="text/javascript">
function cllentAdd() {
	var re = /^[1-9]+[0-9]*]*$/; //判断字符串是否为数字 //判断正整数 /^[1-9]+[0-9]*]*$/ /^[0-9]+.?[0-9]*$/; 
	//监听提交
	var age = $("#age").val();
	if(!re.test(age) || age.length > 2){
		layer.msg('请输入1-100的数字!', {
			icon: 2,
			time: 1000
		});
		return false;
	}else {
		$.ajax({
			type: "post",
			url: "Cllent",
			data: $("#form1").serialize(),
			async: false,
			success: function(data) {
				console.log(data);
				if(data == "1") {
					layer.msg('成功!', {
						icon: 1,
						time: 1000
					});
					setTimeout(function() {
						window.location.href ="Cllent?method=cllentList";
					}, 800);
					
				} else {
					layer.msg('失败!', {
						icon: 2,
						time: 1000
					});
				}
			},
			error: function() {
				layer.msg('发生未知错误!', {
					icon: 2,
					time: 1000
				});
			}

		});
	}
}
</script>
</html>