package com.video.domain.dao;

import com.video.domain.entity.UserUploadVideoRecord;

public interface UserUploadVideoRecordMapper {
    int deleteByPrimaryKey(String id);

    int insert(UserUploadVideoRecord record);

    int insertSelective(UserUploadVideoRecord record);

    UserUploadVideoRecord selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(UserUploadVideoRecord record);

    int updateByPrimaryKey(UserUploadVideoRecord record);
}