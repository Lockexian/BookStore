package servlets;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Basketshow;
import dao.Basketdao;

/**
 * Servlet implementation class Basketservlet
 */
@WebServlet("/Basketservlet")
public class Basketservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Basketservlet() {
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
		int ipagenum = 1;
		String username = (String) request.getSession(true).getAttribute("username1");
		
		String spagenum = request.getParameter("pagenum");
		HttpSession session = request.getSession(true);
		session.removeAttribute("basketlist");
		if(spagenum!=null){
			ipagenum = Integer.parseInt(spagenum);
		}
		Basketdao basketdao  = new Basketdao();
		String F = request.getParameter("baskettype");
		String bookid = request.getParameter("bookid");
		String fl = request.getParameter("f");
		
		//System.out.println("----F---"+F);
		//System.out.println("----username---"+username);
		if(F!=null){
			if(F.equals("delete")){
			
				basketdao.deletebasketinfo(username, bookid);	
				//System.out.print(bookid+"   bookid  ");
			}
			else if(F.equals("deleteall")){
				int i = -1;
				String[] bookids = new String[5];
				do{		
					i++;
					bookids[i] = request.getParameter("bookid"+i);	
				}while(bookids[i]!=null&i<5);
				int n =-1;
				String[] selects = new String[5];
				do{		
					n++;
					selects[n] = request.getParameter("select"+n);	
				}while(selects[n]!=null&&n<5);		
				for(int j=0;j<i;j++){
					if(selects[j].equals("1"))
					basketdao.deletebasketinfo(username, bookids[j]);
				}
			}
			else if(F.equals("add")){
				String count = request.getParameter("count");
				basketdao.addbasketinfo(username, bookid, count);
			}
			else if(F.equals("update")){
				int i = -1;
				String[] bookids = new String[5];
				do{		
					i++;
					bookids[i] = request.getParameter("bookid"+i);	
				}while(bookids[i]!=null);
				int n =-1;
				String[] counts = new String[5];
				do{		
					n++;
					counts[n] = request.getParameter("bcount"+n);	
				}while(counts[n]!=null);
				
				
				for(int j=0;j<i;j++){
					basketdao.updatebasketinfo(username, bookids[j], counts[j]);
				}		
			}
		}	
		
		if(fl!=null){
			if(fl.equals("index")){
				
				response.sendRedirect("/webbookshop/searchbook");	
				return;
				//System.out.println("index");//output
			}
			else if(fl.equals("logout")){
				response.sendRedirect("/webbookshop/logout");
				return;
			}
			else if(fl.equals("order")){					
				response.sendRedirect("/webbookshop/Oriservler");
				return;
			}
			else if(fl.equals("hello")){
				response.sendRedirect("/webbookshop/updateuser");
				return;
			}
		}
		
		ArrayList basketlist = basketdao.getBasketByPagenum(username, ipagenum);
		session.setAttribute("basketlist", basketlist);
		response.sendRedirect("shoppingcart.jsp");		
		
	}

}
