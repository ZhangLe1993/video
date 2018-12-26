package com.video.domain.service;

import com.video.domain.entity.DownRecord;

public interface DownRecordService {
    int deleteByPrimaryKey(String Id);

    int insert(DownRecord record);

    int insertSelective(DownRecord record);

    DownRecord selectByPrimaryKey(String Id);

    int updateByPrimaryKeySelective(DownRecord record);

    int updateByPrimaryKey(DownRecord record);
}