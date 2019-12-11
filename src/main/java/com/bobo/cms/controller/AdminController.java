package com.bobo.cms.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bobo.cms.domain.Article;
import com.bobo.cms.domain.User;
import com.bobo.cms.service.ArticleService;
import com.bobo.cms.service.UserService;
import com.github.pagehelper.PageInfo;

//127.0.0.1/admin
//127.0.0.1/admin/
//127.0.0.1/admin/index 三种方式都可以进入 index页面
@RequestMapping("admin")
@Controller
public class AdminController {
	@Resource
	private UserService userService;
	@Resource
	private ArticleService articleService;

	/**
	 * 
	 * @Title: index
	 * @Description: 进入admin后台首页
	 * @return
	 * @return: String
	 */
	@RequestMapping(value = { "/", "index", "" })
	public String index() {
		return "admin/index";
	}
	
	/**
	 * 
	 * @Title: articles 
	 * @Description: 文章列表
	 * @param model
	 * @param article
	 * @param page
	 * @param pageSize
	 * @return
	 * @return: String
	 */
	@GetMapping("article/selects")
	public String articles(Model model, Article article, @RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "3") Integer pageSize) {
		//默认文章审核状态为 待审
		if(article.getStatus()==null) {
			article.setStatus(0);
		}
		
		
		PageInfo<Article> info = articleService.selects(article, page, pageSize);
		model.addAttribute("info", info);
		model.addAttribute("article", article);
		return "admin/article/articles";
		
	}

	/**
	 * 
	 * @Title: selects
	 * @Description: 用户列表
	 * @param model
	 * @param username
	 * @param page
	 * @param pageSize
	 * @return
	 * @return: String
	 */
	@GetMapping("user/selects")
	public String selects(Model model, String username, @RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "3") Integer pageSize) {
		PageInfo<User> info = userService.selects(username, page, pageSize);
		model.addAttribute("info", info);
		model.addAttribute("username", username);

		return "admin/user/users";
	}

	/**
	 * 
	 * @Title: update
	 * @Description: 修改用户
	 * @param user
	 * @return
	 * @return: boolean
	 */
	@ResponseBody
	@PostMapping("user/update")
	public boolean update(User user) {
		return userService.updateByPrimaryKeySelective(user) > 0;
	}
	
	

}
