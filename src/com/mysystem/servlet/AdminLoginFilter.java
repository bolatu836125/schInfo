package com.mysystem.servlet;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminLoginFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		 HttpServletResponse response = (HttpServletResponse) arg1;    
         HttpServletRequest request=(HttpServletRequest)arg0;  
         HttpSession session = request.getSession(true);    
                String username = (String) session.getAttribute("username");//  
                String url=request.getRequestURI();  
                 if(username==null || username.equals(""))  
               {  
                     //判断获取的路径不为空且不是访问登录页面或执行登录操作时跳转  
                   if(url!=null && !url.equals("") && ( url.indexOf("Login")<0 && url.indexOf("login")<0 ))  
                     {  
                       response.sendRedirect("/schInfo/login1.jsp");  
                        return ;  
                   }             
              }  
                  //已通过验证，用户访问继续  
                 arg2.doFilter(arg0, arg1);  
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
