package com.bobo.cms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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
	List<User> selects(@Param("username")String username);
	/**
	 * 按照用户查询
	 * @Title: selectByName 
	 * @Description: TODO
	 * @param name
	 * @return
	 * @return: User
	 */
	User selectByName(@Param("username")String name);
	
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);
  // 支持动态SQL
    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}