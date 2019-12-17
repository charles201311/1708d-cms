package com.bobo.cms.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
/**
 * 
 * @ClassName: UserInterceptor 
 * @Description: 管理员后台拦截器,只拦截进入管理员后台的用户
 * @author: charles
 * @date: 2019年12月17日 下午3:19:53
 */
public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		 //规则 : 如果用户已经登录,则不拦截
		
		HttpSession session = request.getSession(false);
	   if(null!=session) {
		   //从session获取普通用户的user对象
		   Object object = session.getAttribute("admin");
		   if(null!=object)//如果不为空,则返回true
			  return true;//放行
	   }
	   
	   //不符合要求,转发到登录页面
	   request.setAttribute("error", "权限不符合,请重新登录");
	   request.getRequestDispatcher("/WEB-INF/view/passport/login.jsp").forward(request, response);	
	   
	   return false;
		
	}	
}
