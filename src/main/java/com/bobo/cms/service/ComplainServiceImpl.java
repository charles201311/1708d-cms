package com.bobo.cms.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bobo.cms.dao.ArticleMapper;
import com.bobo.cms.dao.ComplainMapper;
import com.bobo.cms.domain.Complain;
@Service
public class ComplainServiceImpl implements ComplainService {
	@Resource
	private ComplainMapper complainMapper;
	@Resource
	private ArticleMapper articleMapper;

	@Override
	public boolean insert(Complain complain) {
		try {
			//举报
			complainMapper.insert(complain);
			//增加次数
			articleMapper.updateComplainnum(complain.getArticleId());
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("举报失败");
			
		}
	
	}

}
