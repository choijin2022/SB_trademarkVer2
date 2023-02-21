package com.cji.exam.trademark.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartRequest;

import com.cji.exam.trademark.service.MemberService;
import com.cji.exam.trademark.service.MemoService;
import com.cji.exam.trademark.util.Utility;
import com.cji.exam.trademark.vo.Member;
import com.cji.exam.trademark.vo.Memo;
import com.cji.exam.trademark.vo.ResultData;
import com.cji.exam.trademark.vo.Rq;

@Controller
public class UserMemoController {

	private MemoService memoService;
	private Rq rq;

	@Autowired
	public UserMemoController(MemoService memoService, Rq rq) {
		this.memoService = memoService;
		this.rq = rq;
	}



	@RequestMapping("/usr/memo/doWrite")
	@ResponseBody
	public ResultData<Memo> doWrite(int projectId, String memoCode, String body) {

		if (Utility.empty(body)) {
			return ResultData.from("F-1","내용을 입력해주세요");
		}

		Memo memo = memoService.writeMemo(rq.getLoginedMemberId(),memoCode, projectId, body);


		return ResultData.from("S-1", "메모 저장 성공", "memo", memo);
	}

	
/*
	@RequestMapping("/usr/memo/doDelete")
	@ResponseBody
	public String doDelete(int id) {

		Memo memo = memoService.getMemo(id);

		ResultData actorCanMDRd = memoService.actorCanMD(rq.getLoginedMemberId(), memo);

		if (actorCanMDRd.isFail()) {
			return Utility.jsHistoryBack(actorCanMDRd.getMsg());
		}

		memoService.deleteMemo(id);

		return Utility.jsReplace(Utility.f("%d번 게시물을 삭제했습니다", id), "list?boardId=1");
	}

	@RequestMapping("/usr/memo/modify")
	public String showModify(Model model, int id) {

		Memo memo = memoService.getForPrintMemo(rq.getLoginedMemberId(), id);

		ResultData actorCanMDRd = memoService.actorCanMD(rq.getLoginedMemberId(), memo);

		if (actorCanMDRd.isFail()) {
			return rq.jsReturnOnView(actorCanMDRd.getMsg(), true);
		}

		model.addAttribute("memo", memo);

		return "usr/memo/modify";
	}

	@RequestMapping("/usr/memo/doModify")
	@ResponseBody
	public String doModify(int id, String title, String body) {

		Memo memo = memoService.getMemo(id);

		ResultData actorCanMDRd = memoService.actorCanMD(rq.getLoginedMemberId(), memo);

		if (actorCanMDRd.isFail()) {
			return Utility.jsHistoryBack(actorCanMDRd.getMsg());
		}

		memoService.modifyMemo(id, title, body);

		return Utility.jsReplace(Utility.f("%d번 게시물을 수정했습니다", id), Utility.f("detail?id=%d", id));
	}

	
*/
	

}