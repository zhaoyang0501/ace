<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=7, IE=8">
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-custom.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-ui-custom.min.css">
<link rel="stylesheet" type="text/css"href="${pageContext.request.contextPath}/css/core.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui-1.8.22.min.js"></script>
</head>
<body>
	<%@ include file="top.jsp"%>
	<!----head end -->


	<script type="text/javascript" src="${pageContext.request.contextPath}/js/u_header.js"></script>
	<div class="container">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/ppts.css">
		<div class="row">
			<div class="span12">
				<div class="bread-crumb">
					<a href="#">首页</a>&nbsp;&nbsp;&gt;&nbsp;&nbsp; <a href="#">资源检索</a>
				</div>
			</div>
		</div>

		<div class="row" style="padding-top: 15px;">
			<div class="span4 category_list">
				<ul class="ppt-category-list">
				<li><a class="selected"  href="javascript:void(0);"
						onClick="location.href=build_query(location.href,{category:null})">所有资源</a></li>
				<c:forEach items="${categorys }" var="bean">
				<li><a  href="javascript:void(0);"
						onClick="location.href=build_query(location.href,{category:null})">${bean.name }</a></li>
				</c:forEach>
					
				</ul>
				<form id="ppt-scbar-form" method="get" action="">
					<div id="ppt-scbar">
						<div class="col">
							<input type="text" name="keyword" id="ppt-search"
								placeholder="搜索" value="">
						</div>
						<div class="col">
							<a class="ppt-scbar-btn"></a>
						</div>
					</div>
				</form>

			</div>
			<div class="span8 ppt-list-wrapper">

				<ul class="ppt-list ppt-lists-content">
				<c:forEach items="${resources}" var="bean">
					<li>
						<div>
							<div class="ppt-cover-content">
								<a href="detail?id=${bean.id}"> 
								<img width="180" height="135" alt="${bean.name }" src="${pageContext.request.contextPath}/upload/${bean.imgPath}"
								</a>
							</div>
							<p class="subject">
								<a href="#">${bean.name } </a>
							</p>
							<div class="ppt-visit-count">
								<div class="float-left">
									<span>6803 浏览</span>
								</div>
								<div class="float-right">
									<span>${bean.createDate }</span>
								</div>
							</div>
						</div>
					</li>
				</c:forEach>
				</ul>



				<div class="pagination">
					<div class="page_form">
						到<input type="text" id="page_target" class="page_target">页
						<input type="button" class="button" onClick="goto_page()"
							value="确定">
						<!-- <span class="red tip">此页面不存在</span> -->
					</div>
					<ul>
						<li class="prev disabled"><a href="javascript:void(0);">&lt;</a></li>
						<li class="active"><a href="javascript:void(0);">1</a></li>
						<li><a href="http://djt.qq.com/ppt/lists/?page=2">2</a></li>
						<li><a href="http://djt.qq.com/ppt/lists/?page=3">3</a></li>
						<li><a href="http://djt.qq.com/ppt/lists/?page=4">4</a></li>
						<li class="disabled"><a href="javascript:void(0);">...</a></li>
						<li><a href="http://djt.qq.com/ppt/lists/?page=34">34</a></li>
						<li><a href="http://djt.qq.com/ppt/lists/?page=2">&gt;</a></li>
					</ul>
				</div>
				<!-- 分页结束 -->
			</div>
		</div>
		<!-- 页脚 -->
		<%@ include file="foot.jsp"%>
	</div>

</body>
</html>