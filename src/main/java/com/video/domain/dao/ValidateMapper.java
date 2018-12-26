package com.video.domain.dao;

import com.video.domain.entity.Validate;

public interface ValidateMapper {
    int deleteByPrimaryKey(String infoId);

    int insert(Validate record);

    int insertSelective(Validate record);

    Validate selectByPrimaryKey(String infoId);
    
    Validate selectRandom();

    int updateByPrimaryKeySelective(Validate record);

    int updateByPrimaryKey(Validate record);
}