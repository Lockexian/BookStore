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
    
    <title>购物车</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="jquery-3.1.1.min.js"></script>
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
			
		}
		#tr0{
			height:50px;
		}
		#tr1{
			height:50px;
		}
		.tr2{
			height:100px;
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
		.button{
			border:0 solid red;
			background:red;
		}
		
	</style>

  </head>
  
  <body background="images/212261.jpg">
  <form name="form1" action="/webbookshop/Basketservlet" mothed="post">
    <table border="1px">
  		<tr id="tr0">
  			<td id ="index">主页</td>
  			<td colspan="6" id="link">
  				
  				<c:if test="${username1!=null}">
  				<input type = "hidden" id = "f" name="f" value=""/>
  					<span id="hello">欢迎您，${username1}&nbsp;&nbsp;&nbsp;&nbsp;</span>
  					<span id="logout">退出</span>
  					<span id ="order">我的订单</span>
  				</c:if>
  				<c:if test="${username1==null}">
  					<a href="login.jsp">登录</a>
  					<a href="register.jsp">注册</a>
  				</c:if>
  			</td>
  		</tr>
  		<tr id="tr1">
  			<td>全选</td>
  			<td>商品图片</td>
  			<td>商品简介</td>
  			
  			<td>单价</td>
  			<td>数量</td>
  			<td>金额</td>
  			<td>操作</td>
  		</tr>
  		
  		
  		<c:forEach items="${basketlist}" var="basketinfo" varStatus="status">
  		<tr class="tr2"  id="tr${status.index}">
  			<td>
  				<input type="checkbox" id = "cb${status.index}" />
  				
  				<input type="hidden" name = "select${status.index}" id="select${status.index}" value="0" />
  				
  				<input type="hidden" name = "bookid${status.index}" id="bookid${status.index}" value = "${basketinfo.bookid}" />
  			</td>
  			<td>
  				<img src="${basketinfo.imageFile}" class="book_img">
  			</td>
  			<td>${basketinfo.bookname}&nbsp;著<br/>
  				${basketinfo.publisher}<br/>
  				${basketinfo.author}<br/>
  			</td>
  			<td id="tdprice${status.index}">${basketinfo.saleprice}</td>
  			<td>	
  				<input type="number" name = "bcount${status.index}" id="bcount${status.index}" class="count" max = "${basketinfo.storecount}" min="1" value="${basketinfo.ordercount}">
  			</td>
  			<td id="m${status.index}">${basketinfo.saleprice * basketinfo.ordercount}</td>
  		
  			<td><input type = "button" id="delete${status.index}" value="删除" class="button"/></td>
  		</tr>
  	</c:forEach>
  		<tr>
  		<td>
  				<input type="checkbox" id="selectall"/>全选
  		</td>
  		<td><input type = "button" value="删除" id="delectall" class="button"></td>
  		<td></td>
  		<td></td>
  		<td></td>
  		<td></td>
  		<td><input type = "button" value="结算" id="jiesuan" class="button"></td>
  		
  		</tr>
  	</table>
  	</form>

  	<script language="javascript" type="text/javascript">	
  	$(function(){
	  	$("#bcount0").change(function(){
	  	 	 var tdprice0 =  $("#tdprice0").html();
	  		 var bcount0  = $("#bcount0").val();
	  		 var m = tdprice0*bcount0;
	  		 $("#m0").html(m);
	  	 });
	  	$("#bcount1").change(function(){
	  	 	 var tdprice0 =  $("#tdprice1").html();
	  		 var bcount0  = $("#bcount1").val();
	  		 var m = tdprice0*bcount0;
	  		 $("#m1").html(m);
	  	 });
	  	 $("#bcount2").change(function(){
	  	 	 var tdprice0 =  $("#tdprice2").html();
	  		 var bcount0  = $("#bcount2").val();
	  		 var m = tdprice0*bcount0;
	  		 $("#m2").html(m);
	  	 });
  		$("#bcount3").change(function(){
	  	 	 var tdprice0 =  $("#tdprice3").html();
	  		 var bcount0  = $("#bcount3").val();
	  		 var m = tdprice0*bcount0;
	  		 $("#m3").html(m);
	  	 });
	 	$("#bcount4").change(function(){
	  	 	 var tdprice0 =  $("#tdprice4").html();
	  		 var bcount0  = $("#bcount4").val();
	  		 var m = tdprice0*bcount0;
	  		 $("#m4").html(m);
	  	 });
	  	 
	  	
	  	 
	  	 $("#cb0").click(function(){
	  	 
	  	 	 if($("#cb0").is(':checked')){
	  	 	 	$("#select0").val("1");
	  	 	 }
	  	 	 else{
	  	 	 $("#select0").val("0");
	  	 	 }
	  	
	  	 });
	  	 $("#cb1").click(function(){
	  	 	 if($("#cb1").is(':checked')){
	  	 	 	$("#select1").val("1");
	  	 	 }
	  	 	 else{
	  	 	 $("#select1").val("0");
	  	 	 }
	  	 
	  	 });
		 $("#cb2").click(function(){
	  	 	 if($("#cb2").is(':checked')){
	  	 	 	$("#select2").val("1");
	  	 	 }
	  	 	 else{
	  	 	 $("#select2").val("0");
	  	 	 }
	  	 
	  	 });  	 
	 	 $("#cb3").click(function(){
	  	 	 if($("#cb3").is(':checked')){
	  	 	 	$("#select3").val("1");
	  	 	 }
	  	 	 else{
	  	 	 $("#select3").val("0");
	  	 	 }
	  	 
	  	 }); 	 
	 	 $("#cb4").click(function(){
	  	 	 if($("#cb4").is(':checked')){
	  	 	 	$("#select4").val("1");
	  	 	 }
	  	 	 else{
	  	 	 $("#select4").val("0");
	  	 	 }
	  	 
	  	 }); 	 
	  	 
	  	$("#delete0").click(function(){
	  		$.get("/webbookshop/Basketservlet",{baskettype:"delete",bookid:$("#bookid0").val()},function(){
	  		
	  		$("form").submit();
	  		},"html"); 	
	  		});
	  	$("#delete1").click(function(){
	  		$.get("/webbookshop/Basketservlet?baskettype=delete",{"bookid":$("#bookid1").val()},function(){
	  
	  		$("form").submit();
	  		},"html"); 	
	  	});	
		$("#delete2").click(function(){
	  		$.get("/webbookshop/Basketservlet?baskettype=delete",{"bookid":$("#bookid2").val()},function(){
	  
	  		$("form").submit();
	  		},"html"); 	
	  	});  		
		$("#delete3").click(function(){
	  		$.get("/webbookshop/Basketservlet?baskettype=delete",{"bookid":$("#bookid3").val()},function(){
	  	
	  		$("form").submit();
	  		},"html"); 	
	  		});  		
	  	$("#delete4").click(function(){
	  		$.get("/webbookshop/Basketservlet?baskettype=delete",{"bookid":$("#bookid4").val()},function(){
	  	
	  		$("form").submit();
	  		},"html"); 	
	  		});		
	  		
	  	
	  	$("#delectall").click(function(){
	  		$.post("/webbookshop/Basketservlet?baskettype=deleteall",$("form").serializeArray(),function(){
	  		$("form").submit();
	  		},"html"); 	
	  		});
	  		
	  		
	  	$("#index").click(function(){
	  		$.post("/webbookshop/Basketservlet?baskettype=update",$("form").serializeArray(),function(){
	  		$("#f").val("index");
	  		$("form").submit();	},"html");
	  		}).hover(function(){$("#index").css("color","red")},function(){$("#index").css("color","white")});	
		$("#hello").click(function(){
	  		$.post("/webbookshop/Basketservlet?baskettype=update",$("form").serializeArray(),function(){
		 	$("#f").val("hello");
		  	$("form").submit();	},"html");
		  	}).hover(function(){$("#hello").css("color","red")},function(){$("#hello").css("color","white")});  		
		$("#logout").click(function(){
	  		$.post("/webbookshop/Basketservlet?baskettype=update",$("form").serializeArray(),function(){
	  		  $("#f").val("logout");
	  		$("form").submit();	},"html");
	  		}).hover(function(){$("#logout").css("color","red")},function(){$("#logout").css("color","white")}); 
		$("#order").click(function(){
	  		$.post("/webbookshop/Basketservlet?baskettype=update",$("form").serializeArray(),function(){
	  	 	$("#f").val("order");
	  		$("form").submit();	},"html");
	  		}).hover(function(){$("#order").css("color","red")},function(){$("#order").css("color","white")});  	
	  	
	  	$("#jiesuan").click(function(){
	  		$.post("/webbookshop/Oriservler?f=add",$("form").serializeArray(),function(){
	  		$("#f").val("order");
	  		$("form").submit();},"html");    
	  	}); 	
	  	 
	  	 
	  	 		
  	 });
  	 
  	
  	</script>
  </body>
</html>
