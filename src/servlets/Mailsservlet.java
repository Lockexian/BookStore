package servlets;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.mail.util.MailSSLSocketFactory;

import bean.DBbean;
import bean.Userdao;

/**
 * Servlet implementation class Mailsservlet
 */
@WebServlet("/Mailsservlet")
public class Mailsservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Mailsservlet() {
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
		HttpSession Hsession = request.getSession(true);
		
		String username = request.getParameter("username");
		String t = request.getParameter("t");
		Userdao ud = new Userdao();
		
		if(username!=null){
			if(t!=null){
						
			
						
						String userid = ud.getuserid(username);
						String email = ud.getemail(username);
						int uid = Integer.parseInt(userid);	
						Random ran = new Random(uid);
						int icode = ran.nextInt(10000000-1000000);	
						icode+=1000000;
						Hsession.setAttribute("icode", icode+"");
						System.out.println(icode);
						try{
						Properties props = new Properties();
						// 开启debug调试
				        //props.setProperty("mail.debug", "true");
				        // 发送服务器需要身份验证
				        props.setProperty("mail.smtp.auth", "true");
				        // 设置邮件服务器主机名
				        props.setProperty("mail.host", "smtp.qq.com");
				        // 发送邮件协议名称
				        props.setProperty("mail.transport.protocol", "smtp");

				        MailSSLSocketFactory sf = new MailSSLSocketFactory();
				        sf.setTrustAllHosts(true);
				        props.put("mail.smtp.ssl.enable", "true");
				        props.put("mail.smtp.ssl.socketFactory", sf);

				        Session session = Session.getInstance(props);

				        Message msg = new MimeMessage(session);
				        msg.setSubject("修改密码");
				    
				        msg.setText(icode+"");
				        msg.setFrom(new InternetAddress("1312924859@qq.com"));

				        Transport transport = session.getTransport();
				        transport.connect("smtp.qq.com", "1312924859@qq.com", "iujiuowohcvghjbd");

				        transport.sendMessage(msg, new Address[] { new InternetAddress(email) });
				        transport.close();     
				        
						}catch(Exception e){
							e.printStackTrace();
						}
						
						
						
			}
			else{
				String usern = request.getParameter("username");
				String icode_sub = request.getParameter("identifyingcode");
				String pwd = request.getParameter("t_UserPwd");
				String icode = (String) Hsession.getAttribute("icode");
				if(icode.equals(icode_sub)){
					Hsession.removeAttribute("icode");
					ud.uppassword(username, pwd);
					response.sendRedirect("login.jsp");
				}
				else{
					System.out.println("ss");
					request.setAttribute("faile", "faile");//
					RequestDispatcher forword = request.getRequestDispatcher("mailpw.jsp");
					forword.forward(request, response);
				}
				
				
				
			}			
		}
		else{
			request.setAttribute("faile", "faile");//
			RequestDispatcher forword = request.getRequestDispatcher("mailpw.jsp");
			forword.forward(request, response);
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
