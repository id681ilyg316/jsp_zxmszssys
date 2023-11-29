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
<script type="text/javascript" src="js/ajaxfileupload.js"></script>
<script src="js/NSW_Index.js"></script>
</head>
<!--/head-->

<body>

	<div class="team_xq_right">

		<div class="team_xq_right_auto" style="display: block;">
			<!--个人信息form表单-->
			<div id="result"></div>
			<form style="width: 90%; height: 60%; center: center;" method="post"
				action="InforTwo" id="infor1" enctype="multipart/form-data">
				<input type="hidden" name="method" value="updateInfor1">
				<ul>
					<li>尊敬的用户：<span style="color: #0089E1; font-size: 18px;">${cllent.ctel }</span>
							您好！

							<hr />
							<li><label class="layui-form-label">姓名：</label><input
								type="text" name="cname" class="infor" value="${cllent.cname}"
								onchange="upinfor1()" 
								disabled="disabled"></li>
							<li><label class="layui-form-label">性别:</label> <select
								class="infor" name="csex"
								disabled="disabled" onchange="upinfor2()">
									<option value="${cllent.csex}">${cllent.csex}</option>
									<option value="男">男</option>
									<option value="女">女</option>
							</select></li>
							<li><label class="layui-form-label">标识码：</label><input
								type="text" name="idCode" class="infor" value="${cllent.id_code}"
								 disabled="disabled"></li>
							<li><input type="button" class="button1" value="修改信息"
								onclick="bushow()" style="float: left; display: block;">
								<input type="submit" class="button1" onclick="update()"
								value="保存信息" onclick="update()"
								style="float: left; display: none;"> 
								<input
								type="button" class="button1" value="修改密码" onclick="buswinch()"
								style="float: right; margin-right: 40%; display: block;">
								<input type="button" class="button1" value="取消修改"
								onclick="buhideen()"
								style="float: right; margin-right: 40%; display: none;"></li>
				</ul>

			</form>

		</div>

		<div class="team_xq_right_auto" style="display: none;">
			<form method="get" style="width: 90%; center: center;" id="infor2">
			<input type="hidden" name="method" value="updatePwd" >
				<ul id="leaverss">
					<li>尊敬的用户：<span style="color: #0089E1; font-size: 18px;">${ctel }</span>您好！
					<hr />
					<li>原密码:&nbsp;&nbsp;&nbsp;<input name="pwd" type="password"
						class="infor1" onchange="contrast1()">&nbsp;<span
						class="span1"></span></li>
					<li>新密码:&nbsp;&nbsp;&nbsp;<input name="Cpwd" type="password"
						class="infor1" onchange="contrast2()">&nbsp;<span
						class="span1"></span></li>
					<li>确认密码:<input type="password" class="infor1"
						onchange="contrast3()">&nbsp;<span class="span1"></span></li>
					<li><input type="button" class="button1" value="确认修改"
						onclick="pupdate()" style="float: left;"> <input
						type="button" class="button1" value="取消修改" onclick="cswinch()"
						style="float: right; margin-right: 40%;"></li>
				</ul>
			</form>

		</div>

	</div>

</body>

<!--上方所需javascript样式div:team_xq_left-->
<script type="text/javascript">
	function exit() {
		if (confirm("确认退出？")) {
			window.location.href = "IndexFrontServlet?method=exit";
		}
	}

	function pupdate() { //确认修改密码事件
		var span1 = document.getElementsByClassName("span1");
		var infor1 = document.getElementsByClassName("infor1");
		if (confirm("确定修改吗?")) {
			if (ble1 && ble2) {
				$
						.ajax({
							type : "GET",
							url : "InforTwo",
							data : $("#infor2").serialize(),
							success : function(result) {

								if (result != '') {
									span1[0].innerText = '*' + result;
									infor1[0].focus();
								} else {
									confirm("修改成功!");
									window.location.href = "InforTwo?method=queryInfor";
								}
							}
						});
			} else {
				confirm("请按照提示操作!");
			}
			/* window.location.href = "InforTwo?method=updateInfor&Cname="+cname+"&Csex="+csex+"&Ctel="+ctel+"&Address="+address; */
		}
	}
	
	var a = document.getElementById("a");
	var b = document.getElementById("b");
	var c = document.getElementById("c");

	function teama() {
		a.style.color = '#8be0ff';
		c.style.color = '#000000';
		b.style.color = '#000000';
	}

	function teamb() {
		a.style.color = '#000000';
		b.style.color = '#8be0ff';
		c.style.color = '#000000';
	}

	function teamc() {
		a.style.color = '#000000';
		b.style.color = '#000000';
		c.style.color = '#8be0ff';
	}

	//点击修改
	var infor = document.getElementsByClassName("infor"); //获取所有from表单文本框和多选框信息信息
	var button1 = document.getElementsByClassName("button1") //获取所有按钮信息
	var team = document.getElementsByClassName("team_xq_right_auto");

	function bushow() {
		for (var i = 0; i < infor.length; i++) {
			infor[i].disabled = false; //将文本框和多选框切换为可修改状态
			infor[i].style.border = 'solid 1px #dededc';
		}
		button1[0].style.display = 'none';
		button1[1].style.display = 'block';
		button1[2].style.display = 'none';
		button1[3].style.display = 'block'; //切换各个按钮

	}

	function buhideen() {
		button1[0].style.display = 'block';
		button1[1].style.display = 'none';
		button1[2].style.display = 'block';
		button1[3].style.display = 'none';
		for (var i = 0; i < infor.length; i++) {
			infor[i].disabled = true;
			infor[i].style.border = 'none';
		}
		window.location.href = "InforTwo?method=queryInfor";
	}

	function buswinch() {
		team[0].style.display = 'none';
		team[1].style.display = 'block';
	}

	function cswinch() {
		team[0].style.display = 'block';
		team[1].style.display = 'none';
		window.location.href = "InforTwo?method=queryInfor";
	}

	//修改信息判断格式
	var blup = false;

	function upinfor1() {
		var regMobile = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
		var infor = document.getElementsByClassName("infor");

		if (infor[0].value == "") {
			infor[0].style.boxShadow = '0 0 15px #E2A000';
			infor[0].focus();
			blup = false;
		} else if (infor1[0].value) {
			infor[0].style.boxShadow = '';
			blup = true;
		} else if (!(regMobile.test(infor[2].value))) {
			infor[2].style.boxShadow = '0 0 15px #E2A000';
			infor[2].focus();
			blup = false;
		}
	}

	function upinfor2() {
		blup = true;
	}

	function upinfor3() {
		var regMobile = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
		var infor = document.getElementsByClassName("infor");

		if (infor[0].value == "") {
			infor[0].style.boxShadow = '0 0 15px #E2A000';
			infor[0].focus();
			blup = false;
		} else if (!(regMobile.test(infor[2].value))) {
			infor[2].style.boxShadow = '0 0 15px #E2A000';
			infor[2].focus();
			blup = false;
		} else if (regMobile.test(infor[2].value)) {
			infor[2].style.boxShadow = '';
			blup = true;
		} else if (infor[3].value == "") {

			infor[3].style.boxShadow = '0 0 15px #E2A000';
			infor[3].focus();
			blup = false;
		} else if (infor[0].value) {
			infor[0].style.boxShadow = '';
			blup = true;
		}
	}

	function upinfor4() {
		var regMobile = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
		var infor = document.getElementsByClassName("infor");

		if (infor[0].value == "") {
			infor[0].style.boxShadow = '0 0 15px #E2A000';
			infor[0].focus();
			blup = false;
		} else if (!(regMobile.test(infor[2].value))) {
			infor[2].style.boxShadow = '0 0 15px #E2A000';
			infor[2].focus();
			blup = false;
		} else if (infor[3].value == "") {
			infor[3].style.boxShadow = '0 0 15px #E2A000';
			infor[3].focus();
			blup = false;
		} else if (infor[3].value) {
			infor[3].style.boxShadow = '';
			blup = true;
		}
	}

	function update() { //确认修改信息事件
		alert("成功");
	}

	var ble1 = false; //修改密码开关判断
	var ble2 = false; //修改密码开关判断

	function contrast1() {
		var infor1 = document.getElementsByClassName("infor1");
		var span1 = document.getElementsByClassName("span1");

		if (infor1[0].value == "") {

			infor1[0].style.boxShadow = '0 0 15px #E2A000';
			infor1[0].focus();
			span1[0].innerText = "*请输入原密码";
			ble1 = false;
		} else if (infor1[0].value) {
			infor1[0].style.border = 'solid 1px #dededc';
			infor1[0].style.boxShadow = '';
			span1[0].innerText = "";
			ble1 = true;
		} else if (infor1[1].value) {
			infor1[1].style.border = 'solid 1px #dededc';
			span1[1].innerText = "";
			ble1 = true;
		}

	}

	function contrast2() {
		var infor1 = document.getElementsByClassName("infor1");
		var span1 = document.getElementsByClassName("span1");
		if (infor1[0].value == "") {
			infor1[0].style.boxShadow = '0 0 15px #E2A000';
			infor1[0].focus();
			span1[0].innerText = "*请输入原密码";
			ble2 = false;
		} else if (infor1[1].value != infor1[2].value) {

			infor1[2].style.boxShadow = '0 0 15px #E2A000';
			infor1[2].focus();
			span1[2].innerText = "*两次密码不一致";
			ble2 = false;
		} else if (infor1[1].value == "") {

			infor1[1].style.boxShadow = '0 0 15px #E2A000';
			infor1[1].focus();
			span1[1].innerText = "*请输入新密码";
			ble2 = false;
		} else if (infor1[2].value == "") {

			infor1[2].style.boxShadow = '0 0 15px #E2A000';
			span1[2].innerText = "请确认密码";
			ble1 = false;
		} else if (infor1[0].value) {

			infor1[0].style.border = 'solid 1px #dededc';
			infor1[0].style.boxShadow = '';
			span1[0].innerText = "";
			ble1 = true;
		}

	}

	function contrast3() {
		var infor1 = document.getElementsByClassName("infor1");
		var span1 = document.getElementsByClassName("span1");

		if (infor1[0].value == "") {
			infor1[0].style.boxShadow = '0 0 15px #E2A000';
			infor1[0].focus();
			span1[0].innerText = "*请输入原密码";
			ble2 = false;
		} else if (infor1[1].value != infor1[2].value) {

			infor1[1].style.boxShadow = '';
			span1[1].innerText = "";

			infor1[2].style.boxShadow = '0 0 15px #E2A000';
			infor1[2].focus();
			span1[2].innerText = "*两次密码不一致";
			ble2 = false;
		} else if (infor1[1].value == infor1[2].value) {

			infor1[1].style.border = 'solid 1px #dededc';
			infor1[2].style.border = 'solid 1px #dededc';

			infor1[1].style.boxShadow = '';
			infor1[2].style.boxShadow = '';

			span1[1].innerText = "";
			span1[2].innerText = "";
			ble2 = true;
		}

	}

	/*document.form1.pwd1.focus(); //焦点放到密码框*///#d84c29";
	/*<form  method="get" action="InforTwo">
	 <ul>
	 <li><img src="images/bmys_bm_b06993d.png" style="margin-left: 38%;"></li><hr />
	 <li>原密码:&nbsp;&nbsp;&nbsp;<input type="password" class="infor1"  value=""></li>
	 <li>新密码:&nbsp;&nbsp;&nbsp;<input type="password" class="infor1"  value="" onchange="contrast()"></li>
	 <li>确认密码:<input type="password" class="infor1"  value=""></li>
	 <li><input type="button" class="button1" value="确认修改"  style="float: left;">
	 <input type="button" class="button1" value="取消修改"  onclick="cswinch()" style="float: right;margin-right: 40%;">
	 </li>
	 </ul>
	 </form>	*/
</script>
<!--上方所需css样式div:team_xq_left&&right-->
<style type="text/css">
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

.team_xq_left a {
	width: 200px;
	float: left;
	color: #000;
	font-size: 18px;
	padding-top: 8%;
	letter-spacing: 3px;
	text-align: center;
}

.team_xq_left a:hover {
	color: #8be0ff;
	!
	important;
}

.leaverss ul {
	display: block;
	list-style-type: none;
	margin: 5px;
}

.team_xq_right_auto {
	width: 750px;
	height: 90%;
	border-radius: 20px;
	margin: auto;
}

.team_xq_right_auto form {
	width: 420px;
	height: 500px;
	font-size: 18px;
	border: none;
	margin: auto;
}

.span1 {
	color: #E50012;
	font-size: 16px;
}

.infor {
	width: 250px;
	height: 35px;
	margin-top: 10%;
	border: none;
	background-color: #fffde7;
	!
	important;
}

.infor1 {
	width: 215px;
	height: 35px;
	margin-top: 10%;
	border: solid 1px #dededc;
	background-color: #fffde7;
	!
	important;
}
/*.button1 {
	margin-top: 10%;
	border: none;
	width: 65px;
	height: 25px;
	background-color: #dddddd;
	font-size: 16px;
}*/
.button1 {
	margin-top: 10%;
	border: none;
	width: 65px;
	/* 宽度 */
	height: 25px;
	/* 高度 */
	border-width: 0px;
	/* 边框宽度 */
	border-radius: 5px;
	/* 边框半径 */
	background: #FFCC33;
	/* 背景颜色 */
	cursor: pointer;
	/* 鼠标移入按钮范围时出现手势 */
	outline: none;
	/* 不显示轮廓线 */
	font-family: Microsoft YaHei;
	/* 设置字体 */
	color: white;
	/* 字体颜色 */
	font-size: 12px;
	/* 字体大小 */
}

.button1:hover {
	/* 鼠标移入按钮范围时改变颜色 */
	background: #5599FF;
}
</style>

</html>