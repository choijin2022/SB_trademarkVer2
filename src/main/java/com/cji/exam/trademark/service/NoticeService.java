package com.cji.exam.trademark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cji.exam.trademark.repository.NoticeRepository;
import com.cji.exam.trademark.vo.Notice;

@Service
public class NoticeService {
	private NoticeRepository noticeRepository;
	
	@Autowired
	public NoticeService(NoticeRepository noticeRepository) {
		this.noticeRepository = noticeRepository;
	}
	public List<Notice> getNotices() {
		return noticeRepository.getNotices();
	}
	
}
