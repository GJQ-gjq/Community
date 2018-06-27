package com.community.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.dao.VideoDAO;
import com.community.entity.Video;
import com.community.service.VideoService;
@Service
public class VideoServiceImpl implements VideoService {
	@Autowired
	private VideoDAO videoDAO;
	@Override
	public int add(String url) {
		return videoDAO.insert(url);
	}

	@Override
	public List<Video> qureyTwo() {
		return videoDAO.qureyTwo();
	}

}
