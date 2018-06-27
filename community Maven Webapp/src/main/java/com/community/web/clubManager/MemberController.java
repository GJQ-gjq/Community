package com.community.web.clubManager;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.community.entity.Community;
import com.community.entity.Pager;
import com.community.entity.User;
import com.community.entity.UserInClub;
import com.community.service.UserInClubService;
import com.community.service.communityService;

@Controller
@RequestMapping("/clubManager")
public class MemberController {
	@Autowired
	private UserInClubService userInClubService;
	@Autowired
	private communityService communityService;
	@RequestMapping("/userList")
	public String userList(@RequestParam(required=false)String userName,@RequestParam(required=false)Integer pageNo,HttpSession session,Model model){
		if(pageNo==null){
			pageNo=1;
		}
		User user=(User) session.getAttribute("user");
		Community community=communityService.getByPhone(user.getTel());
		Pager<UserInClub> result=userInClubService.getAllUser(userName, community.getName(), pageNo, 12);
		model.addAttribute("result", result);
		return "/clubManager/userList";
	}
	@RequestMapping(value="/searchName")
	public String searchName(@RequestParam(required=false)String userName,@RequestParam(required=false)Integer pageNo,HttpSession session,Model model){
		session.setAttribute("userName", userName);
		session.setMaxInactiveInterval(30*60);
		User user=(User) session.getAttribute("user");
		Community community=communityService.getByPhone(user.getTel());
		Pager<UserInClub> result=userInClubService.getAllUser(userName, community.getName(), 1, 12);
		if(result.getDataList().size()>0){
			model.addAttribute("result", result);
			return "/clubManager/userList";
		}else {
			Pager<UserInClub> result1=userInClubService.getAllUser(null, community.getName(), 1, 12);
			model.addAttribute("result", result1);
			model.addAttribute("msg", "无此人信息！");
			return "/clubManager/userList";
		}	
	}
	@RequestMapping(value="/deleteMember",method=RequestMethod.GET)
	public String deleteMember(Integer id,HttpSession session,Model model){
		User user=(User) session.getAttribute("user");
		Community community=communityService.getByPhone(user.getTel());
		if (userInClubService.delete(id)>0) {
			Pager<UserInClub> result=userInClubService.getAllUser(null, community.getName(), 1, 12);
			model.addAttribute("result", result);
			model.addAttribute("msg", "踢出成功！");
			return "/clubManager/userList";
		}
		Pager<UserInClub> result=userInClubService.getAllUser(null, community.getName(), 1, 12);
		model.addAttribute("result", result);
		model.addAttribute("msg", "踢出失败！");
		return "/clubManager/userList";
	}
}
