<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<script src="js/jquery.SuperSlide.js" type="text/javascript"></script>
		<script src="js/NSW_Index.js"></script>

	</head>
	<!--/head-->

	<body>
		<!--banner-->
		<div class="clearfix"></div>
		<section class="container">
			<div>
			<!-- <a href="javascript:history.back();"><img src="images/left.png" /></a> -->
		</div>
			<!--<div class="c_title"><font>新闻资讯</font> <span>当前位置：<a href="index.jsp">首页</a>&gt;新闻资讯</span></div>-->
			<div class="news_title">
				<h2>${food.foo_name }</h2>
			</div>
			<div class="content">
				<center><img src="/zxmszssys/${food.img_url}"></center>
				<p>${food.description }　</p>
			</div>
		</section>
		<div class="clearfix"></div>
		<!-- 安全 Start -->
	</body>
<script type="text/javascript">
function exit() {
	if(confirm("确认退出？")) {
		window.location.href = "IndexFrontServlet?method=exit";
	}
}

</script>
</html>