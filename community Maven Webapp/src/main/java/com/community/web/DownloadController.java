package com.community.web;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.community.entity.BuildApply;
import com.community.entity.Pager;
import com.community.service.FileService;

@Controller
@RequestMapping("/")
public class DownloadController {
	@Autowired
	private FileService fileService;
	
	@RequestMapping(value="dataDownload")
	public String dateDownload(Model model){				
		return "dataDownload";
	}
	
	@RequestMapping("/getData")
	@ResponseBody
	public Map<String , Object> getData(int pageNo){
		Pager<Integer> pager =new Pager<Integer>();
		pager.setPageSize(7);
		Pager<com.community.entity.File> result=fileService.getAllFile(pageNo, pager.getPageSize());
		Map<String , Object > map=new HashMap<String, Object>();
		map.put("result", result);
		return map;
	}
	
	@RequestMapping(value="download")
	public ResponseEntity<byte[]> download(HttpServletRequest request,
            @RequestParam("fileName") String fileName,
            Model model)throws Exception {
       //下载文件路径
       String path = request.getServletContext().getRealPath("\\upload\\");
       File file = new File(path + File.separator + fileName);
       HttpHeaders headers = new HttpHeaders();  
       //下载显示的文件名，解决中文名称乱码问题  
       String downloadFielName = new String(fileName.getBytes("UTF-8"),"iso-8859-1");
       //通知浏览器以attachment（下载方式）打开图片
       headers.setContentDispositionFormData("attachment", downloadFielName); 
       //application/octet-stream ： 二进制流数据（最常见的文件下载）。
       headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
       return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),    
               headers, HttpStatus.CREATED);  
    }
	
}
