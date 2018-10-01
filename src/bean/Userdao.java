package bean;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class Userdao {
	//add users
	public boolean addUser(Uservo user){

		DBbean db = new DBbean();
		db.getConnection();
		
		
		String sql = "insert into users (userid,pwd,username,sex,adress,email,telephone) values (?,?,?,?,?,?,?)";
		ArrayList params = new ArrayList();
		
		
		params.add(user.getUserid());
		params.add(user.getPwd());
		params.add(user.getUsername());
		params.add(user.getSex());
		params.add(user.getAddress());
		params.add(user.getEmail());
		params.add(user.getTelephone());
		
		
		try {
			db.executeUpdate(sql,params);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			db.close();
			//System.out.println("---����false-------");
			return false;
		}
		db.close();

		return true;
	}
	
	
	public boolean nameCheck(String name){
		DBbean db = new DBbean();
		db.getConnection();
		String sql = "select username from users where username = \""+name+"\"";
		ResultSet rs = null;
		try {
			rs=db.executeQuery(sql, null);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//System.out.println("��ѯʧ�ܣ�");
		}
		try {
			if(rs.next()==false){
				//System.out.println("------------û������-----------");
				db.close();
				return true;
			}
			else
			{
				//System.out.println("------------����-----------");
				
				db.close();
				return false;
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			//System.out.println("�ж�resultSet����");
		}	
		
		db.close();
		return false;
	}	
	
	
	public int getMaxUserId(){
		int userid = 0;
		DBbean db = new DBbean();
		db.getConnection();
		String sql = "select max(userid) from users";
		
		ResultSet rs = null;
		try {
			rs = db.executeQuery(sql, null);
			//System.out.println("------------rs.next() = "+rs.next()+"--------------");
			if(rs.next()){
				//System.out.println("*********rs = "+rs.toString()+"-------------");
				//System.out.println("-----------rs.getString() = "+rs.getString(1)+"-------------");
				userid = Integer.parseInt(rs.getString(1))+1;
				
			}	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//System.out.println("��ѯʧ��--------��");
		}
		System.out.println(userid);
		db.close();
		return userid;
	}
	public boolean login(String username,String userpwd){
		
		DBbean db = new DBbean();
		db.getConnection();
		String sql = "select username,pwd from users where username = \""+username+"\"";
		ResultSet rs = null;
		try {
			rs=db.executeQuery(sql, null);
			if(rs.next()){
				if(rs.getString(2).equals(userpwd)){
					
					db.close();
					return true;
				}	
			}
			else{
				db.close();
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		db.close();
		return false;
		
	}
	
	
	public ArrayList selectuser(String username){
		ArrayList rst = new ArrayList();
		
		String sql = "select * from users where username = \""+username+"\"";
		
		System.out.println(sql);
		DBbean db = new DBbean();
		db.getConnection();
		ResultSet rs = null;
		try {
			
			rs = db.executeQuery(sql, null);

			while (rs.next()) {
				Uservo uv = new Uservo();
				
				uv.setUserid(rs.getString("userid"));
				uv.setAddress(rs.getString("adress"));
				uv.setEmail(rs.getString("email"));
				uv.setPwd(rs.getString("pwd"));
				uv.setSex(rs.getString("sex"));
				uv.setTelephone(rs.getString("telephone"));
				uv.setUsername(rs.getString("username"));
				rst.add(uv);
			}
		} catch (Exception e) {

			e.printStackTrace();
			//System.out.println("---------------------userdao����");
		}
		db.close();
		return rst;
	}
	public boolean updateUser(Uservo uv){

		DBbean db = new DBbean();
		db.getConnection();
		
		

		String sql = "update users set pwd = ?,sex = ?,adress = ?,email = ?,telephone = ? where username =\""+ uv.username+"\"";
		//System.out.println("------------sql------"+sql);

		ArrayList params = new ArrayList();
		params.add(uv.getPwd());
		params.add(uv.getSex());
		params.add(uv.getAddress());
		params.add(uv.getEmail());
		params.add(uv.getTelephone());

		try {
			int i = db.executeUpdate(sql,params);
			//System.out.println("------------i------"+i);
		} catch (Exception e) {
			
			e.printStackTrace();
			db.close();

			return false;
		}
		db.close();
		return true;
		
	}
	public String getuserid(String username){
		String userid=null;
		String sql = "select userid from users where username = \""+username+"\"";
		DBbean db = new DBbean();
		db.getConnection();
		
		try {
			ResultSet rs = db.executeQuery(sql, null);
			if(rs.next()){
				userid = rs.getString(1);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return userid;
	}
	public String getemail(String username){
		String email=null;
		String sql = "select email  from users where username = \""+username+"\"";
		DBbean db = new DBbean();
		db.getConnection();	
		try {
			ResultSet rs = db.executeQuery(sql, null);
			if(rs.next()){
				email = rs.getString(1);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return email;
	}
	
	
	public boolean uppassword(String username,String pwd){
		String sql = "update users set pwd = \""+pwd+"\" where username =\""+ username+"\"";
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
	
}
