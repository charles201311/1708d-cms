package com.bobo.cms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 
 * @ClassName: ArticleController 
 * @Description: TODO
 * @author: charles
 * @date: 2019年12月11日 上午11:23:02
 */
@RequestMapping("article")
@Controller
public class ArticleController {


	@GetMapping("selects")
	public String selects() {
		return "admin/article/articles";
		
	}
	
	
	

}
