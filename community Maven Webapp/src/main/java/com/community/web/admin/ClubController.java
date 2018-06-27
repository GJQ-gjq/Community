package com.community.web.admin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.community.entity.BuildApply;
import com.community.entity.Community;
import com.community.entity.Pager;
import com.community.entity.Type;
import com.community.service.BuildApplyService;
import com.community.service.TypeService;
import com.community.service.communityService;

@Controller
@RequestMapping("/admin")
public class ClubController {
	@Autowired
	private communityService communityService;
	@Autowired
	private TypeService typeService;
	@Autowired
	private BuildApplyService buildApplyService;
	@RequestMapping(value="/communityList")
	public String communityList(@RequestParam(value="type",required=false)String type,@RequestParam(value="name",required=false)String name,
		@RequestParam(value="college",required=false)String college,@RequestParam(value="pageNo",required=false)Integer pageNo,Model model){
		if(pageNo==null){
			pageNo=1;
		}
		Pager<Community> result=communityService.getAll(pageNo,12, type, name, college);
		model.addAttribute("result", result);
		return "/admin/communityList";
	}
	
	@RequestMapping(value="/searchClub")
	public String searchClub(@RequestParam(value="searchId",required=false)String searchId,@RequestParam(value="searchValue",required=false)String searchValue,
			HttpSession session,Model model){
		if(searchId==null&&"".equals(searchId)){
			searchId="type";
			searchValue=null;
		}
		session.setAttribute("searchId", searchId);
		session.setAttribute("searchValue", searchValue);
		session.setMaxInactiveInterval(30*60);
		if(searchId.equals("type")){
			Pager<Community> result=communityService.getAll(1,12, searchValue,null,null);
			model.addAttribute("result", result);
			return "/admin/communityList";
		}
		if (searchId.equals("name")) {
			Pager<Community> result=communityService.getAll(1,12, null,searchValue,null);
			model.addAttribute("result", result);
			return "/admin/communityList";
		}
		if (searchId.equals("college")) {
			Pager<Community> result=communityService.getAll(1,12, null,null,searchValue);
			model.addAttribute("result", result);
			return "/admin/communityList";
		}
		Pager<Community> result=communityService.getAll(1,12, null,null,null);
		model.addAttribute("result", result);
		return "/admin/communityList";
	}
	@RequestMapping(value="/deleteClub")
	public String deleteClub(Integer id,Model model){
		if(communityService.delete(id)>0){
			Pager<Community> result=communityService.getAll(1,12, null,null,null);
			model.addAttribute("result", result);
			model.addAttribute("msg", "删除成功！");
			return "/admin/communityList";
		}else {
			Pager<Community> result=communityService.getAll(1,12, null,null,null);
			model.addAttribute("result", result);
			model.addAttribute("msg", "删除失败！");
			return "/admin/communityList";
		}
	}
	@RequestMapping(value="/cTypeList")
	public String cTypeList(@RequestParam(required=false)Integer pageNo,@RequestParam(required=false)String type,Model model){
		if(pageNo==null){
			pageNo=1;
		}
		Pager<Type> result=typeService.getAll(type,pageNo, 12);
		model.addAttribute("result", result);
		return "/admin/cTypeList";
	}
	
	@RequestMapping(value="/searchType")
	public String searchType(@RequestParam(required=false)String type,HttpSession session,Model model){
		session.setAttribute("type", type);
		session.setMaxInactiveInterval(30*60);
		Pager<Type> result=typeService.getAll(type, 1, 12);
		if(result.getDataList().size()>0){
			model.addAttribute("result", result);
			return "/admin/cTypeList";
		}else {
			Pager<Type> result1=typeService.getAll(null, 1, 12);
			model.addAttribute("result", result1);
			model.addAttribute("msg", "该类别不存在！");
			return "/admin/cTypeList";
		}
	}
	@RequestMapping(value="/deleteType")
	public String deleteType(Integer typeId,Model model){
		if(typeService.delete(typeId)>0){
			Pager<Type> result=typeService.getAll(null,1, 12);
			model.addAttribute("result", result);
			model.addAttribute("msg", "删除成功！");
			return "/admin/cTypeList";
		}else {
			Pager<Type> result=typeService.getAll(null,1, 12);
			model.addAttribute("result", result);
			model.addAttribute("msg", "删除成功！");
			return "/admin/cTypeList";
		}
	}
	@RequestMapping(value="/addCtype")
	public String addCtype(Model model){
	
		int typeId=typeService.getMaxId();
		model.addAttribute("typeId", typeId+1);
		return "/admin/addCtype";
	}
	@RequestMapping(value="/doAddCtype")
	public String doAddCtype(String typeName,Model model){
		int typeId=typeService.getMaxId();
		Type type=new Type();
		type.setTypeId(typeId+1);
		type.setTypeName(typeName);
		if (typeService.add(type)>0) {
			model.addAttribute("typeId", typeId+2);
			model.addAttribute("msg", "添加成功！");
			return "/admin/addCtype";
		}else {
			model.addAttribute("typeId", typeId);
			model.addAttribute("msg", "添加失败！");
			return "/admin/addCtype";
		}
	}
	@RequestMapping(value="/cApplyList")
	public String cApplyList(@RequestParam(required=false)Integer pageNo,@RequestParam(required=false)Long phone,Model model){
		if(pageNo==null){
			pageNo=1;
		}
		Pager<BuildApply> result=buildApplyService.getAll(phone,pageNo, 12);
		model.addAttribute("result", result);
		return "/admin/cApplyList";
	}
	@RequestMapping("/searchClubApply")
	public String searchClubApply(@RequestParam(required=false)Long phone,HttpSession session,Model model){
		session.setAttribute("phone", phone);
		session.setMaxInactiveInterval(30*60);
		Pager<BuildApply> result=buildApplyService.getAll(phone, 1, 12);
		if (result.getDataList().size()>0) {
			model.addAttribute("result", result);
			return "/admin/cApplyList";
		}else {
			Pager<BuildApply> result1=buildApplyService.getAll(null, 1, 12);
			model.addAttribute("result", result1);
			model.addAttribute("msg", "无此手机申请信息！");
			return "/admin/cApplyList";
		}
	}
	@RequestMapping("/updateCheck")
	public String updateCheck(int cId,byte check,Model model){
		BuildApply buildApply=buildApplyService.getByCid(cId);
		if(communityService.getByName(buildApply.getName())!=null){
			Pager<BuildApply> result=buildApplyService.getAll(null, 1, 12);
			model.addAttribute("result", result);
			model.addAttribute("msg", "此社团已存在！");
			return "/admin/cApplyList";
		}else {
			boolean f=buildApplyService.updateCheck(cId, check);
			if(f){
				Pager<BuildApply> result=buildApplyService.getAll(null, 1, 12);
				model.addAttribute("result", result);
				model.addAttribute("msg", "操作成功！");
				return "/admin/cApplyList";
			}else {
				Pager<BuildApply> result=buildApplyService.getAll(null, 1, 12);
				model.addAttribute("result", result);
				model.addAttribute("msg", "操作失败！");
				return "/admin/cApplyList";
			}
		}
	}
	@RequestMapping("/getIntroduce")
	@ResponseBody
	public Map<String , String> getIntroduce(int cId){
		BuildApply buildApply=buildApplyService.getByCid(cId);
		System.out.println(buildApply.getIntroduce());
		Map<String , String > map=new HashMap<String, String>();
		map.put("introduce", buildApply.getIntroduce());
		return map;
	}
}
