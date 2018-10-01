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
import bean.Bookvo;

@WebServlet("/searchbook")
public class searchbook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public searchbook() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");	
		request.setCharacterEncoding("UTF-8");	
		
		HttpSession session = request.getSession(true);
		
		session.removeAttribute("pagetype");
		session.removeAttribute("allpage");
		session.removeAttribute("pnum");
		session.removeAttribute("books1");
		session.removeAttribute("books2");
		session.removeAttribute("ptype");
		
		String type = request.getParameter("type");
		String pagenumstr = request.getParameter("pagenum");
		
		
		int pagenum =1;
		if(pagenumstr!=null){
			pagenum = Integer.parseInt(pagenumstr);
		}
		if(type == null){
			type = new String("小说");
		}
		else{	
			
			type = URLDecoder.decode(type,"UTF-8");
		}
		
		
		Bookdao bd = new Bookdao();
		ArrayList s = bd.getBooksByPage(type,pagenum);
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
		
		
		System.out.println(s.size());
		
		Integer allpage = bd.getpagenum(type);	
		
		
		
		session.setAttribute("first", "true");		
		session.setAttribute("pagetype", type);
		session.setAttribute("allpage",allpage.toString());
		session.setAttribute("pnum",pagenum);
		session.setAttribute("books1",s1);//
		session.setAttribute("books2",s2);//

		response.sendRedirect("/webbookshop/index.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
