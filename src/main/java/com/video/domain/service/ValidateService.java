package com.video.domain.service;

import com.video.domain.entity.Validate;

public interface ValidateService {
    int deleteByPrimaryKey(String infoId);

    int insert(Validate record);

    int insertSelective(Validate record);

    Validate selectByPrimaryKey(String infoId);
    
    Validate selectRandom();

    int updateByPrimaryKeySelective(Validate record);

    int updateByPrimaryKey(Validate record);
}