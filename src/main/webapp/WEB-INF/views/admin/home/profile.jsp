<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.hsae.ims.utils.RightUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ch">
<head>
<%@ include file="../common/meta.jsp"%>
<script src="${pageContext.request.contextPath}/js/falgun/bootstrap-datetimepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/js/falgun/bootstrap-datetimepicker.zh-CN.js"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/falgun/bootbox.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script src="${pageContext.request.contextPath}/js/ims/ims.user.js"></script>
<script type="text/javascript">
	$(document).on("click", ".formError", function() {
		$(this).fadeOut(150, function() {
			$(this).closest('.formError').remove();
		});
	});
	 $.validator.setDefaults({
		showErrors: function(map, list) {
			$("form .formError").remove();
				$.each(list, function(index, error) {
					$("#formerror_warp .formErrorContent").html("");
					$("#formerror_warp .formErrorContent").append( error.message+"<br/>");
					$(error.element).before($("#formerror_warp  .formError").clone()).parent().css("position","relative");
					$("form .formError").css("top",-$("form .formError").height());
				});
	}}); 
	
	$(function(){
		$(".date").datetimepicker({
			language:  'zh-CN',
	        weekStart: 1,
	        todayBtn:  1,
	        format:'yyyy-mm-dd',
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			forceParse: 0
        });
		
		var pwd_form = $("#pwd_form").validate({
			errorPlacement: function(error, element) {  
			    error.appendTo(element.parent());  
			},
			rules: {
				pwd_old: {
					required : true,
					minlength: 6
				},
				pwd: {
					required : true,
					minlength: 6
				},
				pwd_comfirm: {
					required : true,
					minlength: 6,
					equalTo : "#pwd"
				}
			},
			messages: {
				pwd_old: {
				    required: "请输入旧密码",
				    minlength: jQuery.format("密码不能小于{0}个字 符")
			    },
				pwd: {
				    required: "请输入新密码",
				    minlength: jQuery.format("密码不能小于{0}个字 符")
			    },
				pwd_comfirm: {
				    required: "请输入确认信密码",
				    minlength: jQuery.format("密码不能小于{0}个字 符"),
				    equalTo: "两次输入的密码不一致！" 
			    },
			},
		});
		$("#btnSave").click(function(){
			if(pwd_form.form()){
				var id = $("hf_id").val();
				$.ims.user.updatepwd(id);
			}
		});
		
	});
</script>
</head>
<body>
	<div class="layout">
		<!-- top -->
		<%@ include file="../top.jsp"%>
		<!-- 导航 -->
		<%@ include file="../menu.jsp"%>
		<input type="hidden" id="hf_id" value="${user.id }" />
		<div class="main-wrapper">
			<div class="container-fluid">
				<div class="row-fluid ">
					<div class="span12">
						<div class="primary-head">
<!-- 							<h3 class="page-header">用户档案</h3> -->
<!-- 							<ul class="top-right-toolbar"> -->
<!-- 								<li><a data-toggle="dropdown" -->
<!-- 									class="dropdown-toggle blue-violate" href="#" title="Users"><i -->
<!-- 										class="icon-user"></i></a></li> -->
<!-- 								<li><a href="#" class="green" title="Upload"><i -->
<!-- 										class=" icon-upload-alt"></i></a></li> -->
<!-- 								<li><a href="#" class="bondi-blue" title="Settings"><i -->
<!-- 										class="icon-cogs"></i></a></li> -->
<!-- 							</ul> -->
						</div>
						<!-- breadcrumb -->
						<%@include file="../breadcrumb.jsp"%>
					</div>
				</div>
				<div class="row-fluid ">
					<div class="span3">
						<div class="profile-thumb">
							<img class="img-polaroid" src="http://placehold.it/140x140">
							<ul class="list-item">
								<li><a style="cursor:pointer" onclick="$.ims.user.showprofileUpdateModal()"><i class="icon-pencil"></i> 修改档案 </a></li>
<!-- 								<li><a onclick=""><i class="icon-picture"></i> 我的照片</a></li> -->
								<li><a style="cursor:pointer" onclick="$.ims.user.showpwdUpdateModal()"><i class="icon-cogs"></i> 密码修改</a></li>
							</ul>
						</div>
					</div>
					<div class="span9">
						<div class="profile-info">
							<div class="tab-widget">
								<ul class="nav nav-tabs" id="myTab1">
									<li class="active"><a href="#user"><i class="icon-user"></i> 档案信息</a></li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="user">
										<div class=" information-container">
											<h4>Basic Info</h4>
											<ul  style="background-color:#edf3f4;" class="profile-intro">
												<li><label style="cursor:default">用   户   名:</label> ${user.username }</li>
												<li><label style="cursor:default">员工姓名:</label> ${user.chinesename }</li>
												<li><label style="cursor:default">员工工号:</label> ${user.empnumber }</li>
												<li><label style="cursor:default">所属部门:</label> ${user.dept == null? "" : user.dept.name }</li>
												<li><label style="cursor:default">员工性别:</label> ${user.sex == "1"? "男":"女" }</li>
												<li><label style="cursor:default">个人邮箱:</label> ${user.email }</li>
												<li><label style="cursor:default">家庭住址:</label> ${user.address }</li>
												<li><label style="cursor:default">联系电话:</label> ${user.phone }</li>
												<li><label style="cursor:default">员工职称:</label> ${(user.title) == null ? "" : user.title.name}</li>
												<li><label style="cursor:default">员工职务:</label> ${user.position == null ? "" : user.position.name}</li>
												<li><label style="cursor:default">出生日期:</label> ${user.birthday }</li>
											</ul>
											<h4>About You</h4>
											<p >${user.resume}</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../foot.jsp"%>
	</div>
	
	<!-- 修改密码弹出框 -->
	<div class="modal hide fade" id="password_edit_modal">
		<div class="modal-header blue">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<label id="password_modal_header_label"></label>
		</div>
		<div class="modal-body">
			<div class="row-fluid">
				<div class="form-container grid-form form-background left-align form-horizontal">
					<form action="" id = "pwd_form">
						<div class="control-group">
							<label class="control-label">旧密码</label>
							<div class="controls">
								<input type="password" id="pwd_old" name="pwd_old" class="span7" />
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">新密码</label>
							<div class="controls">
								<input id='pwd' name='pwd' type="password" class="span7" />
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">新密码确认</label>
							<div class="controls">
								<input id='pwd_comfirm' name='pwd_comfirm' type="password" class="span7" />
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="modal-footer center" id="div_footer">
			<a class="btn btn-primary" id="btnSave" onclick="">保存</a>
			<a href="#" class="btn" data-dismiss="modal" id="closeViewModal">关闭</a>
		</div>
	</div>
	
	<!-- 编辑新增弹出框 -->
	<div class="modal hide fade" id="user_edit_modal">
		<div class="modal-header blue">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<label id="user_modal_header_label"></label>
		</div>
		<div class="modal-body">
			<div class="row-fluid">
				<div class="form-container grid-form form-background left-align form-horizontal">
					<form action="" id = "user_form">
						<table>
							<tr>
								<td>
									<div class="control-group">
										<div style="margin-top:5px; margin-left:42px;" class="form-inline">
											<label> 邮箱：</label>
											<input type="text" id="email" name="email" value="${user.email }" class="span7">
										</div>
										<div style="margin-top:5px; margin-left:42px;" class="form-inline">
											<label> 电话：</label>
											<input type="text" id="phone" name="phone" value="${user.phone }" class="span5">
										</div>
										<div style="margin-top:5px; margin-left:42px;" class="form-inline">
											<label> 住址：</label>
											<input type="text" id="address" name="address" value="${user.address }" class="span7">
										</div>
										<div style="margin-top:5px; margin-left:42px;" class="form-inline">
											<label> 生日：</label>
											<div class=" input-append date">
												<input id="daily_endDate" value="${user.birthday }" style="width: 100px;" type="text" readonly="readonly">
												<span class="add-on"><i class="icon-th"></i></span>
											</div>
										</div>
										<div style="margin-top:5px; margin-left:42px;" class="form-inline">
											<label>性别：</label>
											<select id="sex" name="sex" style="width: 150px;">
												<option value="1">男</option>
												<option value="2">女</option>
											</select>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="control-group">
										<div style="margin-top:5px; margin-left:20px;" class="form-inline">
											<label>个人简介：</label>
											<textarea id="resume" name="resume" style="width:350px;height:80px;">${user.resume }</textarea>
										</div>
									</div>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<div class="modal-footer center" id="div_footer">
			<a class="btn btn-primary" onclick="$.ims.user.profileUpdate()">保存</a>
			<a href="#" class="btn" data-dismiss="modal" id="closeViewModal">关闭</a>
		</div>
	</div>
	
	<!-- 表单验证错误提示 -->
	<div id='formerror_warp'>
		<div class='formError'>
			<div class='formErrorContent'></div>
			<div class='formErrorArrow'>
				<div class='line10'></div>
				<div class='line9'></div>
				<div class='line8'></div>
				<div class='line7'></div>
				<div class='line6'></div>
				<div class='line5'></div>
				<div class='line4'></div>
				<div class='line3'></div>
				<div class='line2'></div>
				<div class='line1'></div>
			</div>
		</div>
	</div>
</body>
</html>