<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP '008_datagrid.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/common.css" />
	<script type="text/javascript" src="<%=basePath%>js/jquery-easyui-1.2.6/jquery-1.7.2.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-easyui-1.2.6/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-easyui-1.2.6/themes/icon.css" />
	<script type="text/javascript" src="<%=basePath%>js/jquery-easyui-1.2.6/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery-easyui-1.2.6/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/commons.js"></script>
	<script type="text/javascript"  src="<%=basePath %>admin/student/js/student.js">
			
	</script>

	
  </head>
  
  <body id="lay"  class="easyui-layout"  style="overflow-y: hidden"  scroll="no">
			<div region="north" title="用户查询" collapsed=true style="width:100%;height:100%"  >
					<form id="mysearch" method="post">
							用户名:&nbsp;&nbsp;&nbsp;<input name="username" class="easyui-validatebox"  value="" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							开始时间:<input name="startTime"  class="easyui-datetimebox" editable="false" style="width:160px;"  value="" />	
							结束时间:<input name="endTime"  class="easyui-datetimebox" editable="false" style="width:160px;"  value="" />	
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a id="searchbtn" class="easyui-linkbutton">查询</a> <a id="clearbtn" class="easyui-linkbutton">清空</a>
					</form>
				
				</div>
				
				<div region="center" style="width:100%;height:100%;" >
					<table id="t_user"  ></table>
				</div>
			
 			<div id="mydialog" title="新增用户" modal=true  draggable=false class="easyui-dialog" closed=true style="width:500px;height:500px">
	    		<form id="myform" action="" method="post">
	    				<input type="hidden" name="id" value="" />
	    				<table>
	    					<tr>
	    						<td>用户名:</td>
	    						<td><input type="text" name="username" class="easyui-validatebox" required=true validType="midLength[2,5]" missingMessage="用户名必填!" invalidMessage="用户名必须在2到5个字符之间!"  value="" /></td>
	    					</tr>
	    					<tr>
	    						<td>密码:</td>
	    						<td><input type="password" name="password" class="easyui-validatebox" required=true validType="equalLength[4]" missingMessage="密码必填!" value="" /></td>
	    					</tr>
	    					<tr>
	    						<td>性别:</td>
	    						<td>
	    							男<input type="radio" checked="checked" name="sex" value="1" />
	    							女<input type="radio" name="sex" value="2" />
	    						</td>
	    					</tr>
	    					<tr>
	    						<td>年龄:</td>
	    						<td><input id="age" type="text"  name="age" value="" /></td>
	    					</tr>
	    					<tr>
	    						<td>出生日期:</td>
	    						<td><input id="birthday" style="width:160px;"  type="text" name="birthday" value="" /></td>
	    					</tr>
	    					<tr>
	    						<td>所属城市:</td>
	    						<td>
	    							<input name="city" class="easyui-combobox" url="UserServlet?method=getCity" valueField="id" textField="name"  value="" />
	    						</td>
	    					</tr>
	    					<tr>
	    						<td>薪水:</td>
	    						<td><input id="salary" type="text" name="salary" value="" /></td>
	    					</tr>
	    					<tr>
	    						<td>开始时间:</td>
	    						<td><input id="startTime"  class="easyui-datebox" required="true"  type="text" name="startTime"  value="" /></td>
	    					</tr>
	    					<tr>
	    						<td>结束时间:</td>
	    						<td><input id="endTime" style="width:160px;"   type="text" name="endTime"  value="" /></td>
	    					</tr>   
	    					<tr>
	    						<td>个人描述:</td>
	    						<td><input type="text" name="description" class="easyui-validatebox" required=true validType="midLength[5,50]" missingMessage="个人描述必填!" invalidMessage="描述必须在5到50个字符之间!"  value="" /></td>
	    					</tr> 
	    					<tr align="center">
	    						<td colspan="2">
	    							<a id="btn1" class="easyui-linkbutton">确定</a>
	    							<a id="btn2" class="easyui-linkbutton">关闭</a>
	    						</td>
	    					</tr>   					 					    					    					    					    					    					    					    					
	    				</table>
	    		</form> 			
 			</div>
  </body>
</html>
