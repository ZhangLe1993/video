package com.video.domain.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.video.domain.entity.Video;

public interface VideoMapper {
    int deleteByPrimaryKey(String videoId);

    int insert(Video record);

    int insertSelective(Video record);

    Video selectByPrimaryKey(String videoId);

    int updateByPrimaryKeySelective(Video record);

    int updateByPrimaryKey(Video record);
    
    List<Video> selectAll(@Param("limit") int limit,@Param("offset") int offset);
    
    List<Video> selectChanelType(@Param("limit") int limit,@Param("offset") int offset,@Param("channelType") String channelType);
    
    int countVideo();
    
    List<Video> selectAllBySearch(@Param("start") String start,@Param("end") String end,@Param("search") String search);
    
    int updateState(Video record);
    
    int batchDeleteVideo(@Param("videoIds") String [] videoIds);
    
    List<Video> selectMore(@Param("limit") int limit,@Param("offset") int offset,@Param("channelType") String channelType,@Param("videoType") String videoType,@Param("videoSource") String videoSource);
    
    int countMore(@Param("channelType") String channelType,@Param("videoType") String videoType,@Param("videoSource") String videoSource);
    
    int updateDownCount(Video record);
    
    List<Video> selectKey(@Param("limit") int limit,@Param("offset") int offset,@Param("keyword") String keyword);
    
    int countKey(@Param("keyword") String keyword);
}