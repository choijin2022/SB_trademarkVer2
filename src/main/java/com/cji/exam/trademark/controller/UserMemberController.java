package com.cji.exam.trademark.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartRequest;

import com.cji.exam.trademark.service.MemberService;
import com.cji.exam.trademark.util.Utility;
import com.cji.exam.trademark.vo.Member;
import com.cji.exam.trademark.vo.ResultData;
import com.cji.exam.trademark.vo.Rq;

@Controller
public class UserMemberController {
	
	private MemberService memberService;
	private Rq rq;
	
	@Autowired
	public UserMemberController(MemberService memberService, Rq rq) {
		this.memberService = memberService;
		this.rq = rq;
	}
	
	@RequestMapping("/usr/member/join")
	public String showJoin() {
		return "usr/member/join";
	}
	@RequestMapping("/usr/member/doJoin")
	@ResponseBody
	public String doJoin(String loginId, String loginPw, String name, String nickname, String cellphoneNum,
			String email) {

		if (Utility.empty(loginId)) {
			return Utility.jsHistoryBack("아이디를 입력해주세요");
		}
		if (Utility.empty(loginPw)) {
			return Utility.jsHistoryBack("비밀번호를 입력해주세요");
		}
		if (Utility.empty(name)) {
			return Utility.jsHistoryBack("이름을 입력해주세요");
		}
		if (Utility.empty(nickname)) {
			return Utility.jsHistoryBack("닉네임을 입력해주세요");
		}
		if (Utility.empty(cellphoneNum)) {
			return Utility.jsHistoryBack("전화번호를 입력해주세요");
		}
		if (Utility.empty(email)) {
			return Utility.jsHistoryBack("이메일을 입력해주세요");
		}
		
		ResultData<Integer> doJoinRd = memberService.doJoin(loginId, loginPw, name, nickname, cellphoneNum, email);

		if (doJoinRd.isFail()) {
			return Utility.jsHistoryBack(doJoinRd.getMsg());
		}
		
		int newMemberId = (int) doJoinRd.getBody().get("id");
		
		
		
		return Utility.jsReplace(doJoinRd.getMsg(), "/");
	
	}
	
	@RequestMapping("/usr/member/login")
	public String showLogin() {
		return "usr/member/login";
	}
	
	
	@RequestMapping("/usr/member/doLogin")
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
