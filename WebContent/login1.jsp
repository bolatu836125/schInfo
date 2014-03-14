<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String imcode=(String)session.getAttribute("rand");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>xx管理系统</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=basePath%>js/jquery-easyui-1.2.6/jquery-1.7.2.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-easyui-1.2.6/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-easyui-1.2.6/themes/icon.css" />
	<script type="text/javascript" src="<%=basePath%>js/jquery-easyui-1.2.6/jquery.easyui.min.js"></script>
    <script src="<%=basePath%>js/jquery-easyui-1.2.6/locale/easyui-lang-zh_CN.js"></script>
    <style type=text/css>
    BODY {
    	PADDING-BOTTOM: 0px; MARGIN: 0px auto; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; BACKGROUND: url(images/bj2.jpg) #0597c1 no-repeat center top; PADDING-TOP: 0px
    }</style>
    <script type="text/javascript">

        var LoginAndReg;
        var imgcode="";
        
        function login() {
            var txtUserName = $("#txtUserName");
            var txtPassword = $("#txtPassword");
            var VerifyCode=$("#VerifyCode");
            code();
           
            if (txtUserName.val() == "") {
            	
            	$.messager.alert("登陆提示","请输入用户名！","warning");
             //   alert();
                txtUserName.focus();
                return false;
            } else if (txtPassword.val() == "") {
            	$.messager.alert("登陆提示","请输入用户名！","warning");
                txtPassword.focus();
                return false;
            }
            else if (VerifyCode.val() =="") {
            	$.messager.alert("登陆提示","请输入验证码！","warning");
            	//VerifyCode.focus();
                return false;
            }
            else if (VerifyCode.val() !=imgcode) {
            	$.messager.alert("登陆提示","验证码错误！","warning");
            	//VerifyCode.focus();
                return false;
            }
            else {
                    var user = $("#txtUserName").val();
                    var pass = $("#txtPassword").val();
                    $.ajax({
						type:'post' , 
						url : 'loginServlet' ,
						cache:false ,
						async: false ,		//同步请求
						data:{"user":user,"pass":pass},
						dataType:'html' ,
						success:function(result){	
							if(result=="1"){
								//$.messager.alert("登陆提示","登陆成功","info");
								$.messager.show({
					                title: "登陆提示",
					                msg: "登陆成功，正在进入！",
					                showType: 'slide',
					                timeout: 500
					            });
								 setTimeout(function () { 
									  location.href = '/schInfo/index.jsp';
								    }, 1000);
								 
							}		else{
								$.messager.alert("登陆提示","登陆失败，账号或密码错误","error");
							}				
						}
					});

            }
        }


    


        function getsize() {
            var windowHeight = 0;
            var widowWidth = 0;
            if (typeof (window.innerHeight) == 'number') {
                windowHeight = window.innerHeight;
                widowWidth = window.innerWidth;
            }
            else {
                if (document.documentElement && document.documentElement.clientHeight) {
                    windowHeight = document.documentElement.clientHeight;
                    widowWidth = document.documentElement.clientWidth;
                }
                else {
                    if (document.body && document.body.clientHeight) {
                        windowHeight = document.body.clientHeight;
                        widowWidth = document.body.clientWidth;
                    }
                }
            }

            return { width: widowWidth, height: windowHeight };
        }
        
        function flushValidateCode(obj) {  
        	  
        	
            obj.src  ='ValidateCodeServlet?d='+new Date();  
         
        }
  function code(){
	    $.ajax({
			type:'post' , 
			url : 'GetSessionServlet' ,
			cache:false ,
			async: false ,		//同步请求
			//data:{"user":user,"pass":pass},
			dataType:'html' ,
			success:function(result){	
				imgcode=result;
			}
		});
  }
        
        $(function () {
      
        	window.moveTo(0, 0);    
        	window.resizeTo(screen.width,screen.height); 
        	$("#txtUserName").focus();
            $('#btnLogin').click(
            		function () {
            			login(); return false; });
         
        })

    </script>
</head>
<body>
<DIV id=login>
<DIV class=loginbox>
<DIV class=loginlogo>
<DIV class=inc><A href="http://www.zychr.com/" target=_blank>ZYCH V03</A></DIV></DIV>
<FORM method=post name=add action=?login=ok>
<DIV class=name>
<INPUT id=txtUserName class=inpu maxLength=20 size=23 type=text   name=txtUserName></DIV>
<DIV class=pass>
<INPUT id=txtPassword  class=inpu maxLength=20 size=23 type=password  name=txtPassword></DIV>
<DIV class=Code>
<INPUT class=inpu size=10 type=text name=VerifyCode  id=VerifyCode>
<DIV class=img_Code>
<img id="validateCodeId" src="ValidateCodeServlet"   onclick="flushValidateCode(this);" title='看不清,点击刷新'  style="cursor: pointer;"width=85 
height=30 />
</DIV>
</DIV><INPUT class=submit value="登陆" id="btnLogin" name="btnLogin"  type=submit> </FORM>
<DIV class=ver>Copyright &copy;2012-2013 <A href="http://www.zychr.com/"  target=_blank>songjian V03</A> Inc. All rights reserved. 
</DIV></DIV></DIV>
</body>
</html>