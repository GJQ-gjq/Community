package com.community.dao;

import java.util.List;

import com.community.entity.Video;

public interface VideoDAO {
	public int insert(String url);
	public List<Video> qureyTwo();
}
