package com.pzy.action.admin;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionSupport;

@Namespace("/admin")
public class IndexAction  extends ActionSupport{
     @Action(value = "/adminindex", results = { @Result(name = "success", location = "/WEB-INF/views/admin/index.jsp") })
     public String index(){
          return SUCCESS;
     }
}

