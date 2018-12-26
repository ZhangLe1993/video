package com.video.domain.dao;

import com.video.domain.entity.AccountUploadVideoRecord;

public interface AccountUploadVideoRecordMapper {
    int deleteByPrimaryKey(String id);

    int insert(AccountUploadVideoRecord record);

    int insertSelective(AccountUploadVideoRecord record);

    AccountUploadVideoRecord selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(AccountUploadVideoRecord record);

    int updateByPrimaryKey(AccountUploadVideoRecord record);
}