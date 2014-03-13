<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP '009_combo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/common.css" />
	<script type="text/javascript" src="js/jquery-easyui-1.2.6/jquery-1.7.2.min.js"></script>
	<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.2.6/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.2.6/themes/icon.css" />
	<script type="text/javascript" src="js/jquery-easyui-1.2.6/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/jquery-easyui-1.2.6/locale/easyui-lang-zh_CN.js"></script>
	<script>
		$(function(){
			$('#cc').combo({
				required:true,
				editable:false ,
				width:255 ,
				panelHeight:300 
			});
			$('#sp').appendTo($('#cc').combo('panel'));
			$('#sp img').click(function(){
				var v = $(this).attr('value');
				var s = $(this).attr('text');
				$('#cc').combo('setValue', v).combo('setText', s).combo('hidePanel');
			});
		});
	</script>
  </head>
  
  <body>
	<select id="cc"></select>
	<div id="sp">
		<div style="color:#99BBE8;background:#fafafa;padding:5px;">Select a language</div>
		<div>
			<img src="images/001.jpg" value="001.jpg" text="图片1" ></img>
		</div>
		<div>
			<img src="images/002.jpg" value="002.jpg" text="图片2" ></img>
		</div>
		<div>
			<img src="images/003.jpg" value="003.jpg" text="图片3" ></img>
		</div>
		<div>
			<img src="images/004.jpg" value="004.jpg" text="图片4" ></img>
		</div>
		<div>
			<img src="images/005.jpg" value="005.jpg" text="图片5" ></img>
		</div>								
	</div>
  </body>
</html>
