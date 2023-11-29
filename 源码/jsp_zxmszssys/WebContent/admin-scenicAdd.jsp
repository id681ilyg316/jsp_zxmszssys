<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>后台管理系统</title>
<link rel="stylesheet" type="text/css"
	href="static/admin/layui/css/layui.css" />
<link rel="stylesheet" type="text/css" href="static/admin/css/admin.css" />
<script src="static/admin/layui/layui.js" type="text/javascript"
	charset="utf-8"></script>
<script src="static/admin/js/jquery-3.2.1.min.js"></script>
</head>
<body>
	<div class="layui-tab page-content-wrap">
		<form action="ScenicServlet"
			enctype="multipart/form-data" >
			<input type="hidden" name="method" value="scenicAdd">
			<div class="layui-form-item">
				<label class="layui-form-label">选择地区：</label>
				<div class="layui-input-block">
					<select id="pro" name="province" lay-verify="required"   >
						</select>省<span> </span> <select id="city" name="city" lay-verify="required" >
						</select><span>市</span> <select id="county" name="regionId" lay-verify="required" >
						</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">景点名称：</label>
				<div class="layui-input-block">
					<input type="text" id="sceName" name="sceName" required lay-verify="required"
						value="" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">图片：</label>
				<div class="layui-input-block">
					<input name="Savatar" type="file" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">详细地址：</label>
				<div class="layui-input-block">
					<input type="text" id="address" name="address" required lay-verify="required"
						value="" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">描述：</label>
				<div class="layui-input-block">
					<textarea id="orgAuditDesc" name="description"
						style="font-size: 20px; width: 1000px; height: 200px;"></textarea>
					<p>
						<span id="text-count">255</span>/255
					</p>

				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<input class="layui-btn " type="submit" value="提交" onclick="ok()">
				</div>
			</div>
		</form>
	</div>
</body>
<style >
select {
	width: 100px;
	height: 40px;
	font-size:16px;
}
</style>
<script type="text/javascript">

$(function(){
    $.ajax({
        type:"POST",
        cache:false,
        url:"LiandongServlet",
        data:{"method":"provinceQuery",
        	"parentid":0},
        dataType:"json",
        success:function(data){
            var option='<option>--请选择--</option>';
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
            var option='<option>--请选择--</option>';
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
            var option='<option>--请选择--</option>';
            $.each(data,function(i,n){
                option += '<option value="'+n.base_areaid+'">'+n.name+'</option>';
            })
            $("#county").append(option);
        }
        });
    });
})



	/*字数限制*/
	$("#orgAuditDesc").on("input propertychange", function() {
		var $this = $(this), _val = $this.val(), count = "";
		if (_val.length > 255) {
			$this.val(_val.substring(0, 255));
		}
		count = 255 - $this.val().length;
		$("#text-count").text(count);
	});
	function ok() {
		alert("成功！");
	}
</script>
</html>