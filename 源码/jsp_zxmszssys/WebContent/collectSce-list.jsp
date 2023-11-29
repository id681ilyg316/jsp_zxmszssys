<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>赏天下查询平台</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/page.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<link href="iconfont/iconfont.css" rel="stylesheet" />

<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.js"></script>
<script src="js/NSW_Index.js"></script>
<link rel="stylesheet" type="text/css"
	href="static/admin/layui/css/layui.css" />
<link rel="stylesheet" type="text/css" href="static/admin/css/admin.css" />
<script src="static/admin/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="static/admin/layui/css/layui.css" />
<link rel="stylesheet" type="text/css" href="static/admin/css/admin.css" />
<script src="static/admin/layui/layui.js" type="text/javascript"
	charset="utf-8"></script>
</head>
<!--/head-->

<body>
	<a href="CollectServlet?method=collectSec" target="iframe" class="active"
		style="color: #8be0ff;">景点收藏</a>|
	<a href="CollectServlet?method=collectFoo" target="iframe" class="active"
		style="color: #8be0ff;">美食收藏</a>
		<hr>
	<table class="layui-table" lay-skin="line">
		<colgroup>
			<col class="hidden-xs">
			<col class="hidden-xs">
			<col class="hidden-xs">
			<col class="hidden-xs" width="200px">
			<col class="hidden-xs">
			<col class="hidden-xs">
		</colgroup>
		<thead>
			<tr>
				<th class="hidden-xs">ID</th>
				<th class="hidden-xs">景点名称</th>
				<th class="hidden-xs">详细地址</th>
				<th class="hidden-xs">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${collect }" var="collect" varStatus="status">
				<tr id='node-1' class="parent collapsed">
					<td class="hidden-xs">${status.index+1 }</td>
					<td class="hidden-xs">${collect.sce_name }</td>
					<td class="hidden-xs">${collect.address }</td>
					<td>
						<div class="layui-inline">
							<button onclick="detail('${collect.sce_id }')"
								class="layui-btn layui-btn-mini layui-btn-normal" data-id="1">
								<i class="layui-icon">查看详情</i>
							</button>
							<button onclick="updatecollect('${collect.sce_id }')"
								class="layui-btn layui-btn-mini layui-btn-danger" data-id="1">
								<i class="layui-icon">取消收藏</i>
							</button>
						</div>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
<script src="static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script src="static/admin/js/common.js" type="text/javascript" charset="utf-8"></script>
		<script src="static/admin/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery-1.11.3.min.js"></script>
<!--<![endif]-->
<script src="js/amazeui.min.js"></script>
<script type="text/javascript" src="js/plugs.js"></script>

<!--上方所需javascript样式div:team_xq1_left-->
<script type="text/javascript">

function detail(foo_id) {
console.log(foo_id);
	layer.open({
		type: 2,
		area: ['800px', '600px'],
		content: 'ScenicServlet?method=detailScenic&sceId='+foo_id //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
	});
}

function updatecollect(foo_id) {
	layer.confirm('确认取消收藏？', function(index) {
		$.ajax({
			type: "get",
			url: "CollectServlet",
			data: {"method":"deleteSce",
				"sceId":foo_id	
			},
			async: false,
			success: function(data) {
				console.log(data);
				if(data == "1") {
						window.location.reload(); //刷新页面
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
	});
}
</script>
<style type="text/css">
.team_xq1_left a {
	width: 200px;
	float: left;
	color: #000;
	font-size: 18px;
	padding-top: 8%;
	letter-spacing: 3px;
	text-align: center;
}

.team_xq1_left a:hover {
	color: #8be0ff;
	!
	important;
}

.team_xq1_right_top {
	width: 300px;
	height: 30px;
	font-size: 15px;
	margin: auto;
}

.team_xq1_right_auto {
	width: 800px;
	height: 90%;
	margin: auto;
	margin-top: 1%;
}

.team_xq1_right_a {
	width: 300px;
	height: 30px;
	margin-left: 3%;
	font-size: 16px;
}

.team_xq1_right_auto_1 {
	width: 800px;
	height: 65px;
	background: rgba(240, 238, 247, 0.5);
	margin-bottom: 1%;
	color: #3B3F4A;
	float: left;
}

.team_xq1_right_auto_1:hover {
	background: rgba(255, 204, 174, 0.6);
}

.team_xq1_right_auto_1 li {
	float: left;
	font-size: 16px;
	margin-top: 2.5%;
	margin-left: 2%;
}

.text1 {
	width: 115px;
	border: none;
	background: transparent;
	color: #3B3F4A;
}

.text2 {
	width: 68px;
	border: none;
	background: transparent;
	color: #3B3F4A;
}

.submit1 {
	float: right;
	border: none;
	width: 72px;
	height: 28px;
	background-color: #FFCC33;
	font-size: 15px;
	color: #FFFFFF;
	border-radius: 25px;
}
</style>
</html>