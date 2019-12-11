package com.bobo.cms.service;

import com.bobo.cms.domain.Article;
import com.github.pagehelper.PageInfo;

public interface ArticleService {
	
	/**
	 * 
	 * @Title: selects 
	 * @Description: TODO
	 * @param article
	 * @param page
	 * @param pageSize
	 * @return
	 * @return: PageInfo<Article>
	 */
	PageInfo<Article> selects(Article article,Integer page,Integer pageSize);

}
