package com.bobo.cms.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bobo.cms.domain.User;
import com.bobo.cms.service.UserService;
import com.github.pagehelper.PageInfo;
/**
 * 
 * @ClassName: UserController 
 * @Description: 
 * @author: charles
 * @date: 2019年12月10日 下午3:21:05
 */
@RequestMapping("user")
@Controller
public class UserController {
	@Resource
	private UserService userService;
	
	@GetMapping("selects")
	public String selects(Model model,String name,
			@RequestParam(defaultValue = "1")Integer page,
			@RequestParam(defaultValue = "3")Integer pageSize) {
		PageInfo<User> info = userService.selects(name, page, pageSize);
		model.addAttribute("info", info);
		model.addAttribute("name", name);
		
		return "admin/user/users";
	}

}
