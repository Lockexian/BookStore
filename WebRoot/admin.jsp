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
    
    <title>管理员登录</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">


	<style type="text/css">
		body{
			background-image:url("images/298226.jpg");
			
			
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
		#denglu{
			width:200px;
			height:50px;
			border:0;
			background-color:#009900;
			color:#FFFFFF;	
			font-size:1.2em;
		}
		#denglu:hover{
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
  <form action="/webbookshop/adminlogin" method="post">
    <table border="0px">
    	<th colspan=2>管理员后台登录
		</th>
		<tr id="tr_info">
			<td colspan="2" id="tr_info">
				<c:if test="${faile!=null}">
					<span id="info">账号或密码错误！</span>
				</c:if>
			</td>
		</tr>
    	<tr>
    		<td class="td_text"><img src="images/user3.png" id="img_user"></td>
    		<td class="td_input">
    		<input type="text"  required name="t_UserId" id="t_UserId"></td>
       	</tr>
       	
       	<tr>
    		<td class="td_text"><img src="images/pwd3.png" id="img_pwd"></td>
    		<td class="td_input"><input type="password" required name="t_UserPwd" id="t_UserPwd"></td>
       	</tr>
       	
       	<tr>
       		<td colspan=2>
       			<input type="submit" value="登录" id="denglu">
       		</td>
       	</tr>
  	
    </table>
   </form>
   <script language="javascript" type="text/javascript">
		$("#img_user").mouseenter(function(){
			$(this).attr("src","images/user4.png")
		}).mouseleave(function(){
			$(this).attr("src","images/user3.png")
		})
		
		$("#img_pwd").mouseenter(function(){
			$(this).attr("src","images/pwd4.png")
		}).mouseleave(function(){
			$(this).attr("src","images/pwd3.png")
		})
		
		$("input").click(function(){
			$("#info").hide();

		})
		
	</script>
  </body>
</html>
