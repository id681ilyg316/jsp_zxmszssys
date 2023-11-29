<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

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
<script src="static/admin/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="static/admin/layui/css/layui.css" />
<link rel="stylesheet" type="text/css" href="static/admin/css/admin.css" />
<script src="static/admin/layui/layui.js" type="text/javascript"
	charset="utf-8"></script>
</head>
<!--/head-->

<body>
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
	<!-- <div class="banner2">
		<p style="background: url(images/korean2.png) no-repeat center; background-size: cover;"></p>
	</div> -->
	<div class="clearfix"></div>
	<section class="container">
	<div class="layui-form-item">
	<div id="box">
			<select id="pro" name="province" lay-verify="required"   >
				</select><select id="city" name="city" lay-verify="required" >
				</select><select id="county" name="regionId" lay-verify="required" >
				</select>
			
			<input type="text" id="tutName" name="search" placeholder="请输入关键字">
			<input type="hidden" id="typId"  value="${tutorial[0].typ_id }">
			<div id="search" onclick="search()">搜索</div>
		</div></div>
		<div class="head">
			景点列表<span>Course classification</span>
		</div>
		<div class="row" id="liebiao1">
		<c:if test="${empty  scenic }">
		<p><strong style="color:#DD001B">对不起，你要查的暂时还没有数据</strong>  </p>
		</c:if>
			<c:forEach items="${scenic }" var="scenic">
				<div style="width: 372px; float: left; padding: 15px; margin-bottom: 30px;">
					<div class="staff_detail">
						<img src="/zxmszssys/${scenic.img_url }"
							style="center: center; width: 308px; height: 200px;">
						<p>
							<span >景点名称：<strong style="color:#252625;">${scenic.sce_name }</strong></span>
						</p>
						<p>
							<span>人气：<strong style="color:#FDDF11;">${scenic.num }</strong></span>
							<c:choose>
						<c:when test="${scenic.count eq 0 }">|&nbsp;&nbsp;&nbsp;&nbsp;收藏：
						<button onclick="addcollect('${scenic.sce_id }')"><i title="点击收藏" class="layui-icon" style="font-size: 20px; color: #1E9FFF;">&#xe600;</i></button>
						</c:when>
						<c:when test="${scenic.count eq 1 }">|&nbsp;&nbsp;&nbsp;&nbsp;收藏：
						<button onclick="updatecollect('${scenic.sce_id }')"><i title="取消收藏" class="layui-icon" style="font-size: 20px; color: #FD7169;">&#xe600;</i></button>
						</c:when>
						 </c:choose>
							<br>
						</p>
						<p>
							<span >详细地址：${scenic.address }</span>
						</p>
						<p>
							<a href="javascript:detail('${scenic.sce_id }');">查看详情</a>
							<a href="FoodServlet?method=foodCllentList&sceId=${scenic.sce_id}">查看附近美食</a>
						</p>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="clearfix"></div>
		<!-- <div class="page">
			<a href="ScenicServlet?method=scenicCllentList&currentPage=${currentPage - 1 }" <c:if test="${currentPage<=1 }"> onclick="javascript:return false;"</c:if>>上一页 </a>
			当前第<a href='#' class="now">${currentPage }</a>页|共<a>${pages }</a>页
			<a  href="ScenicServlet?method=scenicCllentList&currentPage=${currentPage + 1 }" <c:if test="${currentPage>=pages }"> onclick="javascript:return false;"</c:if> >下一页 </a>
		</div> -->
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
<script type="text/javascript">
function search() { //发布订单
	var tutName=document.getElementById("tutName").value;
	var county=document.getElementById("county").value;
	console.log(tutName+""+typId);
	window.location.href = "ScenicServlet?method=searchCllentList&sceName="+tutName+"&regionId="+county;
}
$(function(){
    $.ajax({
        type:"POST",
        cache:false,
        url:"LiandongServlet",
        data:{"method":"provinceQuery",
        	"parentid":0},
        dataType:"json",
        success:function(data){
            var option='<option>请选择</option>';
            $.each(data,function(i,n){
                option += '<option value="'+n.base_areaid+'">'+n.name+'</option>';
            })
            $("#pro").append(option);
        }
    });

    $("#pro").change(function(){
        var pid=$(this).val();
        $.ajax({
        type:"POST",
        cache:false,
        url:"LiandongServlet",
        data:{"method":"provinceCity",
        	  "parentid":pid},
        dataType:"json",
        success:function(data){
        //追加本级option前，先清除city和county的option，以免重选时干扰
            $("#city option").remove(); 
            $("#county option").remove();
            var option='<option>请选择</option>';
            $.each(data,function(i,n){
                option += '<option value="'+n.base_areaid+'">'+n.name+'</option>';
            })
            $("#city").append(option);
        }
        });
    });
    
    $("#city").change(function(){
        var pid=$(this).val();
        $.ajax({
        type:"POST",
        cache:false,
        url:"LiandongServlet",
        data:{"method":"provinceCounty",
        		"parentid":pid},
        dataType:"json",
        success:function(data){
        //同上
            $("#county option").remove();
            var option='<option>请选择</option>';
            $.each(data,function(i,n){
                option += '<option value="'+n.base_areaid+'">'+n.name+'</option>';
            })
            $("#county").append(option);
        }
        });
    });
})



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
	function addcollect(foo_id) {
		$.ajax({
			type: "get",
			url: "CollectServlet",
			data: {"method":"addSce",
				"sceId":foo_id	
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
					}, 600);
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
	/*div.style.background = "#2CBEED";*/
</script>
<!--下方所需样式div:inforlist-->
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
select{
width: 100px;
	border: 1px solid #e2e2e2;
	height: 50px;
	float: left;
	border-radius: 10px;
	background-image: url(images/search.jpg);
	background-repeat: no-repeat;
	background-size: 25px;
	background-position: 5px center;
	padding: 0 0 0 20px;
	font-size:16px;
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
 
.infor {
	width: 32%;
	height: 92px;
	float: left;
	margin: 0 .6% 1.1% .5%;
	border: solid 1px #fff
}

.infor:hover {
	background: #f2fcfb;
	border: solid 1px #b2ebe7;
	border-radius: 3px
}

.infor:hover dd .saw {
	display: block
}

.infor:hover dd p {
	width: 152px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis
}

.infor dt {
	width: 97px;
	height: 92px;
	float: left
}

.infor dt img {
	width: 64px;
	height: 64px;
	margin: 14px auto;
	display: block
}

.infor dd {
	height: 80px;
	position: relative;
	overflow: hidden
}

.infor dd h3 {
	font-size: 20px;
	color: #333;
	margin: 20px 0 7px;
	white-space: nowrap
}

.infor dd p {
	font-size: 14px;
	color: #999
}

.infor dd .saw {
	width: 72px;
	height: 32px;
	background: #00beaf;
	border-radius: 3px;
	font-size: 12px;
	color: #fff;
	text-align: center;
	line-height: 32px;
	position: absolute;
	right: 15px;
	top: 30px;
	display: none
}

.servicetit1 {
	font-size: 22px;
	margin-left: 2%;
	margin-bottom: 2%;
}

.class_tab a:hover {
	background: #2CBEED;
}
</style>

</html>