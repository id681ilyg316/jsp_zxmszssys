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
<title>个人管理</title>

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
</head>
<!--/head-->

<body onload="aswitch()">
	<header id="header">
			<nav class="navbar navbar-inverse" role="banner">
			<div class="container">
				<div class="row">
					<div class="col-md-3 navbar-header">
						<a  href="ScenicServlet?method=scenicCllentList"><img
							src="images/logo.png" style="height:50px;" alt="logo" class="img-responsive"></a>
					</div>
					<div class="col-md-9">
						<div class="collapse navbar-collapse navbar-right">
							<ul class="nav navbar-nav">
								<li><a href="ScenicServlet?method=scenicCllentList">景区/美食</a>
								</li>
								<li  class="active"><a href="personal.jsp">个人资料</a></li>
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
	<section class="container">

		<div class="clearfix"></div>
		<div class="team_xq1">

			<div class="team_xq1_left">
				<ul>
					<li style="float: right; margin-right: 28%; margin-top: 5%;">
						<span style="font-size: 16px;">欢迎光临:</span><br> <span
						style="color: #0089E1; font-size: 18px;">${cname }</span>
					</li>
					<li><a id="c" target="iframe"
								href="InforTwo?method=queryInfor" style="color: #8be0ff;">我的信息</a></li>
							<li><a id="b" href="CollectServlet?method=collectSec" target="iframe" style="color: #8be0ff;">我的收藏</a></li>
				</ul>
			</div>
			<div class="team_xq1_right">

				<div class="team_xq1_right_a">
					<hr>
				</div>
				<div class="team_xq1_right_auto">
					<iframe src="InforTwo?method=queryInfor" width="100%" height="100%"
						name="iframe" scrolling="auto" class="iframe" framborder="0"></iframe>
				</div>

			</div>

		</div>
</body>
<!--上方所需css样式div:team_xq1_left&&right-->
<style type="text/css">
/** 团队详情 **/
.team_xq1 {
	background-color: #2CBEED;
	padding-bottom: 70px;
	width: 100%;
	float: left;
	padding: 20px;
	border-radius: 20px;
}

.team_xq_left {
	float: left;
	width: 200px;
	height: 300px;
	background: #FFFFFF;
	border-radius: 20px;
}

.team_xq_right {
	float: right;
	width: 850px;
	height: 1000px;
	background: #FFFFFF;
	border-radius: 20px;
}

.info-top {
	padding-bottom: 34px;
}

.newP {
	width: 100%;
	float: left;
	line-height: 20px;
}

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

<script src="js/jquery-1.11.3.min.js"></script>
<!--<![endif]-->
<script src="js/amazeui.min.js"></script>
<script src="js/app.js"></script>
<script type="text/javascript" src="js/plugs.js"></script>
<!--上方所需javascript样式div:team_xq1_left-->
<script type="text/javascript">
	function exit() {
		if (confirm("确认退出？")) {
			window.location.href = "IndexFrontServlet?method=exit";
		}
	}
	function aswitch() { //切换已完成颜色
		var status = document.getElementById("status").value;
		var a = document.getElementsByClassName("active");
		if (status == 0) {
			a[1].style.color = "#8be0ff";
			a[2].style.color = "#000000";
		} else {
			a[1].style.color = "#000000";
			a[2].style.color = "#8be0ff";
		}

	}

	function selectpno() { //查询订单
		var pno = document.getElementById("pno").value;
		window.location.href = "InforOne?method=selectpno&order_no=" + pno;
	}
</script>

<div class="clearfix"></div>
 
<!-- 安全 Start -->
<!--	<section class="service-v1">
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-md-4 col-lg-4">
					<div class="item">
						<div class="icon">
							<i class="iconfont">&#xe620;</i>
						</div>
						<div class="text">
							<div class="inner">
								<h3>正规平台，值得信赖</h3>
								<p>工商注册备案，安全可靠！</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-4 col-md-4 col-lg-4">
					<div class="item">
						<div class="icon">
							<i class="iconfont">&#xe633;</i>
						</div>
						<div class="text">
							<div class="inner">
								<h3>安全保障，信息真实</h3>
								<p>所有课程均有配套资源</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-4 col-md-4 col-lg-4">
					<div class="item">
						<div class="icon">
							<i class="iconfont">&#xe614;</i>
						</div>
						<div class="text">
							<div class="inner">
								<h3>你想要的，我都有</h3>
								<p>专注韩语教育，你在哪，我们的服务就在哪里</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	-->
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

</html>