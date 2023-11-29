<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="renderer" content="webkit">
  		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>后台管理系统</title>
		<link rel="stylesheet" type="text/css" href="static/admin/layui/css/layui.css"/>
		<link rel="stylesheet" type="text/css" href="static/admin/css/admin.css"/>
	</head>
	<body>
		<div class="layui-tab page-content-wrap">
		  <ul class="layui-tab-title">
		    <li class="layui-this">修改密码</li>
		  </ul>
		  <div class="layui-tab-content">
		    <div class="layui-tab-content">
				  <div class="layui-form-item">
				    <label class="layui-form-label">用户名：</label>
				    <div class="layui-input-block">
				      <input type="text" name="uname" disabled autocomplete="off" class="layui-input layui-disabled" value="${uname }">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">旧密码：</label>
				    <div class="layui-input-block">
				      <input type="password" id="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">新密码：</label>
				    <div class="layui-input-block">
				      <input type="password" id="password1" name="password1" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">重复密码：</label>
				    <div class="layui-input-block">
				      <input type="password" id="password2" name="password2" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <div class="layui-input-block">
				      <button class="layui-btn " onclick="updatePwd()" >立即提交</button>
				    </div>
				  </div>
		    </div>
		  </div>
		</div>
	<script src="static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<script src="static/admin/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
	function updatePwd() {
		   	var pwd = document.getElementById("password").value;
		   	var pwd1 = document.getElementById("password1").value;
		   	var pwd2 = document.getElementById("password2").value;
		   	if(pwd1 == pwd2){
		   		$.ajax({
					url : "Login",
					type : "get",
					async: true,
					dataType:"json",
					data : {
						"method" : "updateUsers",
						"pwd" : pwd,
						"pwd1" : pwd1,
					},
					success : function(result) {
						if (result == "1") {
							alert("修改成功！");
							window.location.href = "Login?method=users";
						} else if(result=="2"){
							alert("密码错误，请检查");
						}else{
							alert("发生异常错误");
						}
					},
					error : function() {
						console.log("失败");
					},
				});
			}else {
				alert("两次密码不同，请重新输入！");
				}
			}
	</script>
	</body>
</html>