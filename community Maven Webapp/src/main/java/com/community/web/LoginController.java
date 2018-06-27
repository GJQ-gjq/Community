package com.community.web;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.community.entity.Admin;
import com.community.entity.User;
import com.community.service.AdminService;
import com.community.service.UserService;

@Controller
@RequestMapping("/")
public class LoginController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private UserService userService;
	@Autowired
	private AdminService adminService;
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login(){
		return "login";
	}
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public String  register() {		
		return "register";
	}
	@RequestMapping(value="/selectPower",method=RequestMethod.GET)
	public String  selectPower() {		
		return "selectPower";
	}
	@RequestMapping(value="/backLogin",method=RequestMethod.GET)
	public String  backLogin() {		
		return "backLogin";
	}
	@RequestMapping(value="/loginOut",method=RequestMethod.GET)
	public String  loginOut(HttpSession session) {
		session.invalidate();
		return "redirect:/index";
	}
	
	@RequestMapping(value="doLogin",method=RequestMethod.POST)
	public String login(@RequestParam("userId")String userId,@RequestParam("password")String password,HttpSession session,Model model){
		logger.debug("学号:"+userId+"密码"+password);				
			User user=userService.login(userId, password);
			int power=0;
			if (user!=null) {
				if(user.getPower()==power){
					session.setAttribute("user1", user);
					session.setMaxInactiveInterval(30*60);
					return "/student/clubApply";
				}else{
					model.addAttribute("msg", "您的角色有误！");
					return "login";
				}
				
			}			
			model.addAttribute("msg", "账号或密码错误！");
			return "login";	
	}
	
	@RequestMapping(value="/doRegister",method=RequestMethod.POST)
	public String doRegister(String userId,String password,String userName,String userSex,String college,String grade,Long tel,Model model){
		User user=new User();
		user.setUserId(userId);
		user.setPassword(password);
		user.setUserName(userName);
		user.setUserSex(userSex);
		user.setCollege(college);
		user.setGrade(grade);
		user.setPower(0);
		user.setTel(tel);
		logger.debug("user={}"+user.toString());
		if(userService.getUserById(userId).size()>0){
			model.addAttribute("msg", "该账号已被注册！");
			return "register";
		}
		if(userService.getUserBytel(tel)!=null){
			model.addAttribute("msg", "该手机号已被注册！");
			return "register";
		}
		if (userService.register(user)) {
			model.addAttribute("msg", "注册成功！");
			return "login";
		} else {
			model.addAttribute("msg", "注册失败！");
			return "register";
		}	
	}
	@RequestMapping(value="/main",method=RequestMethod.POST)
	public String adminLogin(String adminName,String adminPassword,HttpSession session,Model model){	
		Admin admin=adminService.login(adminName, adminPassword);
		User user=userService.login(adminName, adminPassword);
		if (admin!=null) {
			session.setAttribute("admin", admin);
			return "/admin/main";
		}
		if (user!=null) {
			session.setAttribute("user", user);
			return "/clubManager/main";
		}
		model.addAttribute("msg", "账号或密码错误");
		return "/backLogin";
	}
}
