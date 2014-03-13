package com.mysystem.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import com.bjsxt.model.User;
import com.bjsxt.util.DBUtils;

/**
 * Servlet implementation class loginServlet
 */
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
try{
	
			String user = request.getParameter("user");
	        String pass = request.getParameter("pass");
	        HttpSession session=request.getSession();
	        session.setAttribute("username",user);
		int count=this.getTotal(user, pass);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write(String.valueOf(count));
			
			
		} catch (Exception e) {
				e.printStackTrace();
		}
		
	}

	//查询登陆用户是否存在
	public int getTotal(String user,String pass) throws Exception {
		
		Connection conn = DBUtils.createConn();
		String sql = " select count(*) from user  where username='"+user+"' and password='"+pass+"'";		
		PreparedStatement ps = DBUtils.getPs(conn, sql);
		ResultSet rs = ps.executeQuery();		
		int count = 0 ;
		if(rs.next()){			
			count = rs.getInt(1);
		}
		return count;
	}

	
}
