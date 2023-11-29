<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/jsp; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>登录</title>  
    <link rel="stylesheet" href="static/admin/css/pintuer.css">
    <link rel="stylesheet" href="static/admin/css/admin2.css">
	<script src="static/admin/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="static/admin/js/pintuer.js"></script>  
</head>
<body>
<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:150px;"></div>
            <div class="media media-y margin-big-bottom">           
            </div>         
            <form>
            <div class="panel loginbox">
                <div class="text-center margin-big padding-big-top"><h1>登录</h1></div>
                <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="text" id="username" autocomplete="off" class="input input-big" name="username" placeholder="登录账号(手机号)" data-validate="required:请填写账号" />
                            <span class="icon icon-user margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="password" id="password" class="input input-big" name="password" placeholder="登录密码" data-validate="required:请填写密码" />
                            <span class="icon icon-key margin-small"></span>
                        </div>
                    </div>
                   <!--  <div class="form-group">
                        <div class="field">
                            <input type="text" class="input input-big" name="code" id="s1" placeholder="填写右侧的验证码" data-validate="required:请填写右侧的验证码" />
                                    <canvas id="canvas" width="100" height="32" class="passcode" style="height:43px;cursor:pointer;"></canvas>               
                        </div>
                    </div> -->
                </div>
                <div style="padding:30px;"><input type="button" onclick="login()" class="button button-block bg-main text-big input-big" value="登录"></div>
               <!--<div style="padding:30px;"><input type="button" id="btn1" class="button button-block bg-main text-big input-big" value="登录"></div>-->
            </div>
            </form>          
        </div>
    </div>
</div>
<script type="text/javascript">
//登陆
function login(){
	$.ajax({
		url:"Login",
		type:"post",
		data:{
			"method":"login",
			"uname":$("#username").val(),
			"password":$("#password").val(),
		},
		success:function(result){
			console.log(result);
			if(result == "1"){
				window.location.href ="Login?method=index";
				
			}else{
				alert("账号或密码错误！");
			}
		},
		error: function () { 
			alert("密码错误，请重新输入！");
		}
		
	});
}

	
	
//	// 验证码
//		$(function(){
//	    var show_num = [];
//	    draw(show_num);
//	    $("#canvas").on('click',function(){
//	        draw(show_num);
//	    })
//	    $("#btn1").on('click',function(){
//	        var val = $("#s1").val().toLowerCase();
//	        var num = show_num.join("");
//	        if(val==''){
//	            alert('请输入验证码！');
//	        }else if(val == num){
//				login();
//	            $("#s1").val('');
//	            draw(show_num);
//	        }else{
//	            alert('验证码错误！请重新输入！');
//	            $("#s1").val('');
//	             draw(show_num);
//	        }
//	    })
//	})
	
//		//生成并渲染出验证码图形
//	function draw(show_num) {
//	    var canvas_width=$('#canvas').width();
//	    var canvas_height=$('#canvas').height();
//	    var canvas = document.getElementById("canvas");//获取到canvas的对象，演员
//	    var context = canvas.getContext("2d");//获取到canvas画图的环境，演员表演的舞台
//	    canvas.width = canvas_width;
//	    canvas.height = canvas_height;
//	    var sCode = "a,b,c,d,e,f,g,h,i,j,k,m,n,p,q,r,s,t,u,v,w,x,y,z,A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0";
//	    var aCode = sCode.split(",");
//	    var aLength = aCode.length;//获取到数组的长度
//	    
//	    for (var i = 0; i < 4; i++) {  //这里的for循环可以控制验证码位数（如果想显示6位数，4改成6即可）
//	        var j = Math.floor(Math.random() * aLength);//获取到随机的索引值
//	        // var deg = Math.random() * 30 * Math.PI / 180;//产生0~30之间的随机弧度
//	        var deg = Math.random() - 0.5; //产生一个随机弧度
//	        var txt = aCode[j];//得到随机的一个内容
//	        show_num[i] = txt.toLowerCase();
//	        var x = 10 + i * 20;//文字在canvas上的x坐标
//	        var y = 20 + Math.random() * 8;//文字在canvas上的y坐标
//	        context.font = "bold 23px 微软雅黑";
//	
//	        context.translate(x, y);
//	        context.rotate(deg);
//	
//	        context.fillStyle = randomColor();
//	        context.fillText(txt, 0, 0);
//	
//	        context.rotate(-deg);
//	        context.translate(-x, -y);
//	    }
//	    for (var i = 0; i <= 5; i++) { //验证码上显示线条
//	        context.strokeStyle = randomColor();
//	        context.beginPath();
//	        context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
//	        context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
//	        context.stroke();
//	    }
//	    for (var i = 0; i <= 30; i++) { //验证码上显示小点
//	        context.strokeStyle = randomColor();
//	        context.beginPath();
//	        var x = Math.random() * canvas_width;
//	        var y = Math.random() * canvas_height;
//	        context.moveTo(x, y);
//	        context.lineTo(x + 1, y + 1);
//	        context.stroke();
//	    }
//	}
//	
//	//得到随机的颜色值
//	function randomColor() {
//	    var r = Math.floor(Math.random() * 256);
//	    var g = Math.floor(Math.random() * 256);
//	    var b = Math.floor(Math.random() * 256);
//	    return "rgb(" + r + "," + g + "," + b + ")";
//	}
//	
//	
</script>

</html>