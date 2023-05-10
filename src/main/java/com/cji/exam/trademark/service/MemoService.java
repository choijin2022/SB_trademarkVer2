package com.cji.exam.trademark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cji.exam.trademark.repository.MemoRepository;
import com.cji.exam.trademark.vo.Memo;
import com.cji.exam.trademark.vo.ProjectVo;
import com.cji.exam.trademark.vo.ResultData;

@Service
public class MemoService {
	
	private MemoRepository memoRepository;
	
	@Autowired
	public MemoService(MemoRepository memoRepository) {
		this.memoRepository = memoRepository;
		
	}
	
	public Memo writeMemo(int loginedMemberId, String memoCode, int projectId, String body) {
		Memo memo = new Memo();
		int memoId;
		memo = getMemoByProjectId(projectId);
		String memoBody = body.trim();
		if(memo == null) {
			memoRepository.writeMemo(loginedMemberId,memoCode, projectId, memoBody);
			memoId = memoRepository.getLastInsertId();
		}
		else {
			memoId = memo.getId();
			if(memoBody == null) {
				memoRepository.deleteMemo(memoId);
			}else {
				memoRepository.updateMemoBody(memoId,memoBody);
				
			}
		}
		
		return memoRepository.getMemoById(memoId);
	}

	public List<Memo> getMemosByMemberId(int loginedMemberId) {
		
		return memoRepository.getMemosByMemberId(loginedMemberId);
	}

	public Memo getMemoByProjectId(int projectId) {
		return memoRepository.getMemoByProjectId(projectId);
	}

	public List<String> getMemoBodysByMemberId(int loginedMemberId) {
		
		List<String> memoBodys = memoRepository.getMemoBodysByMemberId(loginedMemberId);
		
		return memoBodys;
	}

	public void deleteMemo(int memoId) {
		memoRepository.deleteMemo(memoId);
		
	}

	public void updateMemoBody(int memoId, String memoBody) {
		memoRepository.updateMemoBody(memoId,memoBody);
		
	}


}
