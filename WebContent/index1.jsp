<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>xxx系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
   <link href="css/default.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="js/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="js/themes/icon.css" />
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.pack.js"></script>
    
 

	<script type="text/javascript" src='js/outlook2.js'> </script>
	<style>
	.cs-north {
	height:50px;background:#E0ECFF;
}
.cs-north-bg {
	width: 100%;
	height: 100%;
	background: url(themes/gray/images/header_bg.png) repeat-x;
}
.cs-north-logo {
	height: 40px;
	padding: 10px 0px 0px 5px;
	color:#fff;font-size:22px;font-weight:bold;text-decoration:none
}
	</style>
   <script type="text/javascript">
	 var _menus = {"menus":[
						{"menuid":"1","icon":"icon-sys","menuname":"控件使用",
							"menus":[{"menuname":"菜单管理","icon":"icon-nav","url":"http://hxling.cnblogs.com"},
									{"menuname":"添加用户","icon":"icon-add","url":"demo.html"},
									{"menuname":"用户管理","icon":"icon-users","url":"admin/student/studentInfo.jsp"},
									{"menuname":"角色管理","icon":"icon-role","url":"demo2.html"},
									{"menuname":"权限设置","icon":"icon-set","url":"demo.html"},
									{"menuname":"系统日志","icon":"icon-log","url":"demo.html"}
								]
						},{"menuid":"8","icon":"icon-sys","menuname":"员工管理",
							"menus":[{"menuname":"员工列表","icon":"icon-nav","url":"demo.html"},
									{"menuname":"视频监控","icon":"icon-nav","url":"demo1.html"}
								]
						},{"menuid":"56","icon":"icon-sys","menuname":"部门管理",
							"menus":[{"menuname":"添加部门","icon":"icon-nav","url":"demo1.html"},
									{"menuname":"部门列表","icon":"icon-nav","url":"demo2.html"}
								]
						},{"menuid":"28","icon":"icon-sys","menuname":"财务管理",
							"menus":[{"menuname":"收支分类","icon":"icon-nav","url":"demo.html"},
									{"menuname":"报表统计","icon":"icon-nav","url":"demo1.html"},
									{"menuname":"添加支出","icon":"icon-nav","url":"demo.html"}
								]
						},{"menuid":"39","icon":"icon-sys","menuname":"商城管理",
							"menus":[{"menuname":"商品分","icon":"icon-nav","url":"/shop/productcatagory.aspx"},
									{"menuname":"商品列表","icon":"icon-nav","url":"/shop/product.aspx"},
									{"menuname":"商品订单","icon":"icon-nav","url":"/shop/orders.aspx"}
								]
						}
				]};
        //设置登录窗口
        function openPwd() {
            $('#w').window({
                title: '修改密码',
                width: 300,
                modal: true,
                shadow: true,
                closed: true,
                height: 160,
                resizable:false
            });
        }
        //关闭登录窗口
        function closePwd() {
            $('#w').window('close');
        }

        

        //修改密码
        function serverLogin() {
            var $newpass = $('#txtNewPass');
            var $rePass = $('#txtRePass');

            if ($newpass.val() == '') {
                msgShow('系统提示', '请输入密码！', 'warning');
                return false;
            }
            if ($rePass.val() == '') {
                msgShow('系统提示', '请在一次输入密码！', 'warning');
                return false;
            }

            if ($newpass.val() != $rePass.val()) {
                msgShow('系统提示', '两次密码不一至！请重新输入', 'warning');
                return false;
            }

            $.post('/ajax/editpassword.ashx?newpass=' + $newpass.val(), function(msg) {
                msgShow('系统提示', '恭喜，密码修改成功！<br>您的新密码为：' + msg, 'info');
                $newpass.val('');
                $rePass.val('');
                close();
            })
            
        }

        $(function() {
        	clockon();
            openPwd();
            //
            $('#editpass').click(function() {
                $('#w').window('open');
            });

            $('#btnEp').click(function() {
                serverLogin();
            })

			$('#btnCancel').click(function(){closePwd();})

           

            $('#loginOut').click(function() {
                $.messager.confirm('系统提示', '您确定要退出本次登录吗?', function(r) {

                    if (r) {
                        location.href = '/schInfo/login1.jsp';
                    }
                });

            })
			
			
			
        });
		
		

    </script>

</head>
<body class="easyui-layout" style="overflow-y: hidden"  scroll="no">
<noscript>
<div style=" position:absolute; z-index:100000; height:2046px;top:0px;left:0px; width:100%; background:white; text-align:center;">
    <img src="images/noscript.gif" alt='抱歉，请开启脚本支持！' />
</div></noscript>
<div region="north" border="true" class="cs-north">
		<div class="cs-north-bg"><div class="cs-north-logo"> 
       
        <span style="float:right; padding-right:0px;padding-top:5px;color:black" class="head">  &nbsp; &nbsp; &nbsp;<span class="icon icon-users"  ></span>欢迎 xx &nbsp; &nbsp; &nbsp;
      <a href="#"  id="editpass" style="color:black;text-decoration:none" title="修改密码">
      <span class="icon icon-pwd"  ></span>修改密码</a>
        
    <a href="#" id="loginOut" style="color:black;text-decoration:none">    <span class="icon icon-out"  ></span>安全退出</a></span>
        <span style="padding-left:0px;padding-top:0px;font-size: 20px;color:black" ><img src="images/blocks.gif" width="20" height="20" /> 贝特工作室管理系统模板</span>
    

    <span id="bgclock" style="float:right; padding-right:0px;padding-top:5px;color:black" >	</span></div></div>
	</div>

   
    <div region="south" split="true" style="height: 30px; background: #D2E0F2; ">
        <div class="footer">By Jian.Song@ qq:260475052</div>
    </div>
    <div region="west" split="true" title="导航菜单" style="width:180px;" id="west">
<div class="easyui-accordion" fit="true" border="false">
		<!--  导航内容 -->
				
			</div>

    </div>
    <div id="mainPanle" region="center" style="background: #eee; overflow-y:hidden;">
        <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
			<div title="欢迎使用" style="padding:0px;overflow:hidden;" id="home">
				<img src="images/hello.png"  style="width:100%;height:100%"/>
		

			</div>
		</div>
    </div>
    
    
    <!--修改密码窗口-->
    <div id="w" class="easyui-window" title="修改密码" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save"  style="width: 300px; height: 150px; padding: 5px;
        background: #fafafa;">
        <div class="easyui-layout" fit="true">
            <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
                <table cellpadding=3>
                    <tr>
                        <td>新密码：</td>
                        <td><input id="txtNewPass" type="Password" class="txt01" /></td>
                    </tr>
                    <tr>
                        <td>确认密码：</td>
                        <td><input id="txtRePass" type="Password" class="txt01" /></td>
                    </tr>
                </table>
            </div>
            <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
                <a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)" >
                    确定</a> <a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">取消</a>
            </div>
        </div>
    </div>

	<div id="mm" class="easyui-menu" style="width:150px;">
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseall">全部关闭</div>
		<div id="mm-tabcloseother">除此之外全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-tabcloseright">当前页右侧全部关闭</div>
		<div id="mm-tabcloseleft">当前页左侧全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-exit">退出</div>
	</div>
  </body>
</html>
