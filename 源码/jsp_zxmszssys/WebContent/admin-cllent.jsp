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
		<link rel="stylesheet" type="text/css" href="static/admin/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="static/admin/css/admin.css" />
	</head>

	<body>
		<div class="page-content-wrap">
			<form class="layui-form" action="">
				<div class="layui-form-item">
					<div class="layui-inline tool-btn">
						<a href="admin-cllentAdd.jsp" class="layui-btn layui-btn-small layui-btn-normal  hidden-xs"><i class="layui-icon">添加用户</i></a>
					</div>
					<div class="layui-inline">
						<input type="text" id="uname" required lay-verify="required" placeholder="请输入电话号码" autocomplete="off" class="layui-input">
					</div>
					<button class="layui-btn layui-btn-normal" type="button" id="btnsearch" onclick="searchCar()">搜索</button>
				</div>
			</form>
			<div class="layui-form" id="table-list">
				<table class="layui-table" lay-skin="line">
					<colgroup>
						<col class="hidden-xs" >
						<col class="hidden-xs" >
						<col class="hidden-xs">
						<col class="hidden-xs" >
						<col class="hidden-xs" >
						<col class="hidden-xs" >
						<col class="hidden-xs">
					</colgroup>
					<thead>
						<tr>
							<th class="hidden-xs">ID</th>
							<th class="hidden-xs">姓名</th>
							<th class="hidden-xs">电话</th>
							<th class="hidden-xs">性别</th>
							<th class="hidden-xs">年龄</th>
							<th class="hidden-xs">身份标识码</th>
							<th class="hidden-xs">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${cllent }" var="cllent" varStatus="status">
							<tr id='node-1' class="parent collapsed">
								<td class="hidden-xs">${status.index+1 }</td>
								<td class="hidden-xs">${cllent.cll_name }</td>
								<td class="hidden-xs">${cllent.ctel }</td>
								<td class="hidden-xs">${cllent.csex }</td>
								<td class="hidden-xs">${cllent.age }</td>
								<td class="hidden-xs">${cllent.id_code }</td>
								<td>
									<button class="layui-btn layui-btn-mini layui-btn-normal  edit-btn" data-id="1" onclick="updateCllent('${cllent.cll_id}')"><i class="layui-icon">编辑</i></button>
									<button class="layui-btn layui-btn-mini layui-btn-danger del-btn" data-id="1"  onclick="resetPwd('${cllent.ctel }')"><i class="layui-icon">重置密码</i></button>
									<button title="删除" class="layui-btn layui-btn-mini layui-btn-danger del-btn" data-id="1"  onclick="deleteCllent('${cllent.ctel }')"><i class="layui-icon">&#xe640;</i></button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<script src="static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script src="static/admin/js/common.js" type="text/javascript" charset="utf-8"></script>
	</body>
	<script type="text/javascript">
		function searchCar() {
			var vname = document.getElementById("uname").value;
			window.location.href = "Cllent?method=searchCllent&ctel=" + vname;
		}

		function resetPwd(uname) {
			if(confirm("重置密码？")) {
				alert("成功！");
				window.location.href = "Cllent?method=resetPwd&ctel=" + uname;
			} else {

			}
		}

		function updateCllent(cid) {
			window.location.href = "Cllent?method=updateCllent&cllId=" + cid;
		}

		function deleteCllent(uname) {
			if(confirm("确认删除？删除后不可恢复！")) {
				window.location.href = "Cllent?method=deleteCllent&ctel=" + uname;
			} else {

			}
		}
	</script>

</html>