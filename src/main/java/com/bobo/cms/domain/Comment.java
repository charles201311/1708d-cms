package com.bobo.cms.domain;

import java.util.Date;

/**
  * 
  * @ClassName: Comment 
  * @Description: 评论
  * @author: charles
  * @date: 2019年12月19日 下午6:16:57
  */
public class Comment {

	private Integer id;
	private Integer userId;
	private String content;
	private Date created;//评论时间
	private Integer articleId;//文章 
	
	private Article article;
	
	
	
	public Article getArticle() {
		return article;
	}
	public void setArticle(Article article) {
		this.article = article;
	}
	private User user;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public Integer getArticleId() {
		return articleId;
	}
	public void setArticleId(Integer articleId) {
		this.articleId = articleId;
	}
	
	
}
