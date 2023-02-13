package com.cji.exam.trademark.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cji.exam.trademark.vo.Trademark;

@Mapper
public interface TrademarkRepository {

	public void storedTrademark(Trademark trademark);

	public int getTrademarkCount();

	public List<Trademark> getTrademarks(int projectId);

	public int getLastInsertId();

	public void createConnectTrademark(int trademarkId, int projectId);
}
