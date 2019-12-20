package com.bobo.cms.domain;
/**
 * 举报文章
 * @ClassName: Complain 
 * @Description: TODO
 * @author: charles
 * @date: 2019年12月20日 下午4:01:43
 */
public class Complain {
	
	
	private Integer id;
	private String typename;//举报类型
	private String content;//举报内容
	private Integer articleId;//被举报的文章
	private String picurl;//举报图片
	
	private  Integer user_id;//举报人人ID
	
	private  String created;//举报时间
	
	private Article article;
	private User user;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getArticleId() {
		return articleId;
	}
	public void setArticleId(Integer articleId) {
		this.articleId = articleId;
	}
	public String getPicurl() {
		return picurl;
	}
	public void setPicurl(String picurl) {
		this.picurl = picurl;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public Article getArticle() {
		return article;
	}
	public void setArticle(Article article) {
		this.article = article;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	

}
