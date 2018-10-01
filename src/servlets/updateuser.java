package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Userdao;
import bean.Uservo;


@WebServlet("/updateuser")
public class updateuser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public updateuser() {
        super();
     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		Userdao ud = new Userdao();
		String username = (String)request.getSession().getAttribute("username1");
		
		request.setAttribute("user",ud.selectuser(username));
		RequestDispatcher rd=request.getRequestDispatcher("update.jsp");
		rd.forward(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Uservo uv = new Uservo();
		Userdao ud = new Userdao();
		uv.setUsername(request.getParameter("t_UserName"));
		
		uv.setPwd(request.getParameter("t_UserPwd"));
		uv.setSex(request.getParameter("t_Sex"));
		uv.setAddress(request.getParameter("t_Address"));
		uv.setEmail(request.getParameter("t_Email"));
		uv.setTelephone(request.getParameter("t_Telephone"));
		if(ud.updateUser(uv)){
			response.setContentType("text/html; charset=utf-8");
			response.sendRedirect("/webbookshop/index.jsp");
		}
		else{
			response.setContentType("text/html; charset=utf-8");
			response.sendRedirect("/webbookshop/index.jsp");
		}
	}

}
