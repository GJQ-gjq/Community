package com.community.web.admin;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.community.entity.News;
import com.community.entity.Pager;
import com.community.service.NewsService;

@Controller
@RequestMapping("/admin")
public class AdminNewsController {
	@Autowired
	private NewsService newsService;
	@RequestMapping(value="/newsList")
	public String newsList(@RequestParam(required=false)Integer pageNo,@RequestParam(required=false)String writer,HttpSession session,Model model){
		if(pageNo==null){
			pageNo=1;
		}
		Pager<News> result=newsService.getAll(writer,pageNo, 12);
		model.addAttribute("result", result);
		return "/admin/newsList";
	}
	@RequestMapping(value="addNews")
	public String addNews(){
		return "/admin/addNews";
	}
	@RequestMapping(value="/doAddNews",method=RequestMethod.POST)
	public String addNews(String title,String type,String content,Model model){
		News news=new News();
		news.setTitle(title);
		news.setType(type);
		news.setWriter("社团联");
		news.setContent(content);
		news.setCreatTime(new Date());
		System.out.println(news.toString());
		if(newsService.addNews(news)){
			model.addAttribute("msg", "发布成功！");
			return "/admin/addNews";
		}
		model.addAttribute("msg", "发布失败！");
		return "/admin/addNews";
	}
	@RequestMapping(value="/deleteNews")
	public String deleteNews(Integer newsId,Model model){
		if(newsService.deleteNews(newsId)){
			Pager<News> result=newsService.getAll(null,1, 12);
			model.addAttribute("result", result);
			model.addAttribute("msg", "删除成功！");
			return "/admin/newsList";
		}
		Pager<News> result=newsService.getAll(null,1, 12);
		model.addAttribute("result", result);
		model.addAttribute("msg", "删除失败！");
		return "/admin/newsList";
	}
	@RequestMapping(value="/searchNews")
	public String searchNews(@RequestParam(required=false)String writer,HttpSession session,Model model){
		session.setAttribute("writer", writer);
		session.setMaxInactiveInterval(30*60);
		Pager<News> result=newsService.getAll(writer,1, 12);
		if(result.getDataList().size()>0){
			model.addAttribute("result", result);
			return "/admin/newsList";
		}else {
			Pager<News> result1=newsService.getAll(null,1, 12);
			model.addAttribute("result", result1);
			model.addAttribute("msg", "该作者不存在！");
			return "/admin/newsList";
		}
	}
}
