package com.bobo.cms.vo;

import com.bobo.cms.domain.Complain;

public class ComplainVO extends Complain{
	
	private Integer startNum;//举报开始次数
	private Integer endNum;////举报结束次数
	private String startTime;//举报时间开始
	private String endTime;//举报时间结束
	
	private String orderName;//排序名稱
	private String orderMethod;//排序方法、、 asc,desc
	
	
	
	
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getOrderMethod() {
		return orderMethod;
	}
	public void setOrderMethod(String orderMethod) {
		this.orderMethod = orderMethod;
	}
	public Integer getStartNum() {
		return startNum;
	}
	public void setStartNum(Integer startNum) {
		this.startNum = startNum;
	}
	public Integer getEndNum() {
		return endNum;
	}
	public void setEndNum(Integer endNum) {
		this.endNum = endNum;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
	

}
