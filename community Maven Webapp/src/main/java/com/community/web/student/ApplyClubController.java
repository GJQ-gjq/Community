package com.community.web.student;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.community.entity.Apply;
import com.community.entity.BuildApply;
import com.community.entity.Community;
import com.community.entity.User;
import com.community.service.ApplyService;
import com.community.service.BuildApplyService;
import com.community.service.communityService;

@Controller
@RequestMapping("/student")
public class ApplyClubController {
	@Autowired
	private ApplyService applyService;
	@Autowired
	private communityService communityService;
	@Autowired
	private BuildApplyService buildApplyService;
	@RequestMapping(value="/clubApply")
	public String clubApply(){
		return "/student/clubApply";
	}
	@RequestMapping(value="/clubApplyList")
	public String clubApplyList(HttpSession session,Model model){
		User user=(User)session.getAttribute("user1");
		List<Apply> applies=applyService.getByUserId(user.getUserId());
		List<BuildApply> buildApplies=buildApplyService.getByUserId(user.getUserId());
		model.addAttribute("applies", applies);
		model.addAttribute("buildApplies", buildApplies);
		return "/student/clubApplyList";
	}
	@RequestMapping(value="/doClubApply",method=RequestMethod.POST)
	public String doClubApply(String name,String reason,HttpSession session,Model model){
		User user=(User)session.getAttribute("user1");
		Community community=communityService.getByName(name);
		if(community!=null){
			Apply apply=new Apply();
			apply.setUserId(user.getUserId());
			apply.setClubName(name);
			apply.setReason(reason);
			apply.setApplyTime(new Date());
			if(applyService.add(apply)>0){
				model.addAttribute("msg1", "申请已提交，请耐心等待审核！");
			}else {
				model.addAttribute("msg1", "申请失败！");
			}
		}else {
			model.addAttribute("msg1", "无此社团，请查实重新输入！");
		}
		return "/student/clubApply";
	}
	@RequestMapping(value="/buildClub",method=RequestMethod.POST)
	public String buildClub(String cName,String cType,String college,String introduce,
			HttpSession session,Model model){
		User user=(User)session.getAttribute("user1");
		Community community=communityService.getByName(cName);
		if (community==null) {
			BuildApply buildApply=new BuildApply();
			buildApply.setName(cName);
			buildApply.setType(cType);
			buildApply.setCollege(college);
			buildApply.setUserId(user.getUserId());
			buildApply.setApplyPhone(user.getTel());
			buildApply.setIntroduce(introduce);
			buildApply.setApplyTime(new Date());
			if(buildApplyService.add(buildApply)>0){
				model.addAttribute("msg1", "申请已提交，请耐心等待审核！");
			}else {
				model.addAttribute("msg1", "申请失败！");
			}
		}else {
			model.addAttribute("msg1", "该社团已存在，请重新输入！");
		}
		return "/student/clubApply";
	}
}
