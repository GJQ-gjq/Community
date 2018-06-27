package com.community.web.clubManager;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.community.entity.Apply;
import com.community.entity.Community;
import com.community.entity.Pager;
import com.community.entity.User;
import com.community.service.ApplyService;
import com.community.service.communityService;

@Controller
@RequestMapping("/clubManager")
public class ManagerClubController {
	@Autowired
	private communityService communityService;
	@Autowired
	private ApplyService applyService;
	@RequestMapping(value="/clubInfo",method=RequestMethod.GET)
	public String clubInfo(HttpSession session,Model model){
		User user=(User) session.getAttribute("user");
		Community community1=communityService.getByPhone(user.getTel());
		Community community=communityService.getById(community1.getId());
		model.addAttribute("community", community);
		return "/clubManager/clubInfo";
	}
	@RequestMapping(value="/applyList")
	public String applyList(@RequestParam(required=false)String userName,@RequestParam(required=false)Integer pageNo,HttpSession session,Model model){
		if(pageNo==null){
			pageNo=1;
		}
		session.setAttribute("userName", userName);
		session.setMaxInactiveInterval(30*60);
		User user=(User) session.getAttribute("user");
		Community community=communityService.getByPhone(user.getTel());
		Pager<Apply> result=applyService.getByClubId(userName, community.getName(), pageNo, 12);
		model.addAttribute("result", result);
		return "/clubManager/applyList";
	}
	@RequestMapping("/searchApply")
	public String searchApply(@RequestParam(required=false)String userName,HttpSession session,Model model){
		session.setAttribute("userName", userName);
		session.setMaxInactiveInterval(30*60);
		User user=(User) session.getAttribute("user");
		Community community=communityService.getByPhone(user.getTel());
		Pager<Apply> result=applyService.getByClubId(userName, community.getName(), 1, 12);
		if (result.getDataList().size()>0) {
			model.addAttribute("result", result);
			return "/clubManager/applyList";
		}else {
			Pager<Apply> result1=applyService.getByClubId(null,community.getName(), 1, 12);
			model.addAttribute("result", result1);
			model.addAttribute("msg", "无此人申请信息！");
			return "/clubManager/applyList";
		}
		
	}
	@RequestMapping("/getReason")
	@ResponseBody
	public Map<String , String> getReason(int applyId,Model model){
		Apply apply=applyService.getByapplyId(applyId);
		Map<String , String > map=new HashMap<String, String>();
		map.put("reason", apply.getReason());
		return map;
	}
	@RequestMapping("/updateCheck")
	public String updateCheck(int applyId,byte check,HttpSession session,Model model){
			User user=(User) session.getAttribute("user");
			Community community=communityService.getByPhone(user.getTel());
			boolean f=applyService.updateCheck(applyId, check);
			if(f){
				Pager<Apply> result=applyService.getByClubId(null, community.getName(), 1, 12);
				model.addAttribute("result", result);
				model.addAttribute("msg", "操作成功！");
				return "/clubManager/applyList";
			}else {
				Pager<Apply> result=applyService.getByClubId(null, community.getName(), 1, 12);
				model.addAttribute("result", result);
				model.addAttribute("msg", "操作失败！");
				return "/clubManager/applyList";
			}
		}
	
}
