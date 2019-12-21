package com.bobo.cms.dao;

import java.util.List;

import com.bobo.cms.domain.Complain;
import com.bobo.cms.vo.ComplainVO;

public interface ComplainMapper {
	
	int insert(Complain complain);
	
	//查询举报
	List<Complain> selects(ComplainVO complainVO);

}
