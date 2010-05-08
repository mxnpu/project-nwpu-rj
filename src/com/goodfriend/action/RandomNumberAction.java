package com.goodfriend.action;

import java.io.ByteArrayInputStream;

import com.goodfriend.util.RandomNumberUtil;
import com.opensymphony.xwork2.ActionContext;

public class RandomNumberAction {
	private static final long serialVersionUID = 1L;
	private ByteArrayInputStream inputStream;

	public String execute() throws Exception {
		RandomNumberUtil randomNumUtil = RandomNumberUtil.getInstance();
		this.setInputStream(randomNumUtil.getImage());// 取得带有随机字符串的图片
		ActionContext.getContext().getSession().put("random", randomNumUtil.getString());// 取得随机字符串放入HttpSession
		return "success";
	}

	public void setInputStream(ByteArrayInputStream inputStream) {
		this.inputStream = inputStream;
	}

	public ByteArrayInputStream getInputStream() {
		return inputStream;
	}
}
