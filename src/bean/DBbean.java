package bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;

public class DBbean {
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public Connection getConnection(){
		if(con == null){
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url="jdbc:mysql://127.0.0.1/bookshoping";
				String user="root";
				String password ="";
				
				con = DriverManager.getConnection(url+"?user="+user+"&password="+""+"&useUnicode=true&characterEncoding=utf-8");
				
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}//if
		return con;
	}
	
	
	//只能执行查询操作
	public ResultSet executeQuery(String sql, ArrayList params) throws Exception{
		if(con == null){
			throw new Exception("未连接数据库");
		}
		
		pstmt = con.prepareStatement(sql);
		
		if(params != null){
			Iterator i = params.iterator();
			
			int index = 1;
			while(i.hasNext()){
				String temp = (String)i.next();
				pstmt.setString(index, temp);
				index ++;
			}
			
		}
		
		rs = pstmt.executeQuery();
		
		
		return rs;
	}
	
	//执行增删改操作
	public int executeUpdate(String sql, ArrayList params) throws Exception{
		if(con == null){
			throw new Exception("未连接数据库");
		}
		
		pstmt = con.prepareStatement(sql);
		
		if(params != null){
			Iterator i = params.iterator();
			
			int index = 1;
			while(i.hasNext()){
				String temp = (String)i.next();
				pstmt.setString(index, temp);
				index ++;
			}
			
		}
		
		return pstmt.executeUpdate();
		
		
		
	}
	
	public void close(){
		try {
			if(rs != null){
				rs.close();
			}
			if(stmt != null)
				stmt.close();
			if(pstmt!=null){
				pstmt.close();
			}
			if(con != null)
				con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
}
