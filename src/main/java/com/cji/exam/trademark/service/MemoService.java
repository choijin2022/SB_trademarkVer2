package com.cji.exam.trademark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cji.exam.trademark.repository.MemoRepository;
import com.cji.exam.trademark.vo.Memo;
import com.cji.exam.trademark.vo.ResultData;

@Service
public class MemoService {
	
	private MemoRepository memoRepository;
	
	@Autowired
	public MemoService(MemoRepository memoRepository) {
		this.memoRepository = memoRepository;
		
	}
	
	public Memo writeMemo(int loginedMemberId, String memoCode, int projectId, String body) {
		memoRepository.writeMemo(loginedMemberId,memoCode, projectId,body  );
		int memoId = memoRepository.getLastInsertId();
		return memoRepository.getMemoById(memoId);
	}

	public List<Memo> getMemosByMemberId(int loginedMemberId) {
		// TODO Auto-generated method stub
		return null;
	}


}
