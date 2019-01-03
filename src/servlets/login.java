package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Userdao;


@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public login() {
        super();
        
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	doPost(request, response);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		String username = request.getParameter("t_UserId");
		String userpwd = request.getParameter("t_UserPwd");
		//System.out.println("---------------"+username+"--------");
		//System.out.println("---------------"+userpwd+"--------");
		PrintWriter out = response.getWriter();
		//
		Userdao ud = new Userdao();
		if(ud.login(username, userpwd)){
			//		
			request.getSession().setAttribute("username1", username);//
			response.sendRedirect("/webbookshop/searchbook");
			
		}
		else{

			request.setAttribute("faile", "faile");//
			RequestDispatcher forword = request.getRequestDispatcher("login.jsp");
			forword.forward(request, response);
		}
	}

}
