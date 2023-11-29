<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>首页</title>

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

</head><!--/head-->

<body onload="cursor()">
<header id="header">
	<nav class="navbar navbar-inverse" role="banner">
		<div class="container">
        	<div class="row">
			<div class="col-md-3 navbar-header">
				<img src="images/logo.png" style="height:50px;" alt="logo" class="img-responsive">
			</div>
            <div class="col-md-9">
			<div class="collapse navbar-collapse navbar-right">
				<ul class="nav navbar-nav">
					<li class="active"><a href="indexfront.jsp">首页</a></li>
                    <li><a target="_blank" href="/zxmszssys/login.jsp">管理员登录</a></li>
				</ul>
			</div>
            <div class="clearfix"></div>
            </div>
            </div>
		</div>
	</nav>
</header>
    
    
<!--banner-->
<section id="main-slider" class="no-margin">
    <!-- banner轮播 -->
<div class="fullSlide">
<div class="bd">
    <ul>
        <li style=" background:url(images/backgroud/bg3.png) top center no-repeat;  background-size:cover;"></li>
        <li style=" background:url(images/backgroud/bg1.jpg) top center no-repeat;  background-size:cover;"></li>
        <li style=" background:url(images/backgroud/bg2.jpg) top center no-repeat;  background-size:cover;"></li>
    </ul>
</div>
<div class="hd">
    <ul class="container">
        <li class="">1</li>
        <li class="on">2</li>
        <li class="">3</li>
    </ul>
</div>
<span class="prev" style="opacity: 0.5; display: inline;"></span>
<span class="next" style="opacity: 0.5; display: inline;"></span>
</div>

    <!--登录页面 -->
    <div class="container Online_wp" id="login" style="display: block;">
 
	<div class="row">
		<div class="Online">
			<h3>登录</h3>
			<form method="get" id="indexfor1" action="">
			
				<ul>
                    <li><span>您的账号</span><i><input class="m-btn" autocomplete="off" placeholder="手机号" type="text" name="ctel" onchange="contrast1()"></i>
                    	<input type="text" name="method" value="login" hidden="hidden">
                    </li>
                    <li><span>您的密码</span><i><input class="m-btn" placeholder="密码" type="password" name="password" onchange="contrast2()"></i></li>
                   <li><span>验证码</span><i><input class="m-btn" name="checkcode" placeholder="验证码" type="text"  style="width:105px;" onchange="contrast3()" > 
					<a href="javascript:reloadCode()"><img alt="验证码" id="imagecode" src="ImageServlet"></a></i></li>
                    <li><i><input class="m-submit" type="button" onclick="logindex()" value="点击登录" style="margin-left: 70px;"></i></li>
                    <li><a href="javascript:void(0);" onclick="sw()" style="float:left;margin-left: 25px;">没有账号？立即注册</a><a href="javascript:void(0);" onclick="sf()" style="float: right;">忘记密码?</a></li>
				</ul>
			</form>
		</div>
	</div>
</div>



<!--注册页面 -->
<div class="container Online_wp" id="registe" style="display: none;">
	<div class="row">
		<div class="Online">
			<h3>注册</h3>
			
			<form method="get" id="indexfor2" action="">
				<ul>
                    <li>
                    	<span>您的手机号</span><i><input id="indexinfo1" class="m-btn" autocomplete="off" name="ctel"  placeholder="手机号" type="text" ></i>
                    	<input type="text" name="method" value="registe" hidden="hidden">
                    </li>
                    <li><span>您的密码</span><i><input id="indexinfo2" class="m-btn" name="password" placeholder="密码" type="password"></i></li>
                    <li><span>重复密码</span><i><input id="indexinfo3" class="m-btn" name="password1" placeholder="密码" type="password"></i></li>
                    <li><span>&nbsp;&nbsp;&nbsp;&nbsp;</span><i><input class="m-submit" type="button" value="点击注册" onclick="register()"></i></li>
                    <li><a href="javascript:void(0);" onclick="sr()">返回登录</a></li>
				</ul>
			</form>
		</div>
	</div>
</div>

<!--忘记密码页面 -->
<div class="container Online_wp" id="forget" style="display: none;">
	<div class="row">
		<div class="Online">
			<h3>找回密码</h3>
			<form id="indexfor3" action="">
				<ul>
                    <li>
                    	<input type="text" name="method" value="recover" hidden="hidden">
                    	<span>您的手机号</span><i><input class="m-btn" autocomplete="off" id="recover1" name="ctel" placeholder="手机号" type="text"></i>
                    </li>
                    <li><span>身份识别码</span><i><input class="m-btn"name="idCode" id="recover2" placeholder="请输入标识码" type="password" ></i></li>
                    <li><span>新密码</span><i><input class="m-btn"name="password" id="recover3"  placeholder="请输入新密码" type="password" ></i></li>
                    <li><span>&nbsp;&nbsp;&nbsp;&nbsp;</span><i><input class="m-submit" type="button" value="确认重置" onclick="forgetpwd()"></i></li>
                    
                    <li><a href="javascript:void(0);" onclick="sr()">返回登录</a></li>
				</ul>
			</form>
		</div>
	</div>
</div>

<div class="clearfix"></div>
</section><!--/#main-slider-->

<!--footer-->
	<footer id="footer">
		<div class="container">
			<span><a href="index.jsp">首页</a><a href="AboutServlet?method=about">新闻导读
			</a> <span> 
			</span>
		</div>
	</footer>
<script type="text/javascript" src="js/plugs.js"></script>
<!--短信验证码点击限制-->
<script type="text/javascript">


//页面加载时光标位置放置于手机号框

function cursor(){
	var mbtn = document.getElementsByClassName("m-btn");
	mbtn[0].focus();
}
  //注册
    function register(){
    	  var  mbtn1 = document.getElementById("indexinfo1").value;
    	  var  mbtn2 = document.getElementById("indexinfo2").value;
    	  var  mbtn3 = document.getElementById("indexinfo3").value;
    	  var regMobile = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
    	  console.log(mbtn1);
    	  if(!(regMobile.test(mbtn1))){
    		  alert("请输入正确的手机号码！");
      	  }else if(mbtn2 == null||mbtn3==null||mbtn2==""||mbtn3==""){
      		alert("请检查输入格式!");
      	  }else if(mbtn2 !=mbtn3){
      		  alert("两次密码不相同！");
      	  }else{
      		$.ajax({
				type: "GET",
				url: "IndexFrontServlet",
				data: $("#indexfor2").serialize(),
				dataType:"json",
				success: function(result) {
					if(result=="1"){
						alert("账号已存在！");
					}else if(result=="2"){
						alert("注册成功,请前往登录");
						window.location.href="indexfront.jsp";
					}
				}
			});
      	  }
	}
    
  
  //忘记密码
    function forgetpwd(){
    	var  mbtn1 = document.getElementById("recover1").value;
   	  	var  mbtn2 = document.getElementById("recover2").value;
   	  	var  mbtn3 = document.getElementById("recover3").value;
   	  var regMobile = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
	  
	  if(!(regMobile.test(mbtn1))){
		  alert("请输入正确的手机号码！");
  	  }else if(mbtn2 == null||mbtn3==null||mbtn2==""||mbtn3==""){
  		alert("不能为空");
  	  }else{
				$.ajax({
				type: "GET",
				url: "IndexFrontServlet",
				data: $("#indexfor3").serialize(),
				dataType:"json",
				success: function(result) {
					if(result=="0"){
						alert("账号不存在！");
					}else if(result=="1"){
						alert("身份识别码错误");
					}else{
						alert("成功，点击登录！");
						window.location.href="indexfront.jsp";
					}
					
				}
			});
		}
	}
    
   //验证码
function reloadCode(){
	var time=new Date().getTime();	
	document.getElementById("imagecode").src="ImageServlet?d="+time;
}
   
//登录验证
var ble = false;//点击登录开关判断
function contrast1(){
	var mbtn = document.getElementsByClassName("m-btn");
 var regMobile = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
 	if(!(regMobile.test(mbtn[0].value))){
 		mbtn[0].style.boxShadow='0 0 15px #E2A000';
 		mbtn[0].focus();
 		ble = false;
 	}else if(regMobile.test(mbtn[0].value)){
			mbtn[0].style.boxShadow='';
			ble = true;
			if(mbtn[1].value == ""){
				mbtn[1].style.boxShadow='0 0 15px #E2A000';
				ble = false;
			}
		}else if(mbtn[1].value){
			mbtn[1].style.boxShadow='';
			ble = true;
			
		}
}

 function contrast2(){
	var mbtn = document.getElementsByClassName("m-btn");
 	var regMobile = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
 	if(!(regMobile.test(mbtn[0].value))){
 		mbtn[0].style.boxShadow='0 0 15px #E2A000';
 		mbtn[0].focus();
 		ble = false;
 	}else if(mbtn[1].value==""){
			mbtn[1].style.boxShadow='0 0 15px #E2A000';
			mbtn[1].focus();
			ble = false;
		}else if(mbtn[1].value){
			mbtn[1].style.boxShadow='';
			ble = true;
		}else if(regMobile.test(mbtn[0].value)){
			mbtn[0].style.boxShadow='';
			ble = true;
		}
}
 
 function contrast3(){
	var mbtn = document.getElementsByClassName("m-btn");
 	var regMobile = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
 	if(!(regMobile.test(mbtn[0].value))){
 		mbtn[0].style.boxShadow='0 0 15px #E2A000';
 		mbtn[0].focus();
 		ble = false;
 	}else if(regMobile.test(mbtn[0].value)){
			mbtn[0].style.boxShadow='';
			ble = true;
			if(mbtn[1].value == ""){
				mbtn[1].style.boxShadow='0 0 15px #E2A000';
				mbtn[1].focus();
				ble = false;
			}
			if(mbtn[2].value){
				mbtn[2].style.boxShadow='';
				ble = true;
			}
			if(mbtn[2].value == ""){
				mbtn[2].style.boxShadow='0 0 15px #E2A000';
				ble = false;
			}
		}
}

    //登入判断
function logindex(){
	var mbtn = document.getElementsByClassName("m-btn");
	if(mbtn){
    	$.ajax({
				type: "GET",
				url: "IndexFrontServlet",
				data: $("#indexfor1").serialize(),
				dataType:"json",
				async:false, 
				success: function(result) {
					if(result=="1"){
						alert("账号或密码错误！");
					}else if(result=="2"){
						alert("验证码错误");
					}else if(result=="3"){
						window.location.href="ScenicServlet?method=scenicCllentList";
					}
				}
			});
  		 }else{
  		 	alert("请正确操作!");
  		 }
    }
	
    
 
</script>


<!--切换登入和注册 -->
<script>
	var login = document.getElementById("login");
	var registe = document.getElementById("registe");
	var forget = document.getElementById("forget");
	var mbtn = document.getElementsByClassName("m-btn");
	
	
	function sr(){//切换到登入页面
		registe.style.display="none";
		login.style.display="block";
		forget.style.display="none";
		mbtn[0].focus();
		
		for(var i=0;i<3;i++) {
			mbtn[i].value="";
		}
		for(var i=7;i<10;i++) {
			mbtn[i].value="";
		}
	}
	function sw(){//切换到注册页面
		login.style.display="none";
		registe.style.display="block";
		forget.style.display="none";
		mbtn[3].focus();
		
		for(var i=3;i<7;i++) {
			mbtn[i].value="";
		}
		
	}
	function sf(){//切换到忘记密码页面
		registe.style.display="none";
		login.style.display="none";
		forget.style.display="block";
		mbtn[7].focus();
	}
	
    /*
    SuperSlide组合注意：
    1、内外层mainCell、targetCell、prevCell、nextCell等对象不能相同，除非特殊应用；
    2、注意书写顺序，通常先写内层js调用，再写外层js调用
    */

    /* 内层图片滚动切换 */
    jQuery(".partners .slideBox").slide({
		mainCell:"ul",
		vis:5,
		prevCell:".sPrev",
		nextCell:".sNext",
		effect:"leftLoop"
		});

    /* 内层图片滚动切换 */
    jQuery(".slideGroup .slideBox").slide({
		mainCell:"ul",
		vis:5,
		prevCell:".sPrev",
		nextCell:".sNext",
		effect:"leftLoop"
		});
    /* 外层tab切换 */
    jQuery(".news").slide({
		titCell:".parHd li",
		mainCell:".parBd"
		});
    
</script>
</body>
</html>