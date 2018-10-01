package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class EncodingFileter
 */
@WebFilter("/*")
public class EncodingFileter implements Filter {
       
    /**
     * @see Filter#Filter()
     */
    public EncodingFileter() {
      
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		
			HttpServletRequest request1 = (HttpServletRequest) request;
		  HttpServletResponse response1 = (HttpServletResponse) response;
		  request1.setCharacterEncoding("utf-8");
		  response1.setCharacterEncoding("utf-8");
		  response1.setContentType("text/html;charset=UTF-8");
		
		
		
		// pass the request along the filter chain
		chain.doFilter(request1, response1);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
