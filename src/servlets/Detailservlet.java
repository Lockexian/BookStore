package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Basketdao;
import bean.Bookdao;
import bean.Bookvo;

/**
 * Servlet implementation class Detailservlet
 */
@WebServlet("/Detailservlet")
public class Detailservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Detailservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		String username = (String) request.getSession().getAttribute("username1");
		String bookid = request.getParameter("bookid");
		
		Bookdao bd = new Bookdao();
		Bookvo bv =	bd.getBook(bookid);
		bv.setBookid(Integer.parseInt(bookid));
		Basketdao bad = new Basketdao();
		int c = bad.isexisted(username, bookid);
		
		if(c!=-1){
			request.setAttribute("isexited", c);
		}
		request.setAttribute("book", bv);
		
		request.getRequestDispatcher("detail.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
