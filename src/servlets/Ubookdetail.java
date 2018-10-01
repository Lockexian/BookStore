package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Bookdao;
import bean.Bookvo;

/**
 * Servlet implementation class Ubookdetail
 */
@WebServlet("/Ubookdetail")
public class Ubookdetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ubookdetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");	
		request.setCharacterEncoding("UTF-8");
		
		String bookid = request.getParameter("bookid");
		String update = request.getParameter("update");
		
		Bookdao bd = new Bookdao();
		if(update==null){
			
			Bookvo bv = bd.getBook(bookid);
			
			request.setAttribute("book", bv);
			request.getRequestDispatcher("ubookdetail.jsp").forward(request, response);	
		}
		else{
			
			
			String bookname = request.getParameter("bookname");
			String ISBN = request.getParameter("ISBN");
			String publisher = request.getParameter("publisher");
			String author = request.getParameter("author");
			String pagenum = request.getParameter("pagenum");
			String saleprice = request.getParameter("saleprice");
			String content = request.getParameter("content");
			String storecount = request.getParameter("storecount");
			
			Bookvo bv = new Bookvo();
			bv.setBookid(Integer.parseInt(bookid));
			bv.setBookname(bookname);
			bv.setISBN(ISBN);
			bv.setPublisher(publisher);
			bv.setAuthor(author);
			bv.setPagenum(Integer.parseInt(pagenum));
			bv.setSaleprice(Float.parseFloat(saleprice));
			bv.setContent(content);
			bv.setStorecount(Integer.parseInt(storecount));
			
			bd.updatebookinfo(bv);
			
			response.sendRedirect("updatebook.jsp");
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	}

}
