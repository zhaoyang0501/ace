<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ch">
<%@ include file="../common/meta.jsp"%>
<head>
<link href="${pageContext.request.contextPath}/css/chosen.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/ace/admin.user.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/falgun/bootbox.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/falgun/chosen.jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	});
</script>
</head>
<body>
	<div class="layout">
		<!-- top -->
		<%@ include file="../top.jsp"%>
		<!-- 导航 -->
		<%@ include file="../menu.jsp"%>
		
		<input type="hidden" id="hf_id" />

		<div class="main-wrapper">
			<div class="container-fluid">
				<%@include file="../breadcrumb.jsp"%>
				<div class="row-fluid ">
					<div class="span12">
						<div class="content-widgets light-gray">
							<div class="widget-head  bondi-blue" >
								<h3>用户信息列表</h3>
							</div>
							<div class="box well form-inline">
								<span>员工姓名：</span>
								<input type="text" id="userName" class="span1">
								<a onclick="$.adminUser.initSearchDataTable()"
									class="btn btn-info" data-loading-text="正在加载..."><i class="icon-search"></i>查询</a>
							</div>
							<div class="widget-container">
								
									<a class="btn btn-success" style="float: right; margin: 5px;" onclick="$.ims.user.showUserAddModal()"><i class="icon-plus"></i> 新增用户</a>
								<table class="responsive table table-striped table-bordered"
									id="dt_user_view">
									<thead>
										<tr>
											<th >id</th>
											<th >用户名</th>
											<th >密码</th>
											<th >学习</th>
											<th >班级</th>
											<th >性别</th>
											<th>生日</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../foot.jsp"%>
	</div>

	<!-- 编辑新增弹出框 -->
	<div class="modal hide fade" id="user_edit_modal">
		<div class="modal-header blue">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<label id="user_modal_header_label"></label>
		</div>
		<div class="modal-body" style="height:600px;">
			<div class="row-fluid">
				<div class="form-container grid-form form-background left-align form-horizontal">
					<table>
						<tr>
							<td>
								<div class="control-group">
									<div style="margin-top:5px; margin-left:20px;" class="form-inline">
										<label><font style="color:red;">*</font> 用户账号：</label>
										<input type="text" id="username" name="username" class="span8">
									</div>
									<div style="margin-top:8px; margin-left:20px;" class="form-inline">
										<label><font style="color:red;">*</font> 中文姓名：</label>
										<input type="text" id="chinesename" name="chinesename" class="span8">
									</div>
									<div style="margin-top:8px; margin-left:20px;" class="form-inline">
										<label><font style="color:red;">*</font> 员工工号：</label>
										<input type="text" id="empnumber" name="empnumber" class="span8">
									</div>
									<div style="margin-top:10px; margin-left:20px;" class="form-inline">
										<label><font style="color:red;">*</font> 所属部门：</label>
										<select id="dept" name="dept" data-placeholder="请选择部门" style="width: 160px;">
											<option></option>
										</select>
									</div>
								</div>
							</td>
							<td>
								<div class="control-group">
									<div style="margin-top:5px; margin-left:20px;" class="form-inline">
										<label>电话：</label>
										<input type="text" id="phone" name="phone" class="span8">
									</div>
									<div style="margin-top:5px; margin-left:20px;" class="form-inline">
										<label>性别：</label>
										<select id="sex" name="sex" data-placeholder="请选择性别" style="width: 150px;">
										</select>
									</div>
									<div style="margin-top:5px; margin-left:20px;" class="form-inline">
										<label>职称：</label>
										<select id="position" name="position" data-placeholder="请选择职务" style="width: 150px;">
											<option></option>
										</select>
									</div>
									<div style="margin-top:5px; margin-left:20px;" class="form-inline">
										<label>职务：</label>
										<select id="title" name="title" data-placeholder="请选择职称" style="width: 150px;">
											<option></option>
										</select>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div style="margin-top:5px; margin-left:28px;" class="form-inline">
									<label>权限范围：</label>
									<select id="authorityScope" name="authorityScope" data-placeholder="请选择权限范围" style="width: 160px;">
										<option></option>
									</select>
								</div></div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="form-inline">
									<div style="margin-top:5px; margin-left:20px;" class="form-inline">
										<label>是否需要周报：</label>
										<input type="checkbox" id="weekreport" name="weekreport" checked="checked">
									</div>
									<div style="margin-top:5px; margin-left:20px;" class="form-inline">
										<label>是否参加培训：</label>
										<input type="checkbox" id="train" name="train" checked="checked">
									</div>
									<div style="margin-top:5px; margin-left:20px;" class="form-inline">
										<label>是否需要考勤：</label>
										<input type="checkbox" id="attendance" name="attendance" checked="checked">
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="control-group">
									<div style="margin-top:5px; margin-left:20px;" class="form-inline">
										<label>个人简介：</label>
										<textarea id="resume" name="resume" style="width:350px;height:50px;"></textarea>
									</div>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div class="modal-footer center" id="div_footer">
			<a class="btn btn-primary" onclick="$.ims.user.saveOrUpdateUser()">保存</a>
			<a href="#" class="btn" data-dismiss="modal" id="closeViewModal">关闭</a>
		</div>
	</div>
	
	<!-- 详细信息 -->
	<div class="modal hide fade" id="user_details_modal">
		<div class="modal-header blue">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<label>用户信息详情</label>
		</div>
		<div class="modal-body" style="max-height:800px;">
			<div class="row-fluid">
				<div class="form-container grid-form form-background left-align form-horizontal">
					<table class="table table-striped table-bordered table-condensed">
						<tr><td style="width:30%; text-align: right;">用户名：</td><td><label id="display_username"></label></td></tr>
						<tr><td style="text-align: right;">工号：</td><td><label id="display_no"></label></td></tr>
						<tr><td style="text-align: right;">姓名：</td><td><label id="display_chinesename"></label></td></tr>
						<tr><td style="text-align: right;">部门：</td><td><label id="display_dept"></label></td></tr>
						<tr><td style="text-align: right;">权限代码：</td><td><label id="display_authorityCode"></label></td></tr>
						<tr><td style="text-align: right;">权限范围：</td><td><label id="display_authorityScope"></label></td></tr>
						<tr><td style="text-align: right;">性别：</td><td><label id="display_sex"></label></td></tr>
						<tr><td style="text-align: right;">邮箱：</td><td><label id="display_email"></label></td></tr>
						<tr><td style="text-align: right;">住址：</td><td><label id="display_address"></label></td></tr>
						<tr><td style="text-align: right;">电话：</td><td><label id="display_telephone"></label></td></tr>
						<tr><td style="text-align: right;">职称：</td><td><label id="display_title"></label></td></tr>
						<tr><td style="text-align: right;">职务：</td><td><label id="display_position"></label></td></tr>
						<tr><td style="text-align: right;">生日：</td><td><label id="display_birthday"></label></td></tr>
						<tr><td style="text-align: right;">个人简介：</td><td><label id="display_resume"></label></td></tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>