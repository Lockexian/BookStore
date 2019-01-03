package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Admindao;

/**
 * Servlet implementation class Updateadpw
 */
@WebServlet("/Updateadpw")
public class Updateadpw extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Updateadpw() {
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
		
		String adminname =(String) request.getSession().getAttribute("usernameadmin");
		String adminpwd = request.getParameter("old_UserPwd");
		String newadminpwd = request.getParameter("new_UserPwd");
		
		Admindao ad = new Admindao();
	    boolean f =	ad.updateadminpw(adminname, adminpwd, newadminpwd);
		
		if(f){
			request.setAttribute("faile","true");
			request.getRequestDispatcher("/updataadpw.jsp").forward(request, response);
		}
		else{
			request.setAttribute("faile","faile");
			request.getRequestDispatcher("/updataadpw.jsp").forward(request, response);
		}
		
	}

}
