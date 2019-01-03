package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Orderinfodao;

/**
 * Servlet implementation class Addealorder
 */
@WebServlet("/Addealorder")
public class Addealorder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addealorder() {
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
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");	
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		session.removeAttribute("order");
		Orderinfodao od = new Orderinfodao();
		
		String u = request.getParameter("u");
		if(u!=null){
			String ordernumber = request.getParameter("ordernumber");	
			int srderstate = 2;
			od.updataorderinfo(srderstate, ordernumber);
			
			
		}
		
		
		
		
		ArrayList order  = od.orderinfoByAdmin();
		session.setAttribute("order", order);
		response.sendRedirect("/webbookshop/dealorder.jsp");
		
		
		
	}

}
