package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Admindao;



@WebServlet("/adminlogin")
public class adminlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public adminlogin() {
        super();
        
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
    		throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	doPost(req, resp);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		String adminname = request.getParameter("t_UserId");
		String adminpwd = request.getParameter("t_UserPwd");
		

		Admindao ad = new Admindao();
		if(ad.login(adminname, adminpwd)){
			//
			
			request.getSession().setAttribute("usernameadmin", adminname);//
			response.sendRedirect("management.jsp");
			
		}
		else{

			request.setAttribute("faile", "faile");//
			RequestDispatcher forword = request.getRequestDispatcher("admin.jsp");
			forword.forward(request, response);
			
			
		}
	}

}
