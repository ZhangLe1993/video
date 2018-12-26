package com.video.domain.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.video.domain.dao.ValidateMapper;
import com.video.domain.entity.Validate;
import com.video.domain.service.ValidateService;

@Service
public class ValidateServiceImpl implements ValidateService {
	
	@Autowired
	private ValidateMapper validateMapper;

	@Override
	public int deleteByPrimaryKey(String infoId) {
		return validateMapper.deleteByPrimaryKey(infoId);
	}

	@Override
	public int insert(Validate record) {
		return validateMapper.insert(record);
	}

	@Override
	public int insertSelective(Validate record) {
		return validateMapper.insertSelective(record);
	}

	@Override
	public Validate selectByPrimaryKey(String infoId) {
		return validateMapper.selectByPrimaryKey(infoId);
	}

	@Override
	public int updateByPrimaryKeySelective(Validate record) {
		return validateMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Validate record) {
		return validateMapper.updateByPrimaryKey(record);
	}

	@Override
	public Validate selectRandom() {
		return validateMapper.selectRandom();
	}

}
