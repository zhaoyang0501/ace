package com.pzy.action;  
  
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import com.opensymphony.xwork2.ActionSupport;
 
@ParentPackage("struts-default")  
public class IndexAction extends ActionSupport {  
 
  
  
    @Action(value = "index", results = { @Result(name = "success", location = "/WEB-INF/views/index.jsp") })  
    public String index() throws Exception {  
        return SUCCESS;  
    }  
    @Action(value = "center", results = { @Result(name = "success", location = "/WEB-INF/views/center.jsp") })  
    public String center() throws Exception {  
        return SUCCESS;  
    }  
}