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
    
    <title>ebook用户注册</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" con1tent="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script language="javascript" type="text/javascript" src="jquery-3.1.1.min.js">
		
	</script>
	<style>
		.text{
			
			font-size:1.2em;
			width:100px;
		}
		.xinghao{
			color:red;
		}
		
		body{
			text-align:center;
			
		}
		table{
			margin:0 auto;
			height:400px;
			top:100px;
			width:450px;
			
			
		}
		td{
			text-align:left;
			
		}
		#td_sex{
			text-align:left;
		}
		td input{
			font-size:1.2em;
			
		}
		select{
			font-size:1.2em;
			
		}
		img{
			width:40%;
			margin:0 0 80px 0;
			
		}
		#tb_zhuce{
			text-align:center;
		}
		#t_UserName{
			color:gray;
		}
	</style>
	
  </head>
  
  <body background="images/beijing4.png">
  <img src="images/beijing3.png">
  <form action= "/webbookshop/updateuser" method="post">
    <table border="0px">
       	<tr>
    		<td class="text"><span class="xinghao">*</span>用户名</td>
    		<td><input required autofocus pattern="[A-Za-z1-9]{4,15}"  type="text"  id="t_UserName"  value="${user[0].username}" readonly="true" disabled>
    			<input name="t_UserName" type="hidden" value="${user[0].username}">
    		</td>
    		<td></td>
       	</tr>
       	<tr>
    		<td class="text"><span class="xinghao">*</span>用户密码</td>
    		<td><input required  type="password" pattern="[A-Za-z1-9]{6,15}" id="t_UserPwd" name="t_UserPwd" value="${user[0].pwd}"></td>
    		<td><span id="pwdinfo"></span></td>
       	</tr>
		<tr>
    		<td class="text"><span class="xinghao">*</span>确认密码</td>
    		<td><input required type="password" pattern="[A-Za-z1-9]{6,15}" id="t_UserPwd2" name="t_UserPwd2" value="${user[0].pwd}"></td>
    		<td><span id="pwdinfo2"></span></td>
       	</tr>
       	<tr>
    		<td class="text">&nbsp;性别</td>
    		<td id="td_sex">
    			<select name="t_Sex" >
    				<option value="nan">男</option>
    				<option value="nv" <c:if test="${user[0].sex=='nv'}">selected</c:if>>女</option>
    			</select>
    		</td>
    		<td></td>
       	</tr>
	    <tr>
    		<td class="text"><span class="xinghao">*</span>邮箱</td>
    		<td><input required type="text" id="t_Email" name="t_Email" value="${user[0].email}"></td>
    		<td><span id="emailinfo"></span></td>
       	</tr>
       	<tr>
    		<td class="text">&nbsp;地址</td>
    		<td><input type="text" name="t_Address" value="${user[0].address}"></td>
    		<td></td>
       	</tr>
       	<tr>
    		<td class="text"><span class="xinghao">*</span>手机号</td>
    		<td><input  type="text" required id="t_Telephone" name="t_Telephone" value="${user[0].telephone}"></td>
    		<td><span id="phoneinfo"></span></td>
       	</tr>
       	
       	<tr>
    		
    		<td colspan=3 id="tb_zhuce">
    			<input type="submit" id="zhuce" value="修改用户信息">		
    		</td>
    	
       	</tr>
       	
    </table>

   </form>
   <script language="javascript" type="text/javascript">
   		
   	
   		
   			
   		
   		
   		//密码长度
   		$("#t_UserPwd").blur(function(){
   			var pwdlen = $("#t_UserPwd").val();
   			if(pwdlen.length<6||pwdlen.length>15)
   				$("#pwdinfo").css("color","red");
   				
   			else
   				$("#pwdinfo").css("color","black");
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
   		
   		
   	
   		//邮箱正则匹配
   		$("#t_Email").blur(function(){
   			var email = $("#t_Email").val();
   			if(email.match("^[a-zA-Z][a-zA-Z0-9_\-]*@([a-zA-Z0-9]+\.)+[a-z]{2,3}$")){
   				$("#emailinfo").empty();
   				
   			}
   			else{
   				$("#emailinfo").css("color","red");
   				$("#emailinfo").empty();
   				$("#emailinfo").append("邮箱格式不对！");
   				
   			}
   		});
   		
   		//手机号匹配
   		$("#t_Telephone").blur(function(){
   			var phone = $("#t_Telephone").val();
   			if(phone.match("1[3,5,7,8]{1}[0-9]{1}[0-9]{8}")){
   				$("#phoneinfo").empty();
   			}
   			else{
   				
   				$("#phoneinfo").empty();
   				$("#phoneinfo").append("手机号格式不对！");
   				$("#phoneinfo").css("color","red");
   			}
   		});
   		
   		
   		
   		
   </script>
  </body>
</html>
