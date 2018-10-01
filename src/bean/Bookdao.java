package bean;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;



public class Bookdao {
	int numPerPage = 10;
	int startNum = 1;

	public ArrayList getBookByName(String bookname,int pageNo){
		ArrayList rst = new ArrayList();
		startNum = (pageNo - 1) * numPerPage;
		String sql = "select *  from books where bookname like \"%"+bookname+"%\" limit " + startNum + ","+ numPerPage;
		DBbean db = new DBbean();
		db.getConnection();
		
		try {
			ResultSet rs = db.executeQuery(sql, null);
			
			while (rs.next()) {
				Bookvo book = new Bookvo();
				book.setBookid(rs.getInt("bookid"));
				book.setTypeid(rs.getInt("typeid"));
				book.setBookname(rs.getString("bookname"));
				book.setISBN(rs.getString("ISBN"));
				book.setPublisher(rs.getString("publisher"));
				book.setAuthor(rs.getString("author"));
				book.setPublishdata(rs.getString("publishdata"));
				book.setPagenum(rs.getInt("pagenum"));
				book.setSaleprice(rs.getFloat("saleprice"));
				book.setStoreprice(rs.getFloat("storeprice"));
				book.setContent(rs.getString("content"));
				book.setBuycount(rs.getInt("buycount"));
				book.setStorecount(rs.getInt("storecount"));
				book.setImageFile(rs.getString("imagefile"));
							
				rst.add(book);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return rst;
	}
	
	public int pagenumByname(String bookname){
		int num=0;
		String sql = "select count(*)  from books where bookname like \"%"+bookname+"%\"";
		
		DBbean db = new DBbean();
		db.getConnection();
		
		try {
			ResultSet rs = db.executeQuery(sql, null);
			if(rs.next()){
				int pnum = rs.getInt(1);
				num = pnum/10;
				if(pnum%10!=0){
					num++;
				}
				
				db.close();
				return num;
			}
			else{
				db.close();
				return num;
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		db.close();
		return 0;
	}
	
	
	public ArrayList getBooksByPage(String type , int pageNo) {
		ArrayList<Bookvo> rst = new ArrayList<Bookvo>();

		startNum = (pageNo - 1) * numPerPage;
//		String sql = "select books.* from books,booktype limit " + startNum + ","
//				+ numPerPage+"  where books.typeid=booktype.typeid and booktype.typename=\""+type+"\"";
		//select books.* from books,booktype limit 1,2 where books.typeid=booktype.typeid and booktype.typename="小说"
		// select books.* from books INNER JOIN booktype on books.typeid=booktype.typeid limit 1,2 where booktype.typename="小说"
		//String sql ="select books.* from books INNER JOIN booktype on books.typeid=booktype.typeid limit "+startNum+","+numPerPage +"  where typename = '"+type+"';";
		String sql = "select books.* from books,booktype where books.typeid=booktype.typeid and typename=\""+type+"\" limit " + startNum + ","+ numPerPage;
		//System.out.println(sql);
		DBbean db = new DBbean();
		db.getConnection();
		ResultSet rs = null;
		try {
			rs = db.executeQuery(sql, null);

			while (rs.next()) {
				Bookvo book = new Bookvo();
				book.setBookid(rs.getInt("bookid"));
				book.setTypeid(rs.getInt("typeid"));
				book.setBookname(rs.getString("bookname"));
				book.setISBN(rs.getString("ISBN"));
				book.setPublisher(rs.getString("publisher"));
				book.setAuthor(rs.getString("author"));
				book.setPublishdata(rs.getString("publishdata"));
				book.setPagenum(rs.getInt("pagenum"));
				book.setSaleprice(rs.getFloat("saleprice"));
				book.setStoreprice(rs.getFloat("storeprice"));
				book.setContent(rs.getString("content"));
				book.setBuycount(rs.getInt("buycount"));
				book.setStorecount(rs.getInt("storecount"));
				book.setImageFile(rs.getString("imagefile"));
							
				rst.add(book);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return rst;
	}	
	
	public int getpagenum(String type){
		int Pagenum=0;
		String sql = "select count(*) from books,booktype where books.typeid=booktype.typeid and typename=\""+type+"\" ";
		//System.out.println(sql);
		
		DBbean db = new DBbean();
		db.getConnection();
		
		try {
			ResultSet rs = db.executeQuery(sql, null);
			
			while(rs.next()){
				int count = rs.getInt(1);
				Pagenum = count/10;
				int f = count%10;
				if(f!=0){
					Pagenum++;
				}
				//System.out.println(Pagenum);

			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return Pagenum;
	}
	
	
	
	public Bookvo getBook(String bookid) {
		Bookvo book = new Bookvo();		
		String sql = "select * from books where  bookid = "+bookid;
	
		DBbean db = new DBbean();
		db.getConnection();
		ResultSet rs = null;
		try {
			
			rs = db.executeQuery(sql, null);

			while (rs.next()) {
				book.setTypeid(rs.getInt("typeid"));
				book.setBookname(rs.getString("bookname"));
				book.setISBN(rs.getString("ISBN"));
				book.setPublisher(rs.getString("publisher"));
				book.setAuthor(rs.getString("author"));
				book.setPublishdata(rs.getString("publishdata"));
				book.setPagenum(rs.getInt("pagenum"));
				book.setSaleprice(rs.getFloat("saleprice"));
				book.setStoreprice(rs.getFloat("storeprice"));
				book.setContent(rs.getString("content"));
				book.setBuycount(rs.getInt("buycount"));
				book.setStorecount(rs.getInt("storecount"));
				book.setImageFile(rs.getString("imagefile"));
				
	
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		/*for(Bookvo book:rst){
			System.out.println(book.getBookname());
		}*/
		db.close();
		return book;
	}
	public boolean addBook(Bookvo book){

		DBbean db = new DBbean();
		db.getConnection();
		
		
		String sql = "insert into books (bookid,typeid,bookname,ISBN,publisher,author,publishdata,pagenum,saleprice,storeprice,content,buycount,storecount,imagefile) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		ArrayList params = new ArrayList();
	
		params.add(book.getBookid()+"");
		params.add(book.getTypeid()+"");
		params.add(book.getBookname());
		params.add(book.getISBN());
		params.add(book.getPublisher());
		params.add(book.getAuthor());
		params.add(book.getPublishdata());
		params.add(book.getPagenum()+"");
		params.add(book.getSaleprice()+"");
		params.add(book.getStoreprice()+"");
		params.add(book.getContent());
		params.add(book.getBuycount()+"");
		params.add(book.getStorecount()+"");
		params.add(book.getImageFile());
		
		
		
		try {
			db.executeUpdate(sql,params);
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
			db.close();
			
			return false;
		}
		db.close();

		return true;
	}
	public int getMaxBookId(){
		int bookid = 0;
		DBbean db = new DBbean();
		db.getConnection();
		String sql = "select max(bookid) from books";
		
		ResultSet rs = null;
		try {
			rs = db.executeQuery(sql, null);
			if(rs.next()){
				bookid = Integer.parseInt(rs.getString(1))+1;
			}	
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		db.close();
		return bookid;
	}
	public boolean updatebookinfo(Bookvo bv){
		
		String sql = "update books set bookname=\""+bv.getBookname()+"\", ISBN=\""+bv.getISBN()+"\" ,publisher=\""+bv.getPublisher()+"\" ,author=\""+bv.getAuthor()+"\" ,pagenum="+bv.getPagenum()+" ,saleprice="+bv.getSaleprice()+" ,content=\""+bv.getContent()+"\" ,storecount="+bv.getStorecount() +"where bookid="+bv.getBookid();
		System.out.println(sql);
		DBbean db = new DBbean();
		db.getConnection();
		
		try {
			db.executeUpdate(sql, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			db.close();
			e.printStackTrace();
			return false;
		}
		db.close();
		return true;	
	}
	
	public ArrayList getBooks(String type , int pageNo) {
		ArrayList<Bookvo> rst = new ArrayList<Bookvo>();

		startNum = (pageNo - 1) * numPerPage;
		String sql = "select books.* from books where typeid="+type+" limit " + startNum + ","+ numPerPage;
		
		DBbean db = new DBbean();
		db.getConnection();
		ResultSet rs = null;
		try {
			rs = db.executeQuery(sql, null);

			while (rs.next()) {
				Bookvo book = new Bookvo();
				book.setBookid(rs.getInt("bookid"));
				book.setTypeid(rs.getInt("typeid"));
				book.setBookname(rs.getString("bookname"));
				book.setISBN(rs.getString("ISBN"));
				book.setPublisher(rs.getString("publisher"));
				book.setAuthor(rs.getString("author"));
				book.setPublishdata(rs.getString("publishdata"));
				book.setPagenum(rs.getInt("pagenum"));
				book.setSaleprice(rs.getFloat("saleprice"));
				book.setStoreprice(rs.getFloat("storeprice"));
				book.setContent(rs.getString("content"));
				book.setBuycount(rs.getInt("buycount"));
				book.setStorecount(rs.getInt("storecount"));
				book.setImageFile(rs.getString("imagefile"));
							
				rst.add(book);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return rst;
	}	
	
	public int getpages(String type){
		int Pagenum=0;
		String sql = "select count(*) from books where typeid="+type;
		//System.out.println(sql);
		
		DBbean db = new DBbean();
		db.getConnection();
		
		try {
			ResultSet rs = db.executeQuery(sql, null);
			
			while(rs.next()){
				int count = rs.getInt(1);
				Pagenum = count/10;
				int f = count%10;
				if(f!=0){
					Pagenum++;
				}
				//System.out.println(Pagenum);

			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return Pagenum;
	}
	public boolean updateCount(String bookid,String count){
		String sql="update books set buycount=buycount+"+count+"storecount=storecount-"+count;
		
		DBbean db = new DBbean();
		db.getConnection();
		
		try {
			int i = db.executeUpdate(sql, null);
			if(i==1){
				db.close();
				return true;
			}
			else{
				db.close();
				return false;
			}
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			db.close();
			e.printStackTrace();
			return false;
		}
		
	}
	public boolean getCountByBookid(String bookid,String count){
		String sql="select storecount from books where bookid = "+bookid;
		
		DBbean db = new DBbean();
		db.getConnection();
		
		try {
			ResultSet rs = db.executeQuery(sql, null);
			if(rs.next()){
				int c = rs.getInt(1);
				if(c>Integer.parseInt(count)){
					db.close();
					return true;
				}
				else{
					db.close();
					return false;
				}
				
			}
			else{
				db.close();
				return false;
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			db.close();
			e.printStackTrace();
			return false;
		}
		
		
		
	}
	
	
}
