package com.community.web.clubManager;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.community.entity.User;
import com.community.service.UserService;

@Controller
@RequestMapping("/clubManager")
public class ClubManagerController {
	@Autowired
	private UserService userService;
	@RequestMapping(value="main")
	public String main(){
		return "/clubManager/main";
	}
	@RequestMapping(value="/top",method=RequestMethod.GET)
	public String top(){		
		return "/clubManager/top";
	}
	@RequestMapping(value="/left",method=RequestMethod.GET)
	public String left(){		
		return "/clubManager/left";
	}
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String index(){		
		return "/clubManager/index";
	}
	@RequestMapping(value="/updateManagerPsw",method=RequestMethod.GET)
	public String updateAdminPsw(){		
		return "/clubManager/updateManagerPsw";
	}
	@RequestMapping(value="/doUpdateManagerPsw",method=RequestMethod.POST)
	public String doUpdateManagerPsw(String oldPassword,String managerPassword,HttpSession session,Model model){	
		User user=(User) session.getAttribute("user");
		if(user.getPassword().equals(oldPassword)){
			if (userService.updatePassword(user.getUserId(), managerPassword)) {
				User user2=userService.login(user.getUserId(), managerPassword);
				session.setAttribute("user", user2);
				session.setMaxInactiveInterval(30*60);
				model.addAttribute("msg", "修改成功！");
				return "/clubManager/updateManagerPsw";
			}else {
				model.addAttribute("msg", "修改失败！");
				return "/clubManager/updateManagerPsw";
			}
		}else {
			model.addAttribute("msg", "密码输入错误！");
			return "/clubManager/updateManagerPsw";
		}
	}
	
}
