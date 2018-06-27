package com.community.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.community.entity.News;
import com.community.entity.Pager;
import com.community.entity.Video;
import com.community.service.NewsService;
import com.community.service.VideoService;



@Controller
@RequestMapping("/")
public class NewsController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private NewsService newsService;
	@Autowired
	private VideoService videoService;
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String index(Model model){
		List<News> newslist=newsService.getByType("notice");
		List<Video> vedios=videoService.qureyTwo();
		model.addAttribute("vedios", vedios);
		model.addAttribute("newslist", newslist);
		return "index";		
	}
		
	@RequestMapping(value="/news")
	public String news(String type,Model model){
		model.addAttribute("type", type);
		return "news";
	}
	
	@RequestMapping("/getNews")
	@ResponseBody
	public Map<String , Object> getNews(int pageNo,String type){
		Pager<News>	result=newsService.getAllByType(type, pageNo, 7);
		Map<String , Object > map=new HashMap<String, Object>();
		map.put("result", result);
		return map;
	}
	
	@RequestMapping(value="newsInfo", method=RequestMethod.GET)
	public String newsInfo(@RequestParam("newsId")Integer newsId,Model model){
		News news=newsService.getByNewsId(newsId);
		model.addAttribute("news",news);
		return "newsInfo";
		
	}
}
