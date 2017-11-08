package com.auuid.security;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

/**
 * Servlet Filter implementation class SecurityFilter
 */
public class SecurityFilter implements Filter {

	private WebApplicationContext wac;
	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpSession session = ((HttpServletRequest)request).getSession();
		if (session.getAttribute("user") != null) {
			chain.doFilter(request, response);
		} else {
			String url = ((HttpServletRequest)request).getRequestURI();
			((HttpServletResponse)response).sendRedirect("/loginView" + url);
		}
		
	}

	@Override
	public void init(FilterConfig fConfig) throws ServletException { 
		this.wac = WebApplicationContextUtils .getWebApplicationContext(fConfig.getServletContext());
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
	}

}
