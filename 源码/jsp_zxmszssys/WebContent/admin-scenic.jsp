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
						<a href="admin-scenicAdd.jsp" class="layui-btn layui-btn-small layui-btn-normal  hidden-xs"><i class="layui-icon">&#xe654;</i></a>
					</div>
					<div class="layui-inline">
						<input type="text" id="vname" required placeholder="请输入" autocomplete="off" class="layui-input">
					</div>
					<button class="layui-btn layui-btn-normal" type="button" id="btnsearch" onclick="searchCar()">搜索</button>
				</div>
			</form>
			<div class="layui-form" id="table-list">
				<table class="layui-table" >
					<colgroup>
						<col class="hidden-xs"  width="50px">
						<col class="hidden-xs"  width="100px">
						<col class="hidden-xs"  width="100px">
						<col class="hidden-xs"  width="100px">
						<col class="hidden-xs"  width="400px">
						<col class="hidden-xs" width="100px">
					</colgroup>
					<thead>
						<tr>
							<th class="hidden-xs"  width="50px">ID</th>
							<th class="hidden-xs" width="100px">名称</th>
							<th class="hidden-xs" width="100px">图片 </th>
							<th class="hidden-xs" width="100px">详细地址</th>
							<th class="hidden-xs" width="400px">描述</th>
							<th class="hidden-xs"  width="100px">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${scenic }" var="scenic" varStatus="status">
							<tr id='node-1' class="parent collapsed">
								<td class="hidden-xs">${status.index+1 }</td>
								<td class="hidden-xs">${scenic.sce_name }</td>
								<td class="hidden-xs"><img alt="图片未找到" src="/zxmszssys/${scenic.img_url }" height="100px" width="100%"> </td>
								<td class="hidden-xs">${scenic.address }</td>
								<td class="hidden-xs">${scenic.description }</td>
								<td>
									<div class="layui-inline">
										<button title="编辑" class="layui-btn layui-btn-mini layui-btn-normal  edit-btn" data-id="1" data-url="menu-add.jsp" onclick="updateCar('${scenic.sce_id}')"><i class="layui-icon">&#xe642;</i></button>
										<button title="删除" class="layui-btn layui-btn-mini layui-btn-danger del-btn" data-id="1" data-url="menu-add.jsp" onclick="deleteCar('${scenic.sce_id}')"><i class="layui-icon">&#xe640;</i></button>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<script src="static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script src="static/admin/js/common.js" type="text/javascript" charset="utf-8"></script>
		<script src="static/admin/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
		<!--[if (gte IE 9)|!(IE)]><!-->
	</body>
	<script type="text/javascript">

		function searchCar() {
			var vname = document.getElementById("vname").value;
			window.location.href = "ScenicServlet?method=searchScenic&sceName=" + vname;
		}

		function updateCar(vid) {
			window.location.href = "ScenicServlet?method=updateScenic&sceId=" + vid;
		}

		function deleteCar(vid) {
			if(confirm("确认删除？")) {
				window.location.href = "ScenicServlet?method=deleteScenic&sceId=" + vid;
			} else {

			}
		}
		
	</script>

</html>