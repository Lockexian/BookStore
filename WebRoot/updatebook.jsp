<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updatebook.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<style type="text/css">
		
		table{
			text-align:center;	
			margin: 10px auto;
			border:1px solid #000000;
			
		}
		td{
		border:1px solid #000000;
		}
		.first{
			height:50px;
		
		}
		.next{
			height:100px;
		
		}
	
	</style>

  </head>
  
  <body>
  <form action="/webbookshop/Updatebookinfo" method="post">
  	<table >
  	<tr > 
  	<td><a href="management.jsp"></a></td>
  		<td colspan="12" class="first">
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
    				<input type="submit" value="查找">
  		</td>
  	
  	</tr>
  	<tr class="next">
	  		<td>书名</td>
	  		<td>ISBN</td>
	  		<td>出版社</td>
	  		<td>作者</td>
	  		<td>出版日期</td>
	  		<td>页数</td>
	  		<td>单价</td>
	  		<td>简介</td>
	  		<td>库存</td>
	  		<td>操作</td>	  	
	  		</tr>
  		<c:forEach items="${books}" var="book">
  			
	  		<tr class="next">
	  		<td>书名：${book.bookname}</td>
	  		<td>ISBN：${book.ISBN}</td>
	  		<td>出版社：${book.publisher}</td>
	  		<td>作者：${book.author}</td>
	  		<td>出版日期：${book.publishdata}</td>
	  		<td>页数：${book.pagenum}</td>
	  		<td>￥${book.saleprice}</td>
	  		<td>简介：${book.content}</td>
	  		<td>库存：${book.storecount}</td>
	  		<td><a href="/webbookshop/Ubookdetail?bookid=${book.bookid}">修改</a></td>	  	
	  		</tr>
	  	</c:forEach>
  		<c:if test="${books != null}">
  		<tr>
  			<td colspan="13">
  			<c:if test="${pagetype!=null}">
	    			<div id = "div_3">  	
			    		<a class="page" href="/webbookshop/Updatebookinfo?type=${sessionScope.pagetype}&pagenum=1">首页 </a>&nbsp;
			    		<c:if test="${pnum-2>0}">
			    			<a  class="page" href="/webbookshop/Updatebookinfo?type=${sessionScope.pagetype}&pagenum=${pnum-2}">${pnum-2} </a>&nbsp;
			    		</c:if>
			    		
			    		<c:if test="${pnum-1>0}">
			    			<a class="page" href="/webbookshop/Updatebookinfo?type=${sessionScope.pagetype}&pagenum=${pnum-1} "> ${pnum-1} </a>&nbsp;
			    		</c:if>
			    		<a class="page" href="/webbookshop/Updatebookinfo?type=${sessionScope.pagetype}&pagenum=${pnum}">${pnum}</a>&nbsp;
			    		
			    		<c:if test="${pnum+1 <=allpage}">
			    			<a class="page" href="/webbookshop/Updatebookinfo?type=${sessionScope.pagetype}&pagenum=${pnum+1}">${pnum+1} </a>&nbsp;
			    		</c:if>
			    		<c:if test="${pnum+2 <=allpage}">
			    			<a class="page" href="/webbookshop/Updatebookinfo?type=${sessionScope.pagetype}&pagenum=${pnum+2}">${pnum+2} </a>&nbsp;
			    		</c:if>
			    		<a class="page" href="/webbookshop/Updatebookinfo?type=${sessionScope.pagetype}&pagenum=${allpage}">尾页 </a>
					</div>
				</c:if>
  			</td>
  		
  		</tr>
  		</c:if>	
  	</table>
</form>
  </body>
</html>
