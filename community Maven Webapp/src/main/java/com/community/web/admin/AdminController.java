package com.community.web.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.community.entity.Admin;
import com.community.service.AdminService;
import com.community.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private UserService userService;
	@RequestMapping(value="/main",method=RequestMethod.GET)
	public String main(){		
		return "/admin/main";
	}
	@RequestMapping(value="/top",method=RequestMethod.GET)
	public String top(){		
		return "/admin/top";
	}
	@RequestMapping(value="/left",method=RequestMethod.GET)
	public String left(){		
		return "/admin/left";
	}
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String index(){		
		return "/admin/index";
	}
	@RequestMapping(value="/updateAdminPsw",method=RequestMethod.GET)
	public String updateAdminPsw(){		
		return "/admin/updateAdminPsw";
	}
	@RequestMapping(value="/doUpdateAdminPsw",method=RequestMethod.POST)
	public String doUpdateAdminPsw(String oldPassword,String adminPassword,HttpSession session,Model model){
		Admin admin=(Admin) session.getAttribute("admin");
		if(oldPassword.equals(admin.getAdminPassword())){
			if (adminService.updatePassword(admin.getAdminId(), adminPassword)) {
				Admin admin2=adminService.login(admin.getAdminName(), adminPassword);
				session.setAttribute("admin", admin2);
				session.setMaxInactiveInterval(30*60);
				model.addAttribute("msg", "修改成功！");
				return "/admin/updateAdminPsw";
			}else {
				model.addAttribute("msg", "修改失败！");
				return "/admin/updateAdminPsw";
			}
		}else {
			model.addAttribute("msg", "密码输入错误！");
			return "/admin/updateAdminPsw";
		}
		
	}
	
	@RequestMapping(value="/loginOut",method=RequestMethod.GET)
	public String loginOut(HttpSession session){	
		session.invalidate();
		return "redirect:/backLogin";
	}
	
}
