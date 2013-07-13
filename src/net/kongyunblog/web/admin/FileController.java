package net.kongyunblog.web.admin;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.kongyunblog.domain.UserFile;
import net.kongyunblog.service.UserFileService;
import net.kongyunblog.tools.FileHelper;
import net.kongyunblog.tools.Page;

import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipOutputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("admin/file")
public class FileController {
	
	@Autowired
	private UserFileService userFileService;
	
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public String upload() {
		return "admin/file/upload";
	}
	
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public ModelAndView upload(UserFile userFile, HttpServletRequest request, 
			@RequestParam("mulFile") MultipartFile mulFile) throws RuntimeException, IOException{	
		System.out.println("=============:" + request.getParameter("name").trim());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/file/upload");
		if(request.getParameter("name").trim()==""||request.getParameter("name").trim()==null) {
			mav.addObject("msg", "标题不能为空！");
			return mav;
		}
		if (mulFile.isEmpty()) {
			mav.addObject("msg", "请选择上传文件！");
			return mav;
		}
		else {
			// 获取根目录下的uploadDir文件夹
			String uploadDir = request.getSession().getServletContext().getRealPath("/") + "uploadDir/";
			String fileName = mulFile.getOriginalFilename();		// 获取完整文件名xxx.jpg
			String storeName = FileHelper.rename(fileName);   		// 重命名   20130222xxx.jpg
			String noZipName = uploadDir + storeName;				// c:\xx\xx\20130222xxx.jpg
			String zipName = FileHelper.zipName(noZipName);			// 获取压缩文件名 c:\xx\xx\20130222xxx.zip
			
			File file = new File(uploadDir);
			// 只能在已经存在的目录中创建创建文件夹;mkdirs()可以在不存在的目录中创建文件夹
			if (!file.exists()) {
				file.mkdir();
			}
			
			// 上传成为压缩文件
			ZipOutputStream outputStream = new ZipOutputStream(new BufferedOutputStream(new FileOutputStream(zipName)));
			outputStream.putNextEntry(new ZipEntry(storeName));
			outputStream.setEncoding("GBK");
			FileCopyUtils.copy(mulFile.getInputStream(), outputStream);
			
			userFile.setFile(FileHelper.zipName(storeName));
			userFile.setPath(zipName);
			userFile.setUploadTime(new Date());
			userFile.setAuthorId((long)1);
			userFile.setSize(new File(zipName).length());
			
			userFileService.save(userFile);
			
			mav.addObject("success", "<script type='text/javascript'>alert('提示信息：上传成功！');window.location.reload();</script>");
			return mav;
		}
	}
	
	@RequestMapping(value = "/{id}/download", method = RequestMethod.GET)
	public String download(@PathVariable("id") long id, HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		UserFile userFile = userFileService.get(id);
		
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		String downLoadPath = userFile.getPath();		
		String realName = userFile.getName() + ".zip";
		
		long fileLength = new File(downLoadPath).length();
		response.setContentType("application/octet-stream");
		response.setHeader("Content-disposition", "attachment; filename="+ new String(realName.getBytes("utf-8"), "ISO8859-1"));
		response.setHeader("Content-Length", String.valueOf(fileLength));

		bis = new BufferedInputStream(new FileInputStream(downLoadPath));
		bos = new BufferedOutputStream(response.getOutputStream());
		
		byte[] buff = new byte[2048];
		int bytesRead;
		while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
			bos.write(buff, 0, bytesRead);
		}
		bis.close();
		bos.close();
		
		return null;
		
	}
	
	
	@RequestMapping(value = "/list/{pageNow}", method = RequestMethod.GET)
	public ModelAndView list(@PathVariable("pageNow") int pageNow) {
		ModelAndView mav = new ModelAndView();
		Page page = new Page(pageNow, Page.DEFAUL_SIZE, userFileService.getCount());
		List<UserFile> files = userFileService.list(pageNow, Page.DEFAUL_SIZE);
		mav.addObject("page", page);
		mav.addObject("file", files);
		mav.setViewName("admin/file/list");
		return mav;
	}
	
	@RequestMapping(value = "/{id}/delete", method = RequestMethod.DELETE)
	@ResponseBody
	public ModelMap delete(@PathVariable("id") long id) {
		UserFile f = userFileService.get(id);
		String path = f.getPath();
		File file = new File(path);
		file.delete();
		userFileService.delete(id);
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("success", "true");
		return modelMap;
	}
	
	@RequestMapping(value = "/{id}/edit", method = RequestMethod.GET)
	public ModelAndView update(@PathVariable("id") long id) {
		return new ModelAndView("admin/file/update","file",userFileService.get(id));
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView update(UserFile userFile) {
		ModelAndView mav = new ModelAndView();
		userFileService.update(userFile);
		mav.addObject("file", userFileService.get(userFile.getId()));
		mav.addObject("success", "<script type='text/javascript'>if (confirm('提示信息：保存成功, 是否返回下载列表 ？')) {location=window.location.href ='admin/file/list/1'}</script>");
		mav.setViewName("admin/file/update");
		return mav;
	}
	

}
