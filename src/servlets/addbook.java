package servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Bookdao;
import bean.Bookvo;













@WebServlet("/addbook")
public class addbook extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public addbook() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		HttpSession session =  request.getSession();
		
		Bookvo bv = new Bookvo();
		Bookdao bd =new Bookdao();
			
		int bookid  =	bd.getMaxBookId();
		
		
		
		bv.setBookid(bookid);
		bv.setTypeid(Integer.parseInt(request.getParameter("type")));
		bv.setBookname(request.getParameter("bookname"));
		bv.setISBN(request.getParameter("ISBN"));
		bv.setPublisher(request.getParameter("publisher"));
		bv.setAuthor(request.getParameter("author"));
		bv.setPublishdata(request.getParameter("publishdata"));
		
		//bv.setPublishdata("2017-10-11");
		bv.setPagenum(Integer.parseInt(request.getParameter("pagenum")));
		bv.setSaleprice(Float.parseFloat(request.getParameter("saleprice")));
		bv.setStoreprice(Float.parseFloat(request.getParameter("storeprice")));
		bv.setStorecount(Integer.parseInt(request.getParameter("storecount")));
		bv.setContent(request.getParameter("content"));
		bv.setBuycount(0);
		bv.setImageFile("/bookimages/"+bookid+".jpg");
		
		
		
		if(bd.addBook(bv)){
			session.setAttribute("addbook", "book");
		}
		else{
			session.setAttribute("addbook", "false");
		}
		
	}

}
