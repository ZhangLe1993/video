package com.video.domain.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.video.domain.dao.DownRecordMapper;
import com.video.domain.entity.DownRecord;
import com.video.domain.service.DownRecordService;

@Service
public class DownRecordServiceImpl implements DownRecordService {
	
	@Autowired
	private DownRecordMapper downRecordMapper;

	@Override
	public int deleteByPrimaryKey(String Id) {
		return downRecordMapper.deleteByPrimaryKey(Id);
	}

	@Override
	public int insert(DownRecord record) {
		return downRecordMapper.insert(record);
	}

	@Override
	public int insertSelective(DownRecord record) {
		return downRecordMapper.insertSelective(record);
	}

	@Override
	public DownRecord selectByPrimaryKey(String Id) {
		return downRecordMapper.selectByPrimaryKey(Id);
	}

	@Override
	public int updateByPrimaryKeySelective(DownRecord record) {
		return downRecordMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(DownRecord record) {
		return downRecordMapper.updateByPrimaryKey(record);
	}
}
