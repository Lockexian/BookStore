package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Userdao;


@WebServlet("/registercheck")
public class registercheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public registercheck() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out =response.getWriter();
		
		Userdao ud = new Userdao();
		
		String name = request.getParameter("t_UserName");
		//System.out.println(""+name);
		if(ud.nameCheck(name)){
			out.println("用户名可以使用");
			//out.println(ud.nameCheck(name));
		}
		else{
			out.println("用户名已被占用");
			//out.println(ud.nameCheck(name));
		}
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request,response);
		
		
		
		
	}

}
