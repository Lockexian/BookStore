<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加书籍商品</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  	<script language="javascript" type="text/javascript" src="jquery-3.1.1.min.js"></script>
  	<script type="text/javascript" src="jedate/jedate.js"></script>
  <style>
  	body{
  		text-align:center;
  	}
  	#table1{
		
		margin:200px auto 0px auto;
		height:400px;
		top:100px;
		width:400px;
		border:1px #ccc solid;
	}
	#table2{
		
		margin:0px auto 0px auto;
		height:80px;
		top:100px;
		width:400px;
		border:1px #ccc solid;
	}
	td{
		border:1px #ccc solid;
	}
	
	.tewidth{
		width:90px;
	}
	
	.datainp{ width:200px; height:30px; border:1px #ccc solid;}
	.datep{ margin-bottom:40px;}
	
  </style>
  </head>
  <body>
  	<form action="/webbookshop/addbook" method="post"  name="form1" id="form1">
    	<table id ="table1">
    		
    		<tr>
    			<td colspan="3" align="right">
					<c:if test="${usernameadmin!=null}">
	  					<span id="hello">欢迎您，${usernameadmin}</span> &nbsp; &nbsp; &nbsp;
	  					<a href="/webbookshop/Adminlogout"> &nbsp;退出 &nbsp;</a>
	  					&nbsp; &nbsp; &nbsp;
	  					<a href="management.jsp"> &nbsp;回首页&nbsp;</a>
	  				</c:if>
				</td>
    		</tr>
    		<tr>
    			<td class="tewidth">
    				书的种类
    			</td>
    			<td>
    				<select name="type">
    					<optgroup label="*****文艺*****"></optgroup>
    					<option value="101">小说</option>
						<option value="102">文学</option>
						<option value="103">传记</option>
						<option value="104">青春文学</option>
						<option value="105">动漫</option>
						<option value="106">艺术</option>
						<option value="107">摄影</option>
						<option value="108">书法</option>
						<option value="109">音乐</option>
						<option value="110">绘画</option>
						<option value="111">偶像</option>
						<optgroup label="*****人文社科*****"></optgroup>
						<option value="201">宗教哲学</option>
						<option value="202">历史</option>
						<option value="203">政治军事</option>
						<option value="204">文化</option>
						<option value="205">社会科学</option>
						<option value="206">心理学</option>
						<option value="207">古籍</option>
						<option value="208">法律</option>
						<optgroup label="*****童书*****"></optgroup>
						<option value="301">中国儿童文学</option>
						<option value="302">外国儿童文学</option>
						<option value="303">政治军事</option>
						<option value="304">精装图书</option>
						<option value="305">平装图画书</option>
						<option value="306">科普百科</option>
						<option value="307">婴儿读物</option>
						<option value="309">幼儿启蒙</option>
						<option value="310">益智游戏</option>
						<option value="311">玩具书</option>
						<optgroup label="*****经管*****"></optgroup>
						<option value="401">经济</option>
						<option value="402">管理</option>
						<option value="403">投资理财</option>
						<option value="404">股票</option>
						<option value="405">金融</option>
						<option value="406">市场营销</option>
						<option value="407">会计</option>
						<option value="408">互联网</option>
						<optgroup label="*****励志*****"></optgroup>
						<option value="501">励志成功</option>
						<option value="502">心灵修养</option>
						<option value="503">职场</option>
						<optgroup label="*****教育*****"></optgroup>
						<option value="601">中小学教辅</option>
						<option value="602">考试</option>
						<option value="603">大中专教材</option>
						<option value="604">外语</option>
						<option value="605">工具书</option>
						<option value="606">教师用书</option>
						<optgroup label="*****科技*****"></optgroup>
						<option value="701">科普实物</option>
						<option value="702">计算机网络</option>
						<option value="703">医学</option>
						<option value="704">工业技术</option>
						<option value="705">建筑</option>
						<option value="706">自然科学</option>
						<option value="707">农林</option>
						<optgroup label="*****生活*****"></optgroup>
						<option value="801">两性</option>
						<option value="802">孕期</option>
						<option value="803">亲子家教</option>
						<option value="804">保健运动</option>
						<option value="805">旅游</option>
						<option value="806">美食</option>
						<option value="807">美妆</option>
						<option value="808">家庭家具</option>
    				</select>
    			</td>
    		</tr>
    		<tr>
    			<td>
    				书籍名称
    			</td>
    			<td>
    				<input type="text" name="bookname">
    			</td>
    			
    		</tr>
    		
    		<tr>
    			<td>
    				ISBN
    			</td>
    			<td>
    				<input type="text" name="ISBN">
    			</td>
    		</tr>
    		
    		
    		
    		<tr>
    			<td>
    				出版社
    			</td>
    			<td>
    				<input type="text" name="publisher">
    			</td>
    		</tr>
  		
    		<tr>
    			<td>
    				作者
    			</td>
    			<td>
    				<input type="text" name="author">
    			</td>
    		</tr>
    		
    		
    		
    		<tr>
    			<td>
    				出版日期
    			</td>
    			<td>
    				<div style="width:100%;height:30px;">
						<p class="datep"><input class="datainp" id="dateinfo" type="text" placeholder="请选择"  readonly name="publishdata"></p>
					</div>
    			</td>
    		</tr>
    		<tr>
	   			<td>
	   				页数
	   			</td>
	   			<td>
	   				<input type="text" name="pagenum">
	   			</td>
	   		</tr>
	   		
   			<tr>
	   			<td>
	   				销售价格
	   			</td>
	   			<td>
	   				<input type="text" name="saleprice">
	   			</td>
	   		</tr>
	   		
	   		<tr>
	   			<td>
	   				采购价格
	   			</td>
	   			<td>
	   				<input type="text" name="storeprice">
	   			</td>
	   		</tr>
	   		
	   		<tr>
	   			<td>
	   				库存数量
	   			</td>
	   			<td>
	   				<input type="text" name="storecount">
	   			</td>
	   		</tr>
	   		
	   		<tr>
	   			<td>
	   				商品简介
	   			</td>
	   			<td>
	   				<textarea name="content"></textarea>
	   			</td>
	   		</tr>
	   	</table>	
	   </form>
	   <form action="/webbookshop/Saveimgcervlet" method="post" enctype="multipart/form-data" name="form2" id="form2">
		   	<table id ="table2">
		   		<tr>
		   			<td class="tewidth">
		   				商品图片
		   			</td>
		   			<td>
		   				<input type="file" name="imagefile" >
		   			</td>
		   		</tr>
		   		
		   		<tr>
		   			<td colspan="2">
		   				<input type="button" value="添加商品" id="sub">
		   			</td>   			
		   		</tr>
	    	</table>
    	</form>
    	
    	
    	
    	
    	
    	<script type="text/javascript" language="javascript">
			$(function(){
			
				$("#sub").click(function(){
				alert();
					$.post("/webbookshop/addbook",$("#form1").serializeArray(),function(){},"html");
				alert();
				
					$("#form2").submit();
				});
			});
				
				
				
				
				
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
