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
<script src="js/jquery.SuperSlide.js" type="text/javascript"></script>
<script src="js/NSW_Index.js"></script>
<link rel="stylesheet" type="text/css" href="static/admin/layui/css/layui.css" />
<link rel="stylesheet" type="text/css" href="static/admin/css/admin.css" />
</head>
<!--/head-->

<body>
	<header id="header">
		<nav class="navbar navbar-inverse" role="banner">
			<div class="container">
				<div class="row">
					<div class="col-md-3 navbar-header">
						<a href="ScenicServlet?method=scenicCllentList"><img
							src="images/logo.png" style="height: 50px;" alt="logo"
							class="img-responsive"></a>
					</div>
					<div class="col-md-9">
						<div class="collapse navbar-collapse navbar-right">
							<ul class="nav navbar-nav">
								<li class="active"><a href="ScenicServlet?method=scenicCllentList">景区/美食</a>
								</li>
								<li><a href="personal.jsp">个人资料</a></li>
								<li><a href="javascript:exit();">退出</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</nav>
	</header>

	<!--banner-->
	<div class="clearfix"></div>
		<div id="box">
			<input type="text" id="tutName" name="search" placeholder="请输入关键字">
			<input type="hidden" id="sceId"  value="${food[0].sce_id }">
			<div id="search" onclick="search()">搜索</div>
		</div>
	<section class="container">
		<div>
			<a href="ScenicServlet?method=scenicCllentList"><img src="images/left.png" /></a>
		</div>
		<div class="head">
			附近美食<span>Current classification</span>
		</div>
		<div class="row">
		<c:if test="${empty  food }">
		<p><strong style="color:#DD001B">对不起，暂时还没有数据.....</strong>  </p>
		</c:if>
			<c:forEach items="${food}" var="food">
				<div style="width: 372px; float: left; padding: 15px; margin-bottom: 30px;">
					<div class="staff_detail">
						<img
							src="/zxmszssys/${food.img_url }"
							style="center: center; width: 308px; height: 200px;">
						<p>
							<span >美食名称：<strong style="color:#252625;">${food.foo_name }</strong></span>
						</p>
						<p>
						收藏人数：<strong style="color:#FDDF11;">${food.num }</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<c:choose>
						<c:when test="${food.count eq 0 }">|&nbsp;&nbsp;&nbsp;&nbsp;收藏：
						<button onclick="addcollect('${food.foo_id }')"><i title="点击收藏" class="layui-icon" style="font-size: 20px; color: #1E9FFF;">&#xe600;</i></button>
						</c:when>
						<c:when test="${food.count eq 1 }">|&nbsp;&nbsp;&nbsp;&nbsp;收藏：
						<button onclick="updatecollect('${food.foo_id }')"><i title="取消收藏" class="layui-icon" style="font-size: 20px; color: #FD7169;">&#xe600;</i></button>
						</c:when>
						 </c:choose>
						<br>
						</p>
						<p>
						<span >详细地址：${food.address }</span>
						</p>
						<p>
							<a href="javascript:detail('${food.foo_id }');">查看详情</a>
						</p>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="clearfix"></div>
		<div class="clearfix"></div>
	</section>
	<!--footer-->
	<footer id="footer">
		<div class="container">
			<span>
			<a href="ScenicServlet?method=scenicCllentList">景区/美食</a>
			<a href="personal.jsp">个人资料</a>
			</span>
			<span> 
			</span>
		</div>
	</footer>

</body>
<script src="static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script src="static/admin/js/common.js" type="text/javascript" charset="utf-8"></script>
		<script src="static/admin/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery-1.11.3.min.js"></script>
<!--<![endif]-->
<script src="js/amazeui.min.js"></script>
<script type="text/javascript" src="js/plugs.js"></script>
<script type="text/javascript">
	function search() { //查询
		var tutName=document.getElementById("tutName").value;
		var sceId=document.getElementById("sceId").value;
		window.location.href = "FoodServlet?method=foodCllentSearch&fooName="+tutName+"&sceId="+sceId;
	}
	
	function detail(foo_id) {
		layer.open({
			type: 2,
			area: ['800px', '600px'],
			content: 'FoodServlet?method=detailFood&fooId='+foo_id //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
		});
	}
	
	function updatecollect(foo_id) {
		layer.confirm('确认取消收藏？', function(index) {
			$.ajax({
				type: "get",
				url: "CollectServlet",
				data: {"method":"deleteFoo",
					"fooId":foo_id	
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
	function addcollect(foo_id) {
		$.ajax({
			type: "get",
			url: "CollectServlet",
			data: {"method":"addFoo",
				"fooId":foo_id	
			},
			async: false,
			success: function(data) {
				if(data == "1") {
					layer.msg('已收藏!', {
						icon: 1,
						time: 1000
					});
					setTimeout(function() {
						window.location.reload(); //刷新页面
					}, 400);
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
	function exit() {
		if (confirm("确认退出？")) {
			window.location.href = "IndexFrontServlet?method=exit";
		}
	}
</script>

<style type="text/css">
#box {
	width: 380px;
	margin: 30px auto;
	font-family: 'Microsoft YaHei';
	font-size: 14px;
}

input {
	width: 300px;
	border: 1px solid #e2e2e2;
	height: 50px;
	float: left;
	border-radius: 10px;
	background-image: url(images/search.jpg);
	background-repeat: no-repeat;
	background-size: 25px;
	background-position: 5px center;
	padding: 0 0 0 40px;
}

#search {
	width: 78px;
	height: 50px;
	float: right;
	background: #0089E1;
	border-radius: 10px;
	color: white;
	text-align: center;
	line-height: 50px;
	cursor: pointer;
}
</style>
</html>