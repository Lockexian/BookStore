package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Userdao;
import bean.Uservo;


@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public register() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		
		Uservo uv = new Uservo();
		Userdao ud = new Userdao();
		uv.setUserid(ud.getMaxUserId()+"");
		uv.setPwd(request.getParameter("t_UserPwd"));
		uv.setUsername(request.getParameter("t_UserName"));
		uv.setSex(request.getParameter("t_Sex"));
		uv.setAddress(request.getParameter("t_Address"));
		uv.setEmail(request.getParameter("t_Email"));
		uv.setTelephone(request.getParameter("t_Telephone"));
		//System.out.println("---------------"+uv.getSex()+"--------");
		//System.out.println("---------------"+uv.getTelephone()+"--------");
		
		//
		if(ud.addUser(uv)){
			response.sendRedirect("/webbookshop/login.jsp");
		}
		else{
			response.sendRedirect("/webbookshop/register.jsp");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
