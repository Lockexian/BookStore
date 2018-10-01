package servlets;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Bookdao;

/**
 * Servlet implementation class Searchservlet
 */
@WebServlet("/Searchservlet")
public class Searchservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Searchservlet() {
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
		String bookname = request.getParameter("bookname");
	
		
		HttpSession session = request.getSession(true);
		session.removeAttribute("pagetype");
		session.removeAttribute("allpage");
		session.removeAttribute("pnum");
		session.removeAttribute("books1");
		session.removeAttribute("books2");
		String pagenumstr = request.getParameter("pagenum");
		
		int pagenum =1;
		if(pagenumstr!=null){
			pagenum = Integer.parseInt(pagenumstr);
		}
		
		
		Bookdao bd = new Bookdao();		
		int num = bd.pagenumByname(bookname);
		if(num==0){
			//System.out.println(num);
			response.sendRedirect("/webbookshop/index.jsp");
		}
		else{
			ArrayList s = bd.getBookByName(bookname, pagenum);
			ArrayList s1 = new ArrayList();
			ArrayList s2 = new ArrayList();
			for(int i = 0; i<s.size();i++){
				if(i<5){
					s1.add(s.get(i));
				}
				else{
					s2.add(s.get(i));
				}
			}
			session.setAttribute("ptype", "search");
			session.setAttribute("allpage",num);
			session.setAttribute("pnum",pagenum);
			session.setAttribute("books1",s1);//
			session.setAttribute("books2",s2);//

			response.sendRedirect("/webbookshop/index.jsp");		
			
		}
		
		
		
	}

}
