package com.bobo.cms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
//127.0.0.1/admin
//127.0.0.1/admin/
//127.0.0.1/admin/index 三种方式都可以进入 index页面
@RequestMapping("admin")
@Controller
public class AdminController {

	@RequestMapping(value = {"/","index",""})
	public String index() {
		return "admin/index";
		
	}
}
