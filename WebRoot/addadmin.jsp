<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加管理员</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script language="javascript" type="text/javascript" src="jquery-3.1.1.min.js"></script>
	<style>
		body{
			text-align:center;
			
		}
		table{
			text-align:center;
			position:relative;
			top:300px;
			font-size:1.2em;
			width:600px;
			height:300px;
			margin:0 auto;
		}
		.xinghao{
			color:red;
		}
		.td2{
			width:170px;
		}
		.td3{
			width:190px;
		}
	</style>

  </head>
  
  <body>
  <form action= "/webbookshop/Addadmin" method="post" >
    	<table border=1px;>
    			<tr>
		    		<td class="text"><span class="xinghao">*</span>管理员账号</td>
		    		<td class="td2"><input required autofocus pattern="[A-Za-z1-9]{4,15}"  type="text"  id="t_UserName" name="t_UserName"></td>
		    		<td class="td3"><span id="nameinfo">4-15个字母或数字</span></td>
		       	</tr>
		       	<tr>
		    		<td class="text"><span class="xinghao">*</span>管理员密码</td>
		    		<td><input required  type="password" pattern="[A-Za-z1-9]{6,15}" id="t_UserPwd" name="t_UserPwd"></td>
		    		<td><span id="pwdinfo"></span></td>
		       	</tr>
				<tr>
		    		<td class="text"><span class="xinghao">*</span>确认密码</td>
		    		<td><input required type="password" pattern="[A-Za-z1-9]{6,15}" id="t_UserPwd2" name="t_UserPwd2"></td>
		    		<td><span id="pwdinfo2"></span></td>
		       	</tr>
    		<tr>
    			<td colspan="3">
    				<input type="submit" value="添加一名管理员" id="zhuce">
    			</td>
    		</tr>
    	</table>
    </form>
    <script language="javascript" type="text/javascript">
 
   		//username length
   		$("#t_UserName").blur(function(){
   			var namelen =  $("#t_UserName").val();
   			if(namelen.length<4||namelen.length>15){
   				$("#nameinfo").empty();
   				$("#nameinfo").append("4~15位字母或数字");
   				$("#nameinfo").css("color","red");
   			}
   				
   			else{
   				$("#nameinfo").css("color","black");
   				//$("#nameinfo").load("/webbookshop/registercheck",$("#form1").serializeArray());
   				$("#nameinfo").load("/webbookshop/adminregistercheck",{"t_UserName":$("#t_UserName").val()});
   				
   				
   			}
   				
   		});

   		//密码长度
   		$("#t_UserPwd").blur(function(){
   			var pwdlen = $("#t_UserPwd").val();
   			if(pwdlen.length<6||pwdlen.length>15){
   				$("#pwdinfo").empty();
   				$("#pwdinfo").append("6~15位字母或数字");
   				$("#pwdinfo").css("color","red");
   			}	
   			else
   				$("#pwdinfo").empty();
   		});
   		
   		//密码一致
   		$("#t_UserPwd2").blur(function(){
   			var pwdlen = $("#t_UserPwd").val();
   			var pwdlen2 = $("#t_UserPwd2").val();
   			if(pwdlen==pwdlen2){
   				$("#pwdinfo2").empty();
   				
   			}
   			else{
   				$("#pwdinfo2").css("color","red");
   				$("#pwdinfo2").empty();
   				$("#pwdinfo2").append("两次密码不一致！");
   				
   			}
   		});
   	</script>
  </body>
  
</html>
