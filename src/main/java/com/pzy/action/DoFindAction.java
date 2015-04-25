package com.pzy.action;  
  
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
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
import com.pzy.entity.Category;
import com.pzy.entity.Resource;
import com.pzy.entity.User;
import com.pzy.service.CategoryService;
import com.pzy.service.ResourceService;
import com.pzy.service.UserService;
 
@ParentPackage("struts-default")  
public class DoFindAction extends ActionSupport  {
	private String key;
	private Long categoryId;
	private List<Category> categorys;
	public List<Resource> getResources() {
		return resources;
	}

	public void setResources(List<Resource> resources) {
		this.resources = resources;
	}

	private List<Resource> resources;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private ResourceService resourceService;
	 @Action(value = "dofind", results = { @Result(name = "success", location = "/WEB-INF/views/find.jsp") })  
	public String doFind(){
		 /**中文乱码问题*/
		 try {
			 if(key!=null)
			 key=java.net.URLDecoder.decode(key , "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		resources=this.resourceService.findAll(1, 1000,key,categoryId).getContent();
    	categorys=this.categoryService.findAll();
		return SUCCESS;
	}
	
	/***get set**/
	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}
	public List<Category> getCategorys() {
		return categorys;
	}

	public void setCategorys(List<Category> categorys) {
		this.categorys = categorys;
	}

	public ResourceService getResourceService() {
		return resourceService;
	}

	public void setResourceService(ResourceService resourceService) {
		this.resourceService = resourceService;
	}
}