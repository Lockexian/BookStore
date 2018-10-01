<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>更改密码</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<script src="jquery-3.1.1.min.js"></script>
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
		#genggai{
			width:200px;
			height:50px;
			border:0;
			background-color:#009900;
			color:#FFFFFF;	
			font-size:1.2em;
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
		#new_UserPwd{
			
			width:200px;
			font-size:1.2em;		
		}
		#rnew_UserPwd{
			
			width:200px;
			font-size:1.2em;		
		}
		#old_UserPwd{
			
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
		#index{
			color:#9CC14F;
		}
		
		
	</style>
	<script language="javascript" type="text/javascript" src="jquery-3.1.1.min.js">
		
	</script>
	
  </head>
  
  <body>
  <form action="/webbookshop/Updateadpw" method="post">
    <table border="0px">
    	<th colspan=3>管理员密码修改
		</th>
		<tr id="tr_info">
			<td colspan="3" id="tr_info">
				<c:if test="${faile=='faile'}">
					<span id="info">密码错误！</span>
				</c:if>
				<c:if test="${faile=='true'}"><span id = "infos">修改成功</span></c:if>
			</td>
		</tr>
    	<tr>
    		<td class="td_text"><img src="images/pwd3.png" id="old_img_pwd"></td>
    		<td class="td_input">
    		<input type="password"  required name="old_UserPwd" id="old_UserPwd"></td>
       		<td>原密码</td>
       	</tr>
       	
       	<tr>
    		<td class="td_text"><img src="images/pwd3.png" id="img_pwd"></td>
    		
    		<td class="td_input"><input type="password" required name="new_UserPwd" id="new_UserPwd"></td>
      		<td id="newpw">新密码</td>
       	</tr>
       	<tr>
    		<td class="td_text"><img src="images/pwd3.png" id="rimg_pwd"></td>
    		<td class="td_input"><input type="password" required name="rnew_UserPwd" id="rnew_UserPwd"></td>
       		<td id="rnewpw">新密码</td>
       	</tr>
       	<tr>
       		<td colspan="3">
       			<input type="button" value="更改" id="genggai">
       		</td>
       	</tr>
       	<tr>
       		<td colspan="3" >
       			<a id="index" href="management.jsp">返回主页</a>
       		</td>
       	</tr>
  	
    </table>
   </form>
   <script language="javascript" type="text/javascript">
   		$(function(){
   			var f=1;
	 
			$("#img_pwd").mouseenter(function(){
				$(this).attr("src","images/pwd4.png")
			}).mouseleave(function(){
				$(this).attr("src","images/pwd3.png")
			})
			
			$("#old_img_pwd").mouseenter(function(){
				$(this).attr("src","images/pwd4.png")
			}).mouseleave(function(){
				$(this).attr("src","images/pwd3.png")
			})
			
			$("#rnew_UserPwd").mouseenter(function(){
				$(this).attr("src","images/pwd4.png")
			}).mouseleave(function(){
				$(this).attr("src","images/pwd3.png")
			})
			
			$("input").click(function(){
				$("#info").hide();
			})
			$("input").click(function(){
				$("#infos").hide();
			})
			
			$("#rnew_UserPwd").blur(function(){
				var pw = $("#rnew_UserPwd").val();
				var rpw =  $("#new_UserPwd").val();
				
				if(pw!=rpw){
					$("#newpw").html("两次密码不一致");
					f=0;
				}
				else{
					f=1;
				}
			});
			$("#genggai").click(function(){
				if(f==1){
				$("form").submit();
				}
				else{
					alert("请核对信息是否正确");
				}
			});
   			
   		
   		
   		
   		});
   		
   
   
	
	</script>
  </body>
</html>
