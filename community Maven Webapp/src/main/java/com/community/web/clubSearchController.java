package com.community.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.community.entity.Community;
import com.community.entity.Pager;
import com.community.service.communityService;

@Controller
@RequestMapping("/")
public class clubSearchController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private communityService communityService;
	@RequestMapping(value="/clubSearch")
	public String clubSearch(Model model){
		return "clubSearch";
	}
	//社团检索
	@RequestMapping(value="/getClub")
	@ResponseBody
	public Map<String, Object> getClub(@RequestParam(value="type",required=false)String type,@RequestParam(value="name",required=false)String name,
		@RequestParam(value="college",required=false)String college,@RequestParam(value="pageNo",required=false)Integer pageNo){
		Pager<Community> result=communityService.getAll(pageNo, 8, type, name, college);
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("result", result);
		System.out.println(result.toString());
		return map;	
	}
	//社团详细
	@RequestMapping(value="/clubInfo")
	public String clubInfo(Integer id,Model model){
		Community community=communityService.getById(id);
		model.addAttribute("community",community);
		return "clubInfo";
	}
}
