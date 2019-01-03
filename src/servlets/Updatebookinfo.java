package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Bookdao;

/**
 * Servlet implementation class Updatebookinfo
 */
@WebServlet("/Updatebookinfo")
public class Updatebookinfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Updatebookinfo() {
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
		HttpSession  session = request.getSession();
		session.removeAttribute("pagetype");
		session.removeAttribute("allpage");
		session.removeAttribute("pnum");
		session.removeAttribute("books");
		
		
		String type = request.getParameter("type"); 
		String pagenumstr = request.getParameter("pagenum");
//		if(type==null){
//			type="小说";	
//		}
//		System.out.println();
		int pagenum =1;
		if(pagenumstr!=null){
			pagenum = Integer.parseInt(pagenumstr);
		}
		
		Bookdao bd = new Bookdao();
		int num = bd.getpages(type);
		
		ArrayList s = bd.getBooks(type, pagenum);
		
		
		session.setAttribute("pagetype",type);
		session.setAttribute("allpage",num);
		session.setAttribute("pnum",pagenum);
		session.setAttribute("books",s);//

		response.sendRedirect("/webbookshop/updatebook.jsp");		
		
		
		
	}

}
