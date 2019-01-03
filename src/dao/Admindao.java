package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.Adminvo;

public class Admindao {
	public boolean login(String adminname,String adminpwd){
			
			DBbean db = new DBbean();
			db.getConnection();
			String sql = "select passwd from admin where adminname = \""+adminname+"\"";
			ResultSet rs = null;
			try {
				rs=db.executeQuery(sql, null);
				if(rs.next()){
					if(rs.getString(1).equals(adminpwd)){
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
	public boolean updateadminpw(String adminname,String adminpwd,String newadminpwd){
		
		if(login(adminname,adminpwd)){

			String sql ="UPDATE admin set passwd = \""+newadminpwd+"\" where adminname =\""+adminname+"\"";
			
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
		else{
		
			return false;
		}		
	}
	public boolean addadmin(Adminvo av){
		DBbean db = new DBbean();
		db.getConnection();
		
		
		String sql = "insert into admin(adminid,passwd,adminname) values (?,?,?)";
		ArrayList params = new ArrayList();
		
		
		params.add(av.getAdminid());
		params.add(av.getPasswd());
		params.add(av.getAdminname());
		
		
		try {
			db.executeUpdate(sql,params);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			db.close();
			return false;
		}
		db.close();
		
		
		
		return true;
	}
	public boolean nameCheck(String name){
		DBbean db = new DBbean();
		db.getConnection();
		String sql = "select adminname from admin where adminname = \""+name+"\"";
		ResultSet rs = null;
		try {
			rs=db.executeQuery(sql, null);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		try {
			if(rs.next()==false){
			
				db.close();
				return true;
			}
			else
			{
				
				
				db.close();
				return false;
			}
			
		} catch(SQLException e) {
			
			e.printStackTrace();
			
		}	
		
		db.close();
		return false;
	}	
	
	
	public int getMaxAdminId(){
		int Adminid = 0;
		DBbean db = new DBbean();
		db.getConnection();
		String sql = "select max(adminid) from admin";
		
		ResultSet rs = null;
		try {
			rs = db.executeQuery(sql, null);
			
			if(rs.next()){
				Adminid = Integer.parseInt(rs.getString(1))+1;
				
			}	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return Adminid;
	}
	
	
	
}
