package com.video.domain.service;

import java.util.List;

import com.video.domain.entity.Video;

public interface VideoService {
    int deleteByPrimaryKey(String videoId);

    int insert(Video record);

    int insertSelective(Video record);

    Video selectByPrimaryKey(String videoId);

    int updateByPrimaryKeySelective(Video record);

    int updateByPrimaryKey(Video record);
    
    public List<Video> getAll(int limit,int offset);
    
    public List<Video> selectChanelType(int limit,int offset,String channelType);
    
    int countVideo();
    
    List<Video> selectAllBySearch(String start,String end,String search);
    
    int updateState(Video record);
    
    int batchDeleteVideo(String [] videoIds);
    
    public List<Video> selectMore(int limit,int offset,String channelType,String videoType,String videoSource);
   
    int countMore(String channelType,String videoType,String videoSource);
    
    int updateDownCount(Video record);
    
    public List<Video> selectKey(int limit,int offset,String keyword);
    
    int countKey(String keyword);
}
