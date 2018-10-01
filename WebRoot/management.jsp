<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>后台管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="jquery-3.1.1.min.js"></script>
	<style>
		*{ margin:0; padding:0; list-style:none;}
		a{
			color:red;
		}
		body{
			text-align:center;
		}
		
		table{
			width:1000px;
			height:600px;
			border:1px;
			margin:0 auto;
			position:relative;
			top:100px;
			font-size:1.3em;
			padding:10px;
			
		}
		tr{
			height:200px;
			margin:10px;
		}
		#tr0{
			height:100px;
		}
		td{
			width:300px;
			padding:10px;
			margin:10px;
		}
		#td_red{
			background:red;
		}
		#td_green{
			background:#00BB00;
		}
		#td_blue{
			background:#00D8FF;
		}
		#td_yellow{
			background:yellow;
		}
		#td_0{
			background:#8000FF;
			width:200px;
		}
		
	</style>
  </head>
  
  <body>
		<table >
			<tr id="tr0">
				<td rowspan="3" id="td_0" >修改密码</td>
				<td colspan="2" align="right">
					<c:if test="${usernameadmin!=null}">
	  					<span id="hello">欢迎您，${usernameadmin}</span> &nbsp; &nbsp; &nbsp;
	  					<a href="/webbookshop/Adminlogout"> &nbsp;退出 &nbsp;</a>
	  				</c:if>
	  				<c:if test="${usernameadmin==null}">
	  					<a href ="admin.jsp">登录</a>		
	  				</c:if>
	  				
				</td>
			</tr>
			<tr>
				
				<td id="td_red">添加商品</td>
				<td id="td_green">修改商品信息</td>
			</tr>
			<tr>
				
				<td id="td_blue">处理订单</td>
				<td id="td_yellow">添加管理员</td>
			</tr>
		</table>
		<script type="text/javascript" >
		$(function(){

			$("#td_0").click(function(){		
				window.location.href="updataadpw.jsp";		
			});
		
			$("#td_yellow").click(function(){			
				window.location.href="addadmin.jsp";
			});
			$("#td_blue").click(function(){			
				window.location.href="/webbookshop/Addealorder";
			});
			$("#td_red").click(function(){
				window.location.href="/webbookshop/addbook.jsp";			
			});	
			$("#td_green").click(function(){
				window.location.href="/webbookshop/updatebook.jsp";			
			});
		
		});
		
			
			
			
		</script>
  </body>
</html>
