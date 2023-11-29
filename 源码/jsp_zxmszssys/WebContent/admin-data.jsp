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
			<div class="layui-form-item">
				<div class="layui-inline tool-btn">
					<div class="layui-inline">
						请选择您要看的分类：
						<select name="choose" id="choose" class="layui-select">
							<option value="">==请选择==</option>
							<option value="sce_collect">景点收藏</option>
							<option value="foo_collect">美食收藏</option>
						</select>
					</div>
						<center><strong style="color:#DE041F">只显示前10的数据，按从高往底排序</strong></center>
				</div>
			</div>
			<div style="height: 80%; height:500px; margin: 0">
				<div id="container" style="height: 100%"></div>
				<script type="text/javascript" src="static/admin/js/dist/echarts.min.js"></script>
				<script type="text/javascript" src="static/admin/js/dist/echarts-gl.min.js"></script>
				<script type="text/javascript" src="static/admin/js/dist/ecStat.min.js"></script>
				<script type="text/javascript" src="static/admin/js/dist/dataTool.min.js"></script>
				<script type="text/javascript" src="static/admin/js/dist/china.js"></script>
				<script type="text/javascript" src="static/admin/js/dist/world.js"></script>
				<script type="text/javascript" src="static/admin/js/dist/bmap.min.js"></script>
				<script type="text/javascript">
				</script>
			</div>
		</div>
		<script src="static/admin/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script src="static/admin/js/common.js" type="text/javascript" charset="utf-8"></script>
	</body>
	<script type="text/javascript">
		var arrayObj = new Array();
		$("#choose").change(function() {
			var dataname = $("#choose").val();
			//要触发的事件
			$.ajax({
				type: "post",
				url: "CollectServlet",
				data: {
					"method": dataname,
					"dataname": dataname
				},
				dataType: "json",
				success: function(result) {
					console.log(result);
					$.each(result, function(index, obj) {
						arrayObj.push(obj.name);
					});
					//console.log(arrayObj);
					dist(result);
				}
			});

		});

		function dist(result) {
			var dom = document.getElementById("container");
			var myChart = echarts.init(dom);
			var app = {};
			var x = arrayObj;
			var y = result;
			option = null;
			option = {
				tooltip: {
					trigger: 'item',
					formatter: '{a} <br/>{b}: {c} ({d}%)'
				},
				legend: { //左侧展示
					orient: 'vertical',
					left: 10,
					data: x //左侧的数据
				},
				series: [{
					name: '访问来源',
					type: 'pie',
					radius: ['70%', '90%'],//设置圆弧的厚度
					avoidLabelOverlap: false,
					label: {
						normal: {
							show: false,
							position: 'center'
						},
						emphasis: {
							show: true,
							textStyle: {
								fontSize: '30',
								fontWeight: 'bold'
							}
						}
					},
					labelLine: {
						normal: {
							show: false
						}
					},
					data: y //表数据（用的数组）
				}]
			};;
			if(option && typeof option === "object") {
				myChart.setOption(option, true);
			}
		}
	</script>

</html>