package com.community.web.admin;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.community.entity.Pager;
import com.community.service.FileService;
import com.community.service.VideoService;

@Controller
@RequestMapping("/admin")
public class SystemController {
	@Autowired
	private VideoService videoService;
	@Autowired
	private FileService fileService;
	@RequestMapping(value="/updateVideo")
	public String updateVideo(){
		return "/admin/updateVideo";
	}
	@RequestMapping(value="/doUpdateVideo")
	public String doUpdateVideo(String url,Model model){
		if (videoService.add(url)>0) {
			model.addAttribute("msg", "添加成功！");
			return "/admin/updateVideo";
		}else {
			model.addAttribute("msg", "添加失败！");
			return "/admin/updateVideo";
		}
	}
	@RequestMapping(value="/fileList")
	public String fileList(@RequestParam(value="pageNo",required=false)Integer pageNo,Model model){
		if(pageNo==null){
			pageNo=1;
		}
		Pager<com.community.entity.File> result=fileService.getAllFile(pageNo, 12);
		model.addAttribute("result", result);
		return "/admin/fileList";
	}
	@RequestMapping(value="/deleteFile")
	public String deleteFile(int fileId,Model model){
		if(fileService.removeFile(fileId)>0){
			Pager<com.community.entity.File> result=fileService.getAllFile(1, 12);
			model.addAttribute("result", result);
			model.addAttribute("msg", "删除成功！");
			return "/admin/fileList";
		}else {
			Pager<com.community.entity.File> result=fileService.getAllFile(1, 12);
			model.addAttribute("result", result);
			model.addAttribute("msg", "删除失败！");
			return "/admin/fileList";
		}
	}
	@RequestMapping(value="/fileUpload")
	public String fileUpload(){
		return "/admin/fileUpload";
	}
	@RequestMapping(value="/doFileUpload",method=RequestMethod.POST)
	public String fileUpload(HttpServletRequest request,
	           @RequestParam("file") MultipartFile file,Model model) throws Exception {
	       //如果文件不为空，写入上传路径
	       if(!file.isEmpty()) {
	           //上传文件路径
	           String path = request.getServletContext().getRealPath("\\upload\\");
	           //上传文件名
	           String fileName = file.getOriginalFilename();
	           File filepath = new File(path,fileName);
	           //判断路径是否存在，如果不存在就创建一个
	           if (!filepath.getParentFile().exists()) { 
	               filepath.getParentFile().mkdirs();
	           }
	           //将上传文件保存到一个目标文件当中
	           file.transferTo(new File(path + File.separator + fileName));
	           com.community.entity.File data=new com.community.entity.File();
	           data.setFileName(fileName);
	           data.setUploadTime(new Date());
	           fileService.addFile(data);
	           model.addAttribute("msg", "上传成功！");
	           return "/admin/fileUpload";
	       } else {
	    	   model.addAttribute("msg", "上传失败！");
	           return "/admin/fileUpload";
	       }

	    }
}
