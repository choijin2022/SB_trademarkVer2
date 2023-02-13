package com.cji.exam.trademark.vo;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;

import com.cji.exam.trademark.util.Utility;

@Component
@Scope(value = "request", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class Rq {
	
	private HttpServletRequest req;
	private HttpServletResponse resp;
	private HttpSession session;
	
	public Rq(HttpServletRequest req, HttpServletResponse resp) {
		this.req = req;
		this.resp = resp;
		this.session = req.getSession();
	}
	
	public void jsPrintHistoryBack(String msg) {
		resp.setContentType("text/html; charset=UTF-8");
		
		print(Utility.jsHistoryBack(msg));
	}

	private void print(String str) {
		try {
			resp.getWriter().append(str);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public String jsReturnOnView(String msg, boolean historyBack) {
		req.setAttribute("msg", msg);
		req.setAttribute("historyBack", historyBack);
		return "usr/common/js";
	}
}
