package com.pzy.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;

import com.opensymphony.xwork2.ActionSupport;
import com.pzy.entity.Resource;
import com.pzy.service.ResourceService;
@ParentPackage("struts-default")  
public class DetailAction extends ActionSupport{
	private Long id;
	private Resource resource;
	private List<Resource> resources;
	private Boolean isVideo;
	private String vodeoNames[]={"avi", "rmvb","rm" ,"asf","divx","mpg","mpeg","mpe","wmv","mp4","mkv","vob"};
	@Autowired
	private ResourceService resourceService;
	@Action(value = "detail", results = { @Result(name = "success", location = "/WEB-INF/views/detail.jsp") })
	public String detail(){
		resource=resourceService.find(id);
		Assert.notNull(resource);
		resources=resourceService.find(resource.getCategory());
		isVideo=isAvideoFile(StringUtils.getFilenameExtension(resource.getFilePath()));
		return SUCCESS;
	}
	/***
	 * 判断是否为视频文件
	 * @param fileName
	 * @return
	 */
	private Boolean isAvideoFile(String fileName){
		Assert.notNull(fileName);
		fileName=fileName.toLowerCase();
		for(int i=0;i<vodeoNames.length;i++){
			if(vodeoNames[i].equals(fileName))
				return true;
		}
		return false;
	}
	/**getter setter**/
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Resource getResource() {
		return resource;
	}
	public void setResource(Resource resource) {
		this.resource = resource;
	}
	public Boolean getIsVideo() {
		return isVideo;
	}
	public void setIsVideo(Boolean isVideo) {
		this.isVideo = isVideo;
	}
	public List<Resource> getResources() {
		return resources;
	}
	public void setResources(List<Resource> resources) {
		this.resources = resources;
	}
}
