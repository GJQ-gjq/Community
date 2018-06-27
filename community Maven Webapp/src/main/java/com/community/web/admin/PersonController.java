package com.community.web.admin;

import java.util.List;

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
@RequestMapping("/admin")
public class PersonController {
	@Autowired
	private UserService userService;
	@Autowired
	private AdminService adminService;
	/**
	 * 获取所有用户列表
	 * @param model
	 * @return
	 */
  @RequestMapping(value="/userList",method=RequestMethod.GET)
  public String userList(Model model){
	  List<User> users=userService.getAllUsers();
	  model.addAttribute("users", users);
	  model.addAttribute("size", users.size());
	  return "/admin/userList";
  }
  /**
   * 获取所以管理员列表
   * @param model
   * @return
   */
  @RequestMapping(value="/adminList",method=RequestMethod.GET)
  public String adminList(Model model){
	  List<Admin> admins=adminService.getAllAdmins();
	  model.addAttribute("admins", admins);
	  model.addAttribute("size", admins.size());
	  return "/admin/adminList";
  }
  /**
   * 添加管理员页面跳转
   * @return
   */
  @RequestMapping(value="/addAdmin",method=RequestMethod.GET)
  public String addAdmin(){
	  return "/admin/addAdmin";
  }
  /**
   * 添加管理员
   * @param adminName
   * @param adminPassword
   * @param model
   * @return
   */
  @RequestMapping(value="/doAddAdmin",method=RequestMethod.POST)
  public String doAddAdmin(String adminName,String adminPassword,String sex,String college,Model model){
	  if (adminService.getAdmin(adminName).size()>0) {
		  model.addAttribute("msg", "该用户名已存在！");
		  return "/admin/addAdmin";
	  }else {
		  Admin admin=new Admin();
		  admin.setAdminName(adminName);
		  admin.setAdminPassword(adminPassword);
		  admin.setSex(sex);
		  admin.setCollege(college);
		  if (adminService.register(admin)) {
			  model.addAttribute("msg", "添加成功！");
			  return "/admin/addAdmin";
		  }else {
			  model.addAttribute("msg", "添加失败！");
			  return "/admin/addAdmin";
		  }
	  }
  } 
  /**
   * 删除用户
   * @param uId
   * @param model
   * @return
   */
  @RequestMapping(value="/deleteUser",method=RequestMethod.GET)
  public String deleteUser(Integer uId,Model model){
	  if (userService.deleteUser(uId)) {
		  List<User> users=userService.getAllUsers();
		  model.addAttribute("users", users);
		  model.addAttribute("size", users.size());
		  model.addAttribute("msg", "删除成功！");
		  return "/admin/userList";
	}
	  List<User> users=userService.getAllUsers();
	  model.addAttribute("users", users);
	  model.addAttribute("size", users.size());
	  model.addAttribute("msg", "删除失败！");
	  return "/admin/userList";
  }
  
  @RequestMapping(value="/search",method=RequestMethod.POST)
  public String sarch(@RequestParam(value="userId",required=false)String userId,Model model){
	  if (userId!=null&&userId!="") {
		  List<User> users=userService.getUserById(userId);
		  if(users.size()>0){
			  model.addAttribute("users", users);
			  model.addAttribute("size", users.size());
			  return "/admin/userList";
		  }else {
			  List<User> user=userService.getAllUsers();
			  model.addAttribute("users", user);
			  model.addAttribute("size", user.size());
			  model.addAttribute("msg", "该学号暂未注册！");
			  return "/admin/userList";
		}
	  } 
	  List<User> users=userService.getAllUsers();
	  model.addAttribute("users", users);
	  model.addAttribute("size", users.size());
	  return "/admin/userList";
  }
  @RequestMapping(value="searchAdmin")
  public String searchAdmin(@RequestParam(required=false)String adminName,Model model){
	  if (adminName!=null&&adminName!="") {
		  List<Admin> admins=adminService.getAdmin(adminName);
		  if(admins.size()>0){
			  model.addAttribute("admins", admins);
			  model.addAttribute("size", admins.size());
			  return "/admin/adminList";
		  }else {
			  List<Admin> admin=adminService.getAllAdmins();
			  model.addAttribute("admins", admin);
			  model.addAttribute("size", admin.size());
			  model.addAttribute("msg", "无该用户！");
			  return "/admin/adminList";
		}
	  } 
	  List<Admin> admins=adminService.getAllAdmins();
	  model.addAttribute("admins", admins);
	  model.addAttribute("size", admins.size());
	  return "/admin/adminList";
  }
  @RequestMapping(value="deleteAdmin")
  public String deleteAdmin(int adminId,Model model){
	  if (adminService.delete(adminId)) {
		  List<Admin> admins=adminService.getAllAdmins();
		  model.addAttribute("admins", admins);
		  model.addAttribute("size", admins.size());
		  model.addAttribute("msg", "删除成功！");
		  return "/admin/adminList";
	}
	  List<Admin> admins=adminService.getAllAdmins();
	  model.addAttribute("admins", admins);
	  model.addAttribute("size", admins.size());
	  model.addAttribute("msg", "删除失败！");
	  return "/admin/adminList";
  }
}
