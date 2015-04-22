package com.pzy.action;  
  
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.pzy.entity.User;
import com.pzy.service.UserService;
 
@ParentPackage("struts-default")  
public class IndexAction extends ActionSupport implements SessionAware {  
	private Map<String,Object> session;
	private User user;
	private String tip;
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
    @Action(value = "login", results = { @Result(name = "success", location = "/WEB-INF/views/login.jsp") })  
    public String login() throws Exception {  
        return SUCCESS;  
    } 
    @Action(value = "loginout", results = { @Result(name = "success", location = "/WEB-INF/views/index.jsp") })  
    public String loginout() throws Exception {  
    	ActionContext.getContext().getSession().clear();
        return SUCCESS;  
    } 
    @Action(value = "dologin", 
    		results = { @Result(name = "success", location = "/WEB-INF/views/index.jsp") ,
    					@Result(name = "login", location = "/WEB-INF/views/login.jsp") })  
    public String dologin() throws Exception { 
    	User loginuser=userService.login(user.getClassName(), user.getPassword());
    	if(loginuser!=null){
    		session.put("user",loginuser );
            return SUCCESS; 
    	}
    	else{
    		ActionContext.getContext().getSession().clear();
    		//session.remove(session.get("user"));
    		this.tip="登陆失败 不存在此用户名或密码!";
    		return LOGIN;
    	}
    		 
    } 
    /**setter getter~~~~~~~~~~~~~*/
    public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session=arg0;
	}
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
}