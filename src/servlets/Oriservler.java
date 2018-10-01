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

import bean.Basketdao;
import bean.Bookdao;
import bean.Orderinfodao;
import bean.Orderinfovo;

/**
 * Servlet implementation class Oriservler
 */
@WebServlet("/Oriservler")
public class Oriservler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Oriservler() {
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
		String username = (String) session.getAttribute("username1");
		
	
		Orderinfodao od = new Orderinfodao();
		String f = request.getParameter("f");
		String u = request.getParameter("u");
		
		if(u!=null){
			String ordernumber = request.getParameter("ordernumber");
			
			int srderstate = 3;
			od.updataorderinfo(srderstate, ordernumber);			
		}
		
		if(f!=null){
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
			int m =-1;
			String[] counts = new String[5];
			do{		
				m++;
				counts[m] = request.getParameter("bcount"+m);	
			}while(counts[m]!=null&&m<5);
			
			
			String ordernumber = od.createonum(username);
			Date date = new Date();
			DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time=format.format(date);
			Bookdao bod = new Bookdao();
			for(int j=0;j<i;j++){
				if(selects[j].equals("1")&&bod.getCountByBookid(bookids[j],  counts[j])){
					
					Orderinfovo orderinfovo = new Orderinfovo();
					orderinfovo.setOrdernumber(ordernumber);
					orderinfovo.setBookid(bookids[j]);
					orderinfovo.setOrdertime(time);
					orderinfovo.setOrderstate("1");
					orderinfovo.setOrdercount(counts[j]);
					od.addorderinfo(orderinfovo, username);
					
					Basketdao bd =  new Basketdao();
					bd.deletebasketinfo(username, bookids[j]);
					bod.getCountByBookid(bookids[j], counts[j]);
					
					
				}

			}
			
		}
		
		ArrayList order = od.order(username);
		session.setAttribute("order", order);
		response.sendRedirect("/webbookshop/order.jsp");
		
		
	}

}
