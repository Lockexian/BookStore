package dao;

import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import bean.Orderinfovo;
import bean.Ordershow;

public class Orderinfodao {
	
	public boolean updataorderinfo(int srderstate,String ordernumber){
		String sql ="UPDATE orderinfo SET orderstate = "+srderstate +" where ordernumber= \""+ordernumber+"\"";                  
		DBbean db = new DBbean();
		db.getConnection();
		
		try {
			db.executeUpdate(sql, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			db.close();
			return false;
		}
		db.close();
		return true;
	}
	public ArrayList<Ordershow> order(String usrename){
		ArrayList<Ordershow> rst = new ArrayList<Ordershow>();
		
		ArrayList ordernum  = selectordernum(usrename);
		for(int i = 0;i<ordernum.size();i++){
			String o = (String)ordernum.get(i);
			rst.add(getInfoByOrdernum(o,usrename));
		}
		
		
		return rst;
	}
	
	private ArrayList selectordernum(String usrename){
		
		ArrayList ordernum = new ArrayList();
		ResultSet rs ;
		DBbean db = new DBbean();
		db.getConnection();
			
		try {
			String SQL = "select userid from users where username =\""+usrename+"\"";
			
			
			rs = db.executeQuery(SQL, null);
			String userid = null;
			if(rs.next()){
				userid = rs.getString(1);
			}
			
			
			String sql = "select distinct ordernumber from orderinfo where userid= \""+userid+"\"";
			
			rs = db.executeQuery(sql, null);
			
			while(rs.next()){
				ordernum.add(rs.getString(1));
			}			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		db.close();
		return ordernum;
	}
	private Ordershow getInfoByOrdernum(String ordernumber,String username){
		Ordershow orderinfovo = new Ordershow();
		String sql = "select ordernumber,bookid,ordertime,orderstate,ordercount from orderinfo where ordernumber =\""+ordernumber+"\"";
		
		DBbean db = new DBbean();
		db.getConnection();  
		String 	ordertime = null;
		int  orderstate  = 1;
		int i=0;
		try {
			ResultSet rs = db.executeQuery(sql, null);
			
			while(rs.next()){
			
			ordertime = rs.getString("ordertime");
			orderstate = rs.getInt("orderstate");
			switch(i){
			case 0:
				orderinfovo.setBookid1(rs.getString("bookid"));
				orderinfovo.setOrdercount1(rs.getInt("ordercount"));				
				
				break;
			case 1:
				orderinfovo.setBookid2(rs.getString("bookid"));
				orderinfovo.setOrdercount2(rs.getInt("ordercount"));
				break;
			case 2:
				orderinfovo.setBookid3(rs.getString("bookid"));
				orderinfovo.setOrdercount3(rs.getInt("ordercount"));
				break;
			case 3:
				orderinfovo.setBookid4(rs.getString("bookid"));
				orderinfovo.setOrdercount4(rs.getInt("ordercount"));
				break;	
			case 4:
				orderinfovo.setBookid5(rs.getString("bookid"));
				orderinfovo.setOrdercount5(rs.getInt("ordercount"));
				break;
			}		
			i++;
		}	
		
			orderinfovo.setNum(i+"");
			orderinfovo.setOrdernumber(ordernumber);
			
			orderinfovo.setOrdertime(ordertime);
					
		for(int j =0;j<i;j++){
			switch(j){
			case 0:
				sql = "select bookname,saleprice,imagefile from books where bookid="+orderinfovo.getBookid1();	
				rs = db.executeQuery(sql, null);
			
				if(rs.next()){
					orderinfovo.setBookname1(rs.getString("bookname"));
					orderinfovo.setBookprice1(rs.getFloat("saleprice"));
					orderinfovo.setImagefile1(rs.getString("imagefile"));
				
				}
				break;
			case 1:
				sql = "select bookname,saleprice,imagefile from books where bookid="+orderinfovo.getBookid2();	
				rs = db.executeQuery(sql, null);
				if(rs.next()){
					orderinfovo.setBookname2(rs.getString("bookname"));
					orderinfovo.setBookprice2(rs.getFloat("saleprice"));
					orderinfovo.setImagefile2(rs.getString("imagefile"));
				}
				break;
			case 2:
				sql = "select bookname,saleprice,imagefile from books where bookid="+orderinfovo.getBookid3();	
				rs = db.executeQuery(sql, null);
				if(rs.next()){
					orderinfovo.setBookname3(rs.getString("bookname"));
					orderinfovo.setBookprice3(rs.getFloat("saleprice"));
					orderinfovo.setImagefile3(rs.getString("imagefile"));
				}
				break;
			case 3:
				sql = "select bookname,saleprice,imagefile from books where bookid="+orderinfovo.getBookid4();	
				rs = db.executeQuery(sql, null);
				if(rs.next()){
					orderinfovo.setBookname4(rs.getString("bookname"));
					orderinfovo.setBookprice4(rs.getFloat("saleprice"));
					orderinfovo.setImagefile4(rs.getString("imagefile"));
				}
				break;	
			case 4:
				sql = "select bookname,saleprice,imagefile from books where bookid="+orderinfovo.getBookid5();	
				rs = db.executeQuery(sql, null);
				if(rs.next()){
					orderinfovo.setBookname5(rs.getString("bookname"));
					orderinfovo.setBookprice5(rs.getFloat("saleprice"));
					orderinfovo.setImagefile5(rs.getString("imagefile"));
				}
				break;
			}					
		}
		Float m =  0.0f;
		for(int j =0;j<i;j++){
			switch(j){
			case 0:
				m+=orderinfovo.getBookprice1()*orderinfovo.getOrdercount1();
				break;
			case 1:
				m+=orderinfovo.getBookprice2()*orderinfovo.getOrdercount2();
				break;
			case 2:
				m+=orderinfovo.getBookprice3()*orderinfovo.getOrdercount3();
				break;
			case 3:
				m+=orderinfovo.getBookprice4()*orderinfovo.getOrdercount4();
				break;	
			case 4:
				m+=orderinfovo.getBookprice5()*orderinfovo.getOrdercount5();
				break;
			}
		}
		
		orderinfovo.setTamount(m);
		orderinfovo.setUsername(username);
		if(orderstate==1){
			orderinfovo.setOrderstate("等待发货");
		}
		else if(orderstate==2){
			orderinfovo.setOrderstate("已发货");
		}
		else if(orderstate==3){
			orderinfovo.setOrderstate("交易完成");
		}
		
		
		sql = "select adress,telephone from users where username =\""+username+"\"";
		rs = db.executeQuery(sql, null);
		if(rs.next()){
			orderinfovo.setAdress(rs.getString("adress"));
			orderinfovo.setTel(rs.getString("telephone"));	
		}						
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		
		db.close();
		return orderinfovo;
	}
	public String createonum(String username){
		String ordernumber = null;
		StringBuffer o = new StringBuffer();
		Date date = new Date();
		DateFormat format=new SimpleDateFormat("yyyyMMddHHmmss");
		String time=format.format(date);
		o.append(time);
		String sql = "select userid from users where username = \""+username+"\"";
		
		DBbean db = new DBbean();
		db.getConnection();		
		String userid = null;
		String count = null;
		ResultSet rs;
		try {
			rs = db.executeQuery(sql, null);
			if(rs.next()){
				userid = rs.getString(1);
			}
			sql = "select count(*) from orderinfo";
			rs = db.executeQuery(sql, null);
			if(rs.next()){
				count  =rs.getString(1);
			}
			db.close();
			StringBuffer c = new StringBuffer(count);
			boolean f=true;
			while(c.length()<5){
				if(f){
					c.append('0');f=!f;
				}
					
				else{
					c.append('1');f=!f;
				}
					
			}
			count = new String(c);
			
			
			
			
			
			int id = Integer.parseInt(userid);
			Random random = new Random(id);
			
			int ran = random.nextInt(1000-150);
			ran+=200;
			o.append(""+ran);
			o.append(count);
			
			
			ordernumber = new String(o);	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			db.close();
			e.printStackTrace();
		}
			
		
		
		
	
		return ordernumber;
	}
	
	
	
	
	public boolean addorderinfo(Orderinfovo orderinfovo,String username){
		
		String sql = "select userid from users where username = \""+username+"\"";
		DBbean db = new DBbean();
		db.getConnection();
		
		try {
			
			String userid = null;
			ResultSet rs = db.executeQuery(sql, null);
			if(rs.next()){
				userid = rs.getString(1);
			}
			sql = "INSERT INTO orderinfo (ordernumber,bookid,userid,ordertime,orderstate,ordercount) values (?,?,?,?,?,?)";
			ArrayList params = new ArrayList();
			params.add(orderinfovo.getOrdernumber());
			params.add(orderinfovo.getBookid());
			params.add(userid);
			params.add(orderinfovo.getOrdertime());
			params.add(orderinfovo.getOrderstate());
			params.add(orderinfovo.getOrdercount());
			
			
			db.executeUpdate(sql, params);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		db.close();
		return true;
	}
	
	public ArrayList<Ordershow> orderinfoByAdmin(){
		ArrayList<Ordershow> allorder = new ArrayList<Ordershow>();
		String sql = "select ordernumber,username,count(ordernumber) from orderinfo,users where orderinfo.userid=users.userid ORDER BY ordertime DESC";
		
		DBbean db = new DBbean();
		db.getConnection();
		
		try {
			ArrayList<String> ordernumber = new ArrayList<String>();
			ArrayList<String> username = new ArrayList<String>();
	
			ResultSet rs = db.executeQuery(sql, null);
			
			while(rs.next()){
				ordernumber.add(rs.getString(1));
				username.add(rs.getString(2));				
			}
			for(int i = 0;i<username.size();i++){
				allorder.add(getInfoByOrdernum(ordernumber.get(i),username.get(i)));
			}
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return allorder;
	}
	
	
}
