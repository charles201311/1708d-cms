package com.bobo.cms.util;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.bobo.cms.dao.UserMapper;
import com.bobo.cms.domain.User;

/**
 * 
 * @ClassName: UserInterceptor
 * @Description: 用户拦截器,只拦截进入个人中心的用户
 * @author: charles
 * @date: 2019年12月17日 下午3:19:53
 */
public class UserInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 规则 : 如果用户已经登录,则不拦截

		HttpSession session = request.getSession(false);
		if (null != session) {
			// 从session获取普通用户的user对象
			Object object = session.getAttribute("user");
			if (null != object)// 如果不为空,则返回true
				return true;// 放行
		}

		// 如果用户存cookie了,并和数据库的账户密码匹配则不拦截
		if(rememberAutoLogin(request,request.getSession()))
			return true;
			
		// 不符合要求,转发到登录页面
		request.setAttribute("error", "权限不符合,请重新登录");
		request.getRequestDispatcher("/WEB-INF/view/passport/login.jsp").forward(request, response);

		return false;

	}

	@Resource
	private UserMapper userMapper;

	private boolean rememberAutoLogin(HttpServletRequest request,HttpSession session) {
		Cookie cokUsername = CookieUtil.getCookieByName(request, "username");
		Cookie cokPassword = CookieUtil.getCookieByName(request, "password");
		// 从cookie获取用户名和密码
		if (null != cokUsername && null != cokPassword && null != cokUsername.getValue()
				&& null != cokPassword.getValue()) {
			String username = cokUsername.getValue();
			String password = cokPassword.getValue();
			// 从数据库获取用户名和密码并和cookie的比较。若一直则返回true
			User user = userMapper.selectByName(username);
			if (null != user && username.equals(user.getUsername()) && password.equals(user.getPassword())) {
				///系统里面用到了session ,需要重新存储session
				session.setAttribute("user", user);
				
				return true;
			}
		}
		return false;

	}
}
