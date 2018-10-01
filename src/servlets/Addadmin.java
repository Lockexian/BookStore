package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Admindao;
import bean.Adminvo;

/**
 * Servlet implementation class Addadmin
 */
@WebServlet("/Addadmin")
public class Addadmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addadmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		String adminname = (String) request.getSession().getAttribute("usernameadmin");
		
		if(adminname!=null){
		Adminvo av = new Adminvo();
		Admindao ad = new Admindao();

		av.setAdminid(ad.getMaxAdminId()+"");
		av.setPasswd(request.getParameter("t_UserPwd"));
		av.setAdminname(request.getParameter("t_UserName"));
	
	
		
		boolean f = ad.addadmin(av);
		if(f){
			response.sendRedirect("management.jsp");
		}
		else{
			response.sendRedirect("addadmin.jsp");
		}
	}
	}
}
