package dao;

import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import bean.Basketshow;

public class Basketdao {
	int startNum = 1;
	int numPerPage=5;
	
	public ArrayList getBasketByPagenum(String username,int pagenum){
		ArrayList baskets = new ArrayList();
		startNum = (pagenum-1)*numPerPage;
		String sql = "select * from basket,users where basket.userid = users.userid  and username="+"\""+ username+"\" limit " + startNum + ","+ numPerPage; 
		
		DBbean db = new DBbean();
		db.getConnection();
		try{
			ResultSet rs = db.executeQuery(sql, null);
			
			while(rs.next()){
				Basketshow basketshow = new Basketshow();
				basketshow.setUserid(rs.getString(1));
				basketshow.setBookid(rs.getString(2));
				basketshow.setOrdercount(rs.getString(3));
				basketshow.setAddtime(rs.getString(4));
			
				baskets.add(basketshow);
			}
			
			for(int i = 0;i<baskets.size();i++){
				
				Basketshow bshow =(Basketshow) baskets.get(i);
				String SQL="select bookname,publisher,author,saleprice,imageFile,storecount from books where bookid="+bshow.getBookid();
				rs = db.executeQuery(SQL, null);
				
				while(rs.next()){
					bshow.setBookname(rs.getString("bookname"));
					bshow.setPublisher(rs.getString("publisher"));
					bshow.setAuthor(rs.getString("author"));
					bshow.setSaleprice(rs.getFloat("saleprice"));
					bshow.setImageFile(rs.getString("imagefile"));
					bshow.setStorecount(rs.getInt("storecount"));
				}
			}
			
		}	
		catch(Exception e){
			e.printStackTrace();
		}
		
		db.close();
		return baskets;
	}
	public boolean addbasketinfo(String username,String bookid,String count){
	
		String SQL  = "select userid from users where username = \""+username+"\"";
		
		DBbean db = new DBbean();
		db.getConnection();
		try{
			String userid = null;
			ResultSet rs = db.executeQuery(SQL, null);
			while(rs.next()){
				userid =rs.getString(1);
			}
			int c = isexisted(username, bookid);		
			if(c==-1){
			
			String sql = "INSERT INTO basket (userid,bookid,ordercount,addtime) values (?,?,?,?)";
			
			Date date = new Date();
			DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time=format.format(date);
			
			ArrayList params = new ArrayList();
			params.add(userid);
			params.add(bookid);
			params.add(count);
			params.add(time);			
			int i=	db.executeUpdate(sql,params);	
			}
			else{
				SQL ="UPDATE basket set ordercount = "+c+"+"+count +" where userid = \""+userid+"\""+" and bookid = "+bookid;
				db.executeUpdate(SQL, null);
			}	
		}
		catch(Exception e){
			e.printStackTrace();
			db.close();
			return false;
		}
		db.close();
		return true;
	}	
	public boolean updatebasketinfo(String username,String bookid,String count){
		String SQL  = "select userid from users where username = \""+username+"\"";
		
		DBbean db = new DBbean();
		db.getConnection();
		try {
			String userid = null;
			ResultSet rs;
			
				rs = db.executeQuery(SQL, null);
			
			while(rs.next()){
				userid =rs.getString(1);
			}
			SQL ="UPDATE basket set ordercount = "+count +" where userid = \""+userid+"\""+" and bookid = "+bookid;
			db.executeUpdate(SQL, null);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			db.close();
			e.printStackTrace();
			return false;
		}
		db.close();
		return true;
	}
	
	public boolean deletebasketinfo(String username,String bookid){
		
		String SQL = "select userid from users where username = \""+ username +"\" ";
		DBbean db = new DBbean();
		db.getConnection();
		try {
			String userid = null;
			ResultSet rs = db.executeQuery(SQL, null);
			if(rs.next()){
				userid = rs.getString("userid");
				String sql = "delete from basket where bookid ="+ bookid +" and userid = \""+userid+"\"" ;
				db.executeUpdate(sql, null);
			}	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			db.close();
			return false;
		}
		
		db.close();
		return true;
	}
	public int isexisted(String username,String bookid){
		String sql ="SELECT userid from users where username = \""+username +"\" " ;
		DBbean db = new DBbean();
		db.getConnection();
		
		try {
			ResultSet rs = db.executeQuery(sql, null);
			if(rs.next()){
				String userid = rs.getString(1);
				String SQL = "SELECT ordercount from basket where userid = \""+userid+"\" and bookid ="+bookid;
				rs = db.executeQuery(SQL, null);
				if(rs.next()){
					return rs.getInt(1);
				}
				else{
					return -1;
				}
			
			
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		db.close();
		return -1;
	}
	
	
	
}
