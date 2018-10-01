<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改密码</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">


	<style type="text/css">
		body{
			background-image:url("images/book.jpg");
			
			
		}
		form{
			text-align:center;
		}
		table{
			color:#FFFFFF;
			background-image:url("images/touming.png");
			text-align:center;
			position:relative;
			top:300px;
			font-size:1.2em;
			width:400px;
			height:300px;
			margin:0 auto;
			
			

		}
		th{
			align:center;
			font-size:1.3em;
		}
		#tr_info{
			height:20px;
		}
		
		#info{
			color:red;
			font-size:0.8em;
			
		}
		#genggai{
			width:200px;
			height:50px;
			border:0;
			background-color:#009900;
			color:#FFFFFF;	
			font-size:1.2em;
		}
		#ibutton{
			width:150px;
			height:25px;
			background-color:#F3F3F3;
		}
		
		#genggai:hover{
			background-color:#007700;
		}
		a{
			color:white;
		}
		
		#update:hover{
			color:red;
			
		}
		#register:hover{
			color:#009900;
			
		}
		#t_UserPwd{
			
			width:200px;
			font-size:1.2em;	
		}
		#rt_UserPwd{
			
			width:200px;
			font-size:1.2em;	
		}
		#identifyingcode{
			width:200px;
			font-size:1.2em;
		}
		#t_UserId{
			
			width:200px;
			font-size:1.2em;
		}
		.td_text{
			width:110px;
			font-size:1.2em;
			text-align:right;
		}
		.td_input{
			text-align:left;
		}
		img{
			width:30px;	
		}
		
		
		
	</style>
	<script language="javascript" type="text/javascript" src="jquery-3.1.1.min.js">
		
	</script>
	
  </head>
  
  <body>
  <form action="/webbookshop/Mailsservlet" method="post">
    <table >
    
    	<th colspan="3">修改密码
		</th>
		
		<tr id="tr_info">
			<td colspan="3" id="tr_info">
				<c:if test="${faile!=null}">
					<span id="info">用户名或验证码错误！</span>
				</c:if>
			</td>
		</tr>
    	<tr>
    		<td class="td_text"><img src="images/user3.png" id="img_user"></td>
    		<td class="td_input">
    		<input type="text"  required name="username" id="t_UserId">
    		</td>
    		<td></td>
       	</tr>
     
       	<tr>
    		<td class="td_text"><img src="images/pwd3.png" id="img_pwd"></td>
    		<td class="td_input"><input type="password" required name="t_UserPwd" id="t_UserPwd"></td>
       		<td><span id ="pwinfo"></span></td>
       	</tr>
       	<tr>
    		<td class="td_text"><img src="images/pwd3.png" id="rimg_pwd"></td>
    		<td class="td_input"><input type="password" required name="rt_UserPwd" id="rt_UserPwd"></td>
      		<td></td>
       	</tr>
       	 <tr>
       	 	<td align="right">验证码</td>
       		<td class="td_text"> 
       			<input type="text" id= "identifyingcode" name = "identifyingcode"/>
       		</td>
       		<td></td>       		
       	</tr>
       	<tr>
       		<td colspan="3">
       			<input type="button" value="获取验证码" id="ibutton">
       		</td>
       	</tr>
       	
       	<tr>
       		<td colspan="3">
       			<input type="submit" value="确认更改" id="genggai">
       		</td>
       	</tr>
  	
    </table>
   </form>
   <script language="javascript" type="text/javascript">
		$("#img_user").mouseenter(function(){
			$(this).attr("src","images/user2.png")
		}).mouseleave(function(){
			$(this).attr("src","images/user3.png")
		})
		
		$("#img_pwd").mouseenter(function(){
			$(this).attr("src","images/pwd2.png")
		}).mouseleave(function(){
			$(this).attr("src","images/pwd3.png")
		})
		$("#rimg_pwd").mouseenter(function(){
			$(this).attr("src","images/pwd2.png")
		}).mouseleave(function(){
			$(this).attr("src","images/pwd3.png")
		})
		
		$("input").click(function(){
			$("#info").hide();
			
		})
		
		//passwordlength
		$("#t_UserPwd").blur(function(){
   			var pwdlen = $("#t_UserPwd").val();
   			if(pwdlen.length<6||pwdlen.length>15){
   				$("#pwinfo").empty();
   				$("#pwinfo").append("6~15位字母或数字");
   				$("#pwinfo").css("color","red");
   			}	
   			else
   				$("#pwinfo").empty();
   		});
   		
   		//密码一致
   		$("#rt_UserPwd").blur(function(){
   			var pwdlen = $("#t_UserPwd").val();
   			var pwdlen2 = $("#rt_UserPwd").val();
   			if(pwdlen==pwdlen2){
   				$("#pwinfo").empty();
   				
   			}
   			else{
   				$("#pwinfo").css("color","red");
   				$("#pwinfo").empty();
   				$("#pwinfo").append("两次密码不一致！");
   				
   			}
   		});
		
		$("#ibutton").click(function(){
			var username = $("#t_UserId").val();
			$.get("/webbookshop/Mailsservlet",{"username":username,"t":"mail"},function(){},"html");	
		});
		
	</script>
  </body>
</html>
