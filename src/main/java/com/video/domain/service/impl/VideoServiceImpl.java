package com.video.domain.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.video.domain.dao.VideoMapper;
import com.video.domain.entity.Video;
import com.video.domain.service.VideoService;

@Service
public class VideoServiceImpl implements VideoService{

	@Autowired
	private VideoMapper videoMapper;

	@Override
	public int deleteByPrimaryKey(String videoId) {
		return 0;
	}

	@Override
	public int insert(Video record) {
		return videoMapper.insert(record);
	}

	@Override
	public int insertSelective(Video record) {
		return videoMapper.insert(record);
	}

	@Override
	public Video selectByPrimaryKey(String videoId) {
		return videoMapper.selectByPrimaryKey(videoId);
	}

	@Override
	public int updateByPrimaryKeySelective(Video record) {
		return 0;
	}

	@Override
	public int updateByPrimaryKey(Video record) {
		return 0;
	}

	@Override
	public List<Video> getAll(int limit, int offset) {
		return videoMapper.selectAll(limit, offset);
	}

	@Override
	public int countVideo() {
		return videoMapper.countVideo();
	}

	@Override
	public List<Video> selectAllBySearch(String start, String end, String search) {
		return videoMapper.selectAllBySearch(start, end, search);
	}

	@Override
	public int updateState(Video record) {
		
		return videoMapper.updateState(record);
	}

	@Override
	public int batchDeleteVideo(String[] videoIds) {
		
		return videoMapper.batchDeleteVideo(videoIds);
	}

	@Override
	public List<Video> selectChanelType(int limit, int offset, String channelType) {
		return videoMapper.selectChanelType(limit, offset, channelType);
	}

	@Override
	public List<Video> selectMore(int limit, int offset, String channelType, String videoType, String videoSource) {
		return videoMapper.selectMore(limit, offset, channelType, videoType, videoSource);
	}

	@Override
	public int countMore(String channelType, String videoType, String videoSource) {
		return videoMapper.countMore(channelType, videoType, videoSource);
	}

	@Override
	public int updateDownCount(Video record) {
		return videoMapper.updateDownCount(record);
	}

	@Override
	public List<Video> selectKey(int limit, int offset, String keyword) {
		return videoMapper.selectKey(limit, offset, keyword);
	}

	@Override
	public int countKey(String keyword) {
		return videoMapper.countKey(keyword);
	}
}
