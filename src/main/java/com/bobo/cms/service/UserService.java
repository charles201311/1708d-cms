package com.bobo.cms.service;

import java.util.List;

import com.bobo.cms.domain.User;
import com.github.pagehelper.PageInfo;

public interface UserService {
	
	/**
	 * 
	 * @Title: selects 
	 * @Description: 模糊查询
	 * @param name
	 * @param page
	 * @param pageSize
	 * @return
	 * @return: PageInfo<User>
	 */
	PageInfo<User> selects(String name,Integer page,Integer pageSize);
	/**
	 * 修改
	 * @Title: updateByPrimaryKeySelective 
	 * @Description: TODO
	 * @param record
	 * @return
	 * @return: int
	 */
	 int updateByPrimaryKeySelective(User record);

}
