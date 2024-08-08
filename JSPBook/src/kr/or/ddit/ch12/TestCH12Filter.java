package kr.or.ddit.ch12;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class TestCH12Filter implements Filter {
	private FilterConfig filterConfig = null;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("Filter02 초기화...!");
		
		this.filterConfig = filterConfig;
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("Filter02 수행...!");
		
		request.setCharacterEncoding("UTF-8");
		
		String authParam = filterConfig.getInitParameter("auth");
		
		HttpServletRequest req = (HttpServletRequest) request;
		Principal princ = req.getUserPrincipal();
		String authentiId = princ.getName();
		if(req.isUserInRole(authParam) && authentiId.equals("admin")) {
			request.setAttribute("authValue", "현재 접속중인 계정은 관리자(admin) 권한을 가지고 접근중 입니다..");
			chain.doFilter(request, response);
		}else {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=utf-8");
			
			PrintWriter pw = response.getWriter();
			pw.println("접근 권한이 다릅니다! 다시 시도해주세요!");
			pw.println("<a href='/ch12/ch12_test.jsp' class='btn btn-primary'></a>");
			pw.flush();
			pw.close();
			return;
		}
		
	}

	@Override
	public void destroy() {
		System.out.println("Filter02 소멸...!");

	}

}
