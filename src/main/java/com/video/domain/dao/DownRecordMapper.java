package com.video.domain.dao;

import com.video.domain.entity.DownRecord;

public interface DownRecordMapper {
    int deleteByPrimaryKey(String id);

    int insert(DownRecord record);

    int insertSelective(DownRecord record);

    DownRecord selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(DownRecord record);

    int updateByPrimaryKey(DownRecord record);
}