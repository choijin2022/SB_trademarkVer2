package com.cji.exam.trademark.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cji.exam.trademark.service.MemberService;
import com.cji.exam.trademark.service.NoticeService;
import com.cji.exam.trademark.util.Utility;
import com.cji.exam.trademark.vo.Member;
import com.cji.exam.trademark.vo.Notice;
import com.cji.exam.trademark.vo.Rq;

@Controller
public class UsrHomeController {
	
	private MemberService memberService;
	private Rq rq;
	private NoticeService noticeService;
	
	@Autowired
	public UsrHomeController(MemberService memberService, Rq rq,NoticeService noticeService) {
		this.memberService = memberService;
		this.rq = rq;
		this.noticeService = noticeService;
	}
	
	@RequestMapping("/usr/home/main")
	public String showMain(Model model) {
		List<Notice> notices = new ArrayList<>();
		
		notices = noticeService.getNotices();
		model.addAttribute("notices", notices);
		
		return "usr/home/main";
	}
	
	@RequestMapping("/")
	public String showRoot() {
		return "redirect:/usr/home/main";
	}
	
	@RequestMapping("/usr/home/doLogin")
	@ResponseBody
	public String doLogin(String loginId, String loginPw) {

		if (Utility.empty(loginId)) {
			return Utility.jsHistoryBack("아이디를 입력해주세요");
		}
		if (Utility.empty(loginPw)) {
			return Utility.jsHistoryBack("비밀번호를 입력해주세요");
		}

		Member member = memberService.getMemberByLoginId(loginId);

		if (member == null) {
			return Utility.jsHistoryBack("존재하지 않는 아이디입니다");
		}
		
		if (member.getLoginPw().equals(loginPw) == false) {
			return Utility.jsHistoryBack("비밀번호가 일치하지 않습니다");
		}

		if (member.isDelStatus() == true) {
			return Utility.jsHistoryBack("사용할 수 없는 계정입니다");
		}
		
		rq.login(member);

		return Utility.jsReplace(Utility.f("%s님 환영합니다", member.getNickname()), "/");
	}
}