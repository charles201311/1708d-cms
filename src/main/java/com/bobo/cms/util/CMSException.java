package com.bobo.cms.util;

/**
 * 
 * @ClassName: CMSException
 * @Description: 自定义异常.
 * @author: charles
 * @date: 2019年12月17日 上午11:00:54
 */
public class CMSException extends RuntimeException {

	/**
	 * @fieldName: serialVersionUID
	 * @fieldType: long
	 * @Description: TODO
	 */
	private static final long serialVersionUID = 1L;

	
	public CMSException() {

	}

	public CMSException(String message) {
		super(message);
	}
}
