<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ubookdetail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<script type="text/javascript" src="jedate/jedate.js"></script>
  <style type="text/css">
  	table{
  		margin: 200px auto;
  	}
  	
  
  </style>
  </head>
  
  
  
  <body>
  	<form action="/webbookshop/Ubookdetail" method="post">
   		<table>
   			
   		
   		
   			<tr>
   				<td>
   					
   					<input type="hidden" value="update" name="update">			
   					<input type="hidden" value="${book.bookid}" name="bookid">			
   					<input type="text" value="${book.bookname}" name="bookname">			
   				</td>
   			</tr>
   			<tr>
   				<td>
   					<input type="text" value="${book.ISBN}" name="ISBN">			
   				</td>
   			</tr>
   			<tr>
   				<td>
   					<input type="text" value="${book.publisher}" name="publisher">			
   				</td>
   			</tr>
   			<tr>
   				<td>
   					<input type="text" value="${book.author}" name="author">			
   				</td>
   			</tr>
   			<tr>
   				<td>
   					<input type="text" value="${book.pagenum}" name="pagenum">			
   				</td>
   			</tr>
   			<tr>
   				<td>
   					<input type="text" value="${book.saleprice}" name="saleprice">			
   				</td>
   			</tr>
   			<tr>
   				<td>
   					<input type="text" value="${book.content}" name="content">			
   				</td>
   			</tr>
   			<tr>
   				<td>
   					<input type="text" value="${book.storecount}" name="storecount">			
   				</td>
   			</tr>			
   			<tr>
   				<td>
   					 <input type ="submit" value="更改">&nbsp;&nbsp;<a href="management.jsp">返回主页</a>
   				</td>
   			</tr>
   		</table>
   	</form>
   	<script type="text/javascript" language="javascript">			
				
		    //jeDate.skin('gray');
			
		    jeDate({
				dateCell:"#dateinfo",
				format:"YYYY-MM-DD hh:mm:ss",
				isinitVal:true,
				isTime:true, //isClear:false,
				minDate:"2014-09-19 00:00:00",
				okfun:function(val){alert(val)}
			});

			
			
			
			
		</script>
  </body>
</html>
