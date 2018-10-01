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
    
    <title>订单</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style>
		*{ 
			margin:0; 
			padding:0; 	
			list-style:none;
			color:white;
		}
		a{
			color:white;
		}
		body{
			text-align:center;
		}
		
		table{
			width:1200px;
			
			border:1px;
			margin:0 auto;
			text-align:center;
			background-image: url(images/black_touming.png);
		}
		.tr0{
			height:50px;
		}
		.tr1{
			height:50px;
		}
		.tr2{
			height:50px;
			background:#AA0000;
		}
		.tr3{
			height:50px;
		}
		#hello{
			color:white;
		}
		#link{
			text-align:right;
		}
		.count{
			width:50px;
			color:black;
			font-size:1.1em;
		}
		.book_img{
			height:90px;
			width:90px;
		}
	</style>

  </head>
  
  <body background="images/212261.jpg">
    <table border="1px">
  		<tr id="tr0">
  			<td colspan="7" id="link">
  				<c:if test="${username1!=null}">
  					<span id="hello">欢迎您，${usernameadmin}&nbsp;&nbsp;&nbsp;&nbsp;</span>
  					<a href="/webbookshop/logout">退出</a>
  					<a href="/webbookshop/Adminlogout">主页</a>
  				</c:if>
  			</td>
  		</tr>
  		<tr class="tr1">
  			<td colspan="3">订单详情</td>
  			<td>金额</td>
  			<td>收货人</td>
  		</tr>
  		
  		<c:forEach items="${order}" var = "oitem" varStatus="status">
  		
	  		<tr class="tr2">
	  			<td >支付时间：【${oitem.ordertime}】</td>
	  			<td colspan="2">订单号：【${oitem.ordernumber}】</td>
	  			<td>￥总金额【${oitem.tamount}】</td>
	  			<td rowspan="${oitem.num  +1}">【${oitem.adress}】
	  							<br/>【${oitem.username}】
	  							<br/>【${oitem.tel}】
	  							<br/>【${oitem.orderstate}】
	  							<c:if test="${oitem.orderstate =='等待发货'}">
	  							<br/><a href = "/webbookshop/Addealorder?ordernumber=${oitem.ordernumber}&u=up">发货</a>
	  							</c:if>
	  			</td>
	  		</tr>
	  		<c:if test="${oitem.bookid1!=null}">
		  		<tr class="tr3">
		  			<td>
		  				<img src="${oitem.imagefile1}" class="book_img">
		  			</td>
		  			<td>${oitem.bookname1}</td>
		  			<td>	
		  				数量*${oitem.ordercount1}
		  			</td>
		  			
		  			<td>*${oitem.bookprice1 * oitem.ordercount1}</td>
		  			
		  		</tr>
	  		</c:if>	
	  			<c:if test="${oitem.bookid2!=null}">
		  		<tr class="tr3">
		  			<td>
		  				<img src="${oitem.imagefile2}" class="book_img">
		  			</td>
		  			<td>${oitem.bookname2}</td>
		  			<td>	
		  				数量*${oitem.ordercount2}
		  			</td>
		  			
		  			<td>*${oitem.bookprice2 * oitem.ordercount2}</td>
		  			
		  		</tr>
	  		</c:if>	
	  			<c:if test="${oitem.bookid3!=null}">
		  		<tr class="tr3">
		  			<td>
		  				<img src="${oitem.imagefile3}" class="book_img">
		  			</td>
		  			<td>${oitem.bookname3}</td>
		  			<td>	
		  				数量*${oitem.ordercount3}
		  			</td>
		  			
		  			<td>*${oitem.bookprice3 * oitem.ordercount3}</td>
		  			
		  		</tr>
	  		</c:if>	
	  			<c:if test="${oitem.bookid4!=null}">
		  		<tr class="tr3">
		  			<td>
		  				<img src="${oitem.imagefile4}" class="book_img">
		  			</td>
		  			<td>${oitem.bookname4}</td>
		  			<td>	
		  				数量*${oitem.ordercount4}
		  			</td>
		  			
		  			<td>*${oitem.bookprice4 * oitem.ordercount4}</td>
		  			
		  		</tr>
	  		</c:if>	
	  			<c:if test="${oitem.bookid5!=null}">
		  		<tr class="tr3">
		  			<td>
		  				<img src="${oitem.imagefile5}" class="book_img">
		  			</td>
		  			<td>${oitem.bookname5}</td>
		  			<td>	
		  				数量*${oitem.ordercount5}
		  			</td>
		  			
		  			<td>*${oitem.bookprice5 * oitem.ordercount5}</td>
		  			
		  		</tr>
	  		</c:if>	
	  	</c:forEach>	
  		
  	</table>
  </body>
</html>
