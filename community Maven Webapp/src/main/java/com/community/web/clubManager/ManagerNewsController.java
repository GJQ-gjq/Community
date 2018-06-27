package com.community.web.clubManager;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.community.entity.Community;
import com.community.entity.News;
import com.community.entity.Pager;
import com.community.entity.User;
import com.community.service.NewsService;
import com.community.service.communityService;

@Controller
@RequestMapping("/clubManager")
public class ManagerNewsController {
	@Autowired
	private communityService communityService;
	@Autowired
	private NewsService newsService;
	@RequestMapping(value="/newsList",method=RequestMethod.GET)
	public String newsList(@RequestParam(required=false)Integer pageNo,HttpSession session,Model model){
		if (pageNo==null) {
			pageNo=1;
		}
		User user=(User) session.getAttribute("user");
		Community community=communityService.getByPhone(user.getTel());
		Pager<News> result=newsService.getAll(community.getName(), pageNo, 12);
		model.addAttribute("result", result);
		return "/clubManager/newsList";
	}
	@RequestMapping(value="addNews")
	public String addNews(){
		return "/clubManager/addNews";
	}
	@RequestMapping(value="/doAddNews",method=RequestMethod.POST)
	public String addNews(String title,String type,String content,HttpSession session,Model model){
		User user=(User) session.getAttribute("user");
		Community community=communityService.getByPhone(user.getTel());	
		News news=new News();
		news.setTitle(title);
		news.setType(type);
		news.setWriter(community.getName());
		news.setContent(content);
		news.setCreatTime(new Date());
		System.out.println(news.toString());
		if(newsService.addNews(news)){
			model.addAttribute("msg", "发布成功！");
			return "/clubManager/addNews";
		}
		model.addAttribute("msg", "发布失败！");
		return "/clubManager/addNews";
	}
	@RequestMapping(value="/deleteNews")
	public String deleteNews(Integer newsId,HttpSession session,Model model){
		User user=(User) session.getAttribute("user");
		Community community=communityService.getByPhone(user.getTel());		
		if(newsService.deleteNews(newsId)){
			Pager<News> result=newsService.getAll(community.getName(), 1, 12);
			model.addAttribute("result", result);
			model.addAttribute("msg", "删除成功！");
			return "/admin/newsList";
		}
		Pager<News> result=newsService.getAll(community.getName(), 1, 12);
		model.addAttribute("result", result);
		model.addAttribute("msg", "删除失败！");
		return "/admin/newsList";
	}
}
