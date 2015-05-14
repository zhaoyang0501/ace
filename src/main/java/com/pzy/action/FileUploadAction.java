package com.pzy.action;  
  
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.pzy.entity.Log;
import com.pzy.entity.Resource;
import com.pzy.entity.User;
import com.pzy.service.CategoryService;
import com.pzy.service.LogService;
import com.pzy.service.ResourceService;
import com.pzy.service.UserService;
 
@ParentPackage("json-default")
public class FileUploadAction extends ActionSupport {
	/**上传的文件*/
    private File file;  
    /**上传的文件ContentType*/
    private String fileContentType;  
    /**上传的文件名*/
    private String fileFileName; 
	
    private File filePath;  
    /**上传的文件ContentType*/
    private String filePathContentType;  
    /**上传的文件名*/
    private String filePathFileName; 
    
    public File getFilePath() {
		return filePath;
	}
	public void setFilePath(File filePath) {
		this.filePath = filePath;
	}
	public String getFilePathContentType() {
		return filePathContentType;
	}
	public void setFilePathContentType(String filePathContentType) {
		this.filePathContentType = filePathContentType;
	}
	public String getFilePathFileName() {
		return filePathFileName;
	}
	public void setFilePathFileName(String filePathFileName) {
		this.filePathFileName = filePathFileName;
	}
	private String tip;
    @Action(value = "ajaxdoUpload", results = { @Result(name = "success", type = "json") }, params = {
			"contentType", "text/html" })
	public String ajaxdoUpload(){
		/**文件上传逻辑*/
		String realpath = ServletActionContext.getServletContext().getRealPath("/upload");
		System.out.println(realpath);
		File savefile = new File(new File(realpath), this.fileFileName);
         try {
			FileUtils.copyFile(file, savefile);
		} catch (IOException e) {
			e.printStackTrace();
			return ERROR;
		}
         tip="上传成功";
		return SUCCESS;
	}
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	public String getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
	
}