<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商品详情</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style>
		
		
		*{ margin:0; padding:0; list-style:none;color:white;}
		body{
			text-align:center;
		}
		
		table{
			width:1000px;
			height:600px;
			border:1px;
			margin:0 auto;
			background-image: url(images/black_touming.png);
		}
		#tr0{
			height:50px;
		}
		#tr1{
			height:80px;
			text-align:center;
		}
		#hello{
			color:white;
		}
		#type{
			width:25%;
		}
		#sousuo{
			width:500px;
			height:43px;
			color:black;
			margin:0px;
			border:2px solid #F10215;
			font-size:1.1em;
		}
		#ok{
			width:43px;
			height:43px;
			margin:0 0 0 -4px;
			background:url(images/sousuo2.png);
			border:0px
	
		}
		#link{
			text-align:right;
		}
		
		#div1{
			position:absolute;
			width:160px; 
			top:200px;
			margin:10px;
			
			
		}
		#p{
			width:160px;
			height:40px;
			
			color:white;
			background:#358000;
			
		}
		ul{
			width:160px;
			
			position:absolute;
			background-image: url(images/35CC00.png);
		}
		li{
			height:30px;
			position:relative;
			text-align:center;
		}
		dl{
			position:absolute;
			left:0;
			top:0;
			left:160px;
			width:130px;
			
			display:none;
			
			background-image: url(images/green_touming.png);
		}
		dd{
			text-align:center;
			padding-left:10px;
			height:30px; 
			line-height:30px; 
		}
		dl dd:hover{
 			background-image: url(images/red_touming2.png);
 			font-size:1.2em;
 		}
		li:hover{ 
			
			background-image: url(images/green_touming.png);
			
		}
		.img_book{
			height:150px;
			width:150px;
		}
		
		.div1{
			width:175px;
			float:left;
			height:255px;
			position:relative;
			
			
		}
		.div2{
			width:175px;
			float:left;
			height:255px;
			position:relative;
			
			
			
		}
		.div1 div,.div2 div{
			color:white;
		}  
	
		#td_img{
			width:400px;
			height:500px;
			text-align:center;
		}
		img{
			height:400px;
			width:300px;
		}
		#id_info{
			text-align:center;
			padding:10px;
			
		}
		#bookname{
			color:white;
			font-size:2.0em;
		}
		#author{
			color:yellow;
		}
		#price{
			color:red;
			font-size:1.5em;	
		}
		#number{
			
			width:45px;
			font-size:1.5em;
			color:black;
		}
		#buy{
			height:32px;
			background:red;
			border:0;
			font-size:1.1em;
		}
	</style>
	<script src="jquery-3.1.1.min.js"></script>
  </head>
  
  <body background="images/book.jpg">
  <form>
    <table border="1px">
    	<tr id="tr0">
  			<td colspan="3" id="link">
  				<c:if test="${username1!=null}">
  					<span id="hello">欢迎您，<a href="/webbookshop/updateuser">${username1}</a>&nbsp;&nbsp;&nbsp;&nbsp;</span>
  					<a href="/webbookshop/logout">退出</a>
  					<a href="shoppingcart.jsp">我的购物车</a>
  					<a href="#">我的订单</a>
  				</c:if>
  				<c:if test="${username1==null}">
  					<a href="login.jsp">登录</a>
  					<a href="register.jsp">注册</a>
  					<a href="login.jsp">我的购物车</a>
  					<a href="login.jsp">我的订单</a>
  				</c:if>
  			</td>
  		</tr>
  		<tr id="tr1">
  			<td colspan="3" >
  				<input type="search" name="sousuo" id="sousuo" placeholder="龙族">
  				<input type="button" name="ok" id="ok" >

  				
  			</td>
  		</tr>
  		
    	<tr>
    		<td id="type" rowspan="3"><div id="div1">
  				
  				<h2><p id="p">&nbsp;全部书籍分类&nbsp;</p></h2>
  				<ul class="listUl">
  					<li id="li1"><h3><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("小说","UTF-8") %>">文艺</a></h3>
  						<dl class="dl1">
  							<dd class="add"><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("小说","UTF-8") %>">小说</a></dd>
		  					<dd class="add"><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("文学","UTF-8") %>">文学</a></dd>
		  					<dd class="add"><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("传记","UTF-8") %>">传记</a></dd>
							<dd class="add"><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("青春文学","UTF-8") %>">青春文学</a></dd>
							<dd class="add"><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("动漫","UTF-8") %>">动漫</a></dd>
							<dd class="add"><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("艺术","UTF-8") %>">艺术</a></dd>
							<dd class="add"><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("摄影","UTF-8") %>">摄影</a></dd>
							<dd class="add"><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("书法","UTF-8") %>">书法</a></dd>
							<dd class="add"><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("音乐","UTF-8") %>">音乐</a></dd>
							<dd class="add"><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("绘画","UTF-8") %>">绘画</a></dd>
							<dd class="add"><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("偶像","UTF-8") %>">偶像</a></dd>
  						</dl>
  					</li>
  					
  					<li  id="li2"><h3><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("小说","UTF-8") %>">人文社科</a></h3>
  						<dl class="dl2">
  							<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("宗教哲学","UTF-8") %>">宗教哲学</a></dd>
		  					<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("历史","UTF-8") %>">历史</a></dd>
		  					<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("政治军事","UTF-8") %>">政治军事</a></dd>
							<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("文化","UTF-8") %>">文化</a></dd>
							<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("社会科学","UTF-8") %>">社会科学</a></dd>
							<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("心理学","UTF-8") %>">心理学</a></dd>
							<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("古籍","UTF-8") %>">古籍</a></dd>
							<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("法律","UTF-8") %>">法律</a></dd>
							
							
  						</dl>
  					</li>
  					
  					<li id="li3"><h3><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("小说","UTF-8") %>">童书</a></h3>
  						<dl class="dl3">
  							<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("中国儿童文学","UTF-8") %>">中国儿童文学</a></dd>
		  					<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("外国儿童文学","UTF-8") %>">外国儿童文学</a></dd>
		  					<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("政治军事","UTF-8") %>">政治军事</a></dd>
							<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("精装图书","UTF-8") %>">精装图书</a></dd>
							<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("平装图书","UTF-8") %>">平装图画书</a></dd>
							<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("科普百科","UTF-8") %>">科普百科</a></dd>
							<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("婴儿读物","UTF-8") %>">婴儿读物</a></dd>
							<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("幼儿启蒙","UTF-8") %>">幼儿启蒙</a></dd>
							<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("益智游戏","UTF-8") %>">益智游戏</a></dd>
							<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("玩具书","UTF-8") %>">玩具书</a></dd>
						
		  					
  						</dl>
  					</li>
  					<li id="li4"><h3><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("小说","UTF-8") %>">经管</a></h3>
  						<dl class="dl4">
  							<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("经济","UTF-8") %>">经济</a></dd>
		  					<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("管理","UTF-8") %>">管理</a></dd>
		  					<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("投资理财","UTF-8") %>">投资理财</a></dd>
							<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("股票","UTF-8") %>">股票</a></dd>
							<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("金融","UTF-8") %>">金融</a></dd>
							<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("市场营销","UTF-8") %>">市场营销</a></dd>
							<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("会计","UTF-8") %>">会计</a></dd>
							<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("互联网","UTF-8") %>">互联网</a></dd>
		
		  					
  						</dl>
  					</li>
  					<li id="li5"><h3><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("小说","UTF-8") %>">励志</a></h3>
  						<dl class="dl5">
  							<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("励志成功","UTF-8") %>">励志成功</a></dd>
		  					<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("心灵修养","UTF-8") %>">心灵修养</a></dd>
		  					<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("职场","UTF-8") %>">职场</a></dd>
  						</dl>
  					</li>
  					<li id="li6"><h3><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("小说","UTF-8") %>">教育</a></h3>
  						<dl class="dl6">
  							<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("中小学教辅","UTF-8") %>">中小学教辅</a></dd>
		  					<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("考试","UTF-8") %>">考试</a></dd>
		  					<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("大中专教材","UTF-8") %>">大中专教材</a></dd>
		  					<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("外语","UTF-8") %>">外语</a></dd>
		  					<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("工具书","UTF-8") %>">工具书</a></dd>
		  					<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("教师用书","UTF-8") %>">教师用书</a></dd>
		  					
  						</dl>
  					</li>
  					<li id="li7"><h3><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("小说","UTF-8") %>">科技</a></h3>
  						<dl class="dl7">
  							<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("科普实物","UTF-8") %>">科普实物</a></dd>
		  					<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("计算机网络","UTF-8") %>">计算机网络</a></dd>
		  					<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("医学","UTF-8") %>">医学</a></dd>
		  					<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("工业技术","UTF-8") %>">工业技术</a></dd>
		  					<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("建筑","UTF-8") %>">建筑</a></dd>
		  					<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("自然科学","UTF-8") %>">自然科学</a></dd>
		  					<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("农业林业","UTF-8") %>">农业林业</a></dd>
		  					
  						</dl>
  					</li>
  					<li id="li8"><h3><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("小说","UTF-8") %>">生活</a></h3>
  						<dl class="dl8">
  							<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("两性","UTF-8") %>">两性</a></dd>
		  					<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("孕期","UTF-8") %>">孕期</a></dd>
		  					<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("亲子家教","UTF-8") %>">亲子家教</a></dd>
		  					<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("保健运动","UTF-8") %>">保健运动</a></dd>
		  					<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("旅游","UTF-8") %>">旅游</a></dd>
		  					<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("美食","UTF-8") %>">美食</a></dd>
		  					<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("美妆","UTF-8") %>">美妆</a></dd>
		  					<dd><a href="/webbookshop/searchbook?type=<%=java.net.URLEncoder.encode("家庭家具","UTF-8") %>">家庭家具</a></dd>
  						</dl>
  					</li>
  				</ul>	</div>
  			</td>
    		<td id="td_img">
    			<img src="${book.imageFile}">
    		</td>
    		<td id="id_info">
    			<input type="hidden" id="bookid" value="${book.bookid}">
    			<span id="bookname">${book.bookname}</span>
    			<br><br>
    			<span id="author">${book.author} 著</span>
    			<br><br>
    			售价<span id="price">￥${book.saleprice}</span>
    			<br><br>
    			<input type="number" id="number" max="${book.storecount}" min="1" value ="1"/>
    			<input type="button" value="加入购物车" id="buy"><c:if test="${isexited !=null}"><span>购物车中已存在</span></c:if>
    		</td>
    	</tr>
    	<tr>
    		<td>${book.publisher}
    			<br>
    			ISBN:${book.ISBN}
    		</td>
    		<td>出版日期：${book.publishdata}
    			<br>
    			页数：${book.pagenum}
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			${book.content}
			
    		</td>
    		
    	</tr>
    </table>
    </form>
    <script language="javascript" type="text/javascript">
  	
  	$(function(){
  		//如果未登录
		/*if( session.getAttribute("username").equals("")){
			$("#hello").hide();
		}*/
  		////点击后判断ul是否隐藏
  		
  		$("#p").click(function(){
		var ul = $(".listUl");
		if(ul.css("display")=="none"){
			ul.slideDown(200);
		}else{
			ul.slideUp(200);
		}
		});
  		//鼠标悬停显示二级导航栏目
  		
  		$("#li1").hover(
  			function(){
  				$(".dl1").show();
  			},
  			function(){
  				$(".dl1").hide();
  			}
  		);
  		
  		$("#li2").hover(
  			function(){
  				$(".dl2").show();
  			},
  			function(){
  				$(".dl2").hide();
  			}
  		);
  		$("#li3").hover(
  			function(){
  				$(".dl3").show();
  			},
  			function(){
  				$(".dl3").hide();
  			}
  		);
  		
  		$("#li4").hover(
  			function(){
  				$(".dl4").show();
  			},
  			function(){
  				$(".dl4").hide();
  			}
  		);
  		$("#li5").hover(
  			function(){
  				$(".dl5").show();
  			},
  			function(){
  				$(".dl5").hide();
  			}
  		);
  		
  		$("#li6").hover(
  			function(){
  				$(".dl6").show();
  			},
  			function(){
  				$(".dl6").hide();
  			}
  		);
  		$("#li7").hover(
  			function(){
  				$(".dl7").show();
  			},
  			function(){
  				$(".dl7").hide();
  			}
  		);
  		
  		$("#li8").hover(
  			function(){
  				$(".dl8").show();
  			},
  			function(){
  				$(".dl8").hide();
  			}
  		);
  		$("#buy").click(function(){
  		
  			var bookid = $("#bookid").val();
  			var count =$("#number").val();
  			window.location.href="/webbookshop/Basketservlet?bookid="+bookid+"&count="+count+"&baskettype=add";	
  		});
  		
  		
  	});		
  	
  	</script>
  </body>
</html>
