package com.pzy.action;  
  
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.pzy.entity.User;
import com.pzy.service.UserService;
 
@ParentPackage("struts-default")  
public class IndexAction extends ActionSupport {  
 
	private User user;
	@Autowired
	private UserService userService;
	
	@Action(value = "index", results = { @Result(name = "success", location = "/WEB-INF/views/index.jsp") })  
    public String index() throws Exception {  
        return SUCCESS;  
    }  
    @Action(value = "center", results = { @Result(name = "success", location = "/WEB-INF/views/center.jsp") })  
    public String center() throws Exception {  
        return SUCCESS;  
    } 
    @Action(value = "register", results = { @Result(name = "success", location = "/WEB-INF/views/register.jsp") })  
    public String register() throws Exception {  
        return SUCCESS;  
    }  
    @Action(value = "registerUser", results = { @Result(name = "success", location = "/WEB-INF/views/registerok.jsp") })  
    public String registerUser() throws Exception {  
    	userService.save(user);
        return SUCCESS;  
    } 
    public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
}