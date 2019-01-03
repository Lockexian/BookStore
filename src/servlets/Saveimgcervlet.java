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

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.Bookdao;
/**
 * Servlet implementation class Saveimgcervlet
 */
@WebServlet("/Saveimgcervlet")
public class Saveimgcervlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Saveimgcervlet() {
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
		
		HttpSession session =  request.getSession();
		
		String addbook = (String) session.getAttribute("addbook");
		Bookdao bd =new Bookdao();
		int bookid = bd.getMaxBookId();
		if(addbook.equals("book")){
			bookid--;
			session.removeAttribute("addbook");
		}
	
	
		
		
		//获取图片
		DiskFileItemFactory factory = new DiskFileItemFactory();
	    //获取文件需要上传到的路径
	    String path = request.getRealPath("/upload1");//getContextPath
	    factory.setRepository(new File(path));
	    String realpath = request.getRealPath("/bookimages");
	    
	    
        //设置 缓存的大小，当上传文件的容量超过该缓存时，直接放到 暂时存储室
        factory.setSizeThreshold(1024*1024) ;
        //高水平的API文件上传处理
        ServletFileUpload upload = new ServletFileUpload(factory);
	    
        try {
        	 List<FileItem> list = (List<FileItem>)upload.parseRequest(request);
        	  for(FileItem item : list){
                  //获取表单的属性名字
                  String name = item.getFieldName();
                  //如果获取的 表单信息是普通的 文本 信息
                  if(item.isFormField()){
                      //获取用户具体输入的字符串 ，名字起得挺好，因为表单提交过来的是 字符串类型的
                      String value = item.getString() ;
                      request.setAttribute(name, value);
                  }else{//对传入的非 简单的字符串进行处理 ，比如说二进制的 图片，电影这些
                      /**
                       * 以下三步，主要获取 上传文件的名字
                       */
                      //获取路径名
                      String value = item.getName() ;
                      //索引到最后一个反斜杠
                      int start = value.lastIndexOf("\\");
                      //截取 上传文件的 字符串名字，加1是 去掉反斜杠，
                      String filename = value.substring(start+1);
                      request.setAttribute(name, filename);
                      String ename = null;
                      if(filename.endsWith("jpg")||filename.endsWith("JPG")){
                    	  ename = "jpg";
                      }
                      
                    	  
                      //真正写到磁盘上
                      //它抛出的异常 用exception 捕捉
                      //item.write( new File(path,filename) );//第三方提供的
                      //手动写的
                      OutputStream out = new FileOutputStream(new File(realpath,bookid+"."+ename));
                      InputStream in = (InputStream) item.getInputStream() ;
                      int length = 0 ;
                      byte [] buf = new byte[1024] ;
                      //System.out.println("获取上传文件的总共的容量："+item.getSize());
                      // in.read(buf) 每次读到的数据存放在   buf 数组中
                      while( (length = in.read(buf) ) != -1){
                          //在   buf 数组中 取出数据 写到 （输出流）磁盘上
                          out.write(buf, 0, length);
                      }
                      in.close();
                      out.close();
                  }
              }
        	 
        	 
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	      	    
		
        if(addbook.equals("book")){
			session.setAttribute("addbook", "book");
			response.sendRedirect("management.jsp");
		}
		else{
			session.setAttribute("addbook", "false");
			response.sendRedirect("addbook.jsp");
		}
             
        
	}

}
