package com.bobo.cms.dao;

import java.util.List;

import com.bobo.cms.domain.User;

public interface UserMapper {
	/**
	 * 
	 * @Title: selects 
	 * @Description: TODO
	 * @param name
	 * @return
	 * @return: List<User>
	 */
	List<User> selects(String name);
	
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);
  // 支持动态SQL
    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}