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


	<div class="index-topbar-wrapper">
		<div class="light-blue-left"></div>
		<div class="index-topbar clearfix">
			<div class="topbar-light">
				<img alt="腾讯大讲堂 给成长加点料" src="${pageContext.request.contextPath}/images/topbar-light.jpg">
			</div>
			<div class="topbar-logo">
				<a href="http://djt.qq.com/home/index/" title="返回首页"><img
					alt="腾讯大讲堂 给成长加点料" src="${pageContext.request.contextPath}/images/logo.png"></a>
			</div>

			<div class="login-container" id="login_container">
				<div class="user-name-wrapper">
					<div class="user-name-inner">
						<span class="user-name"><strong class="vwmy qq">温家宝
						</strong>&nbsp;</span><span class="sf-sub-indicator"> ?</span>
					</div>
					<ul class="user-name-dropdown" style="width: 82px;">
						<li><a href="javascript:void(0)" onClick="change_username()">修改用户名</a></li>
						<li><a href="http://djt.qq.com/bbs/space-uid-1177537.html">个人资料</a></li>
						<li><a
							href="http://djt.qq.com/user/logout?ref_url=http%3A%2F%2Fdjt.qq.com%2Fppt%2Flists%2F&1177537">退出</a></li>
					</ul>
				</div>
			</div>

			<ul class="topbar-nav-list sf-menu" id="djt_menu">
				<li id="nav_1"><a href="http://djt.qq.com/home/index">首页</a></li>
				<li id="nav_3"><a href="http://djt.qq.com/article/">资源检索</a></li>
				<li id="nav_6"><a href="http://djt.qq.com/page/178">我的上传</a></li>
				<li id="nav_6"><a href="http://djt.qq.com/page/178">个人中心</a></li>
			</ul>
		</div>
	</div>
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
					<li><a class="selected" href="javascript:void(0);"
						onClick="location.href=build_query(location.href,{category:null})">所有PPT<span
							class="total_events">(390)</span></a></li>
					<li><a class="" href="javascript:void(0);"
						onClick="location.href=build_query(location.href,{category:16})">腾讯大讲堂系列讲座(45)</a></li>
					<li><a class="" href="javascript:void(0);"
						onClick="location.href=build_query(location.href,{category:17})">产品沙龙(31)</a></li>
					<li><a class="" href="javascript:void(0);"
						onClick="location.href=build_query(location.href,{category:18})">业界大会(221)</a></li>
					<li><a class="" href="javascript:void(0);"
						onClick="location.href=build_query(location.href,{category:19})">开发沙龙(71)</a></li>
					<li><a class="" href="javascript:void(0);"
						onClick="location.href=build_query(location.href,{category:22})">Tπ互联网青会年(22)</a></li>
				</ul>
				<form id="ppt-scbar-form" method="get" action="">
					<div id="ppt-scbar">
						<div class="col">
							<input type="text" name="keyword" id="ppt-search"
								placeholder="搜索PPT" value="">
						</div>
						<div class="col">
							<a class="ppt-scbar-btn"></a>
						</div>
					</div>
				</form>

			</div>
			<div class="span8 ppt-list-wrapper">

				<ul class="ppt-list ppt-lists-content">
					<li>
						<div>
							<div class="ppt-cover-content">
								<a href="http://djt.qq.com/ppt/462"> <img width="180"
									height="135" src="${pageContext.request.contextPath}/images/26104141251.gif">
								</a>
							</div>
							<p class="subject">
								<a href="http://djt.qq.com/ppt/462">京东商城双十一技术实战 </a>
							</p>
							<div class="ppt-visit-count">
								<div class="float-left">
									<span>6803 浏览</span>
								</div>
								<div class="float-right">
									<span>2015-1-26</span>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div>
							<div class="ppt-cover-content">
								<a href="http://djt.qq.com/ppt/460"> <img width="180"
									height="135" src="${pageContext.request.contextPath}/images/26104014475.gif">
								</a>
							</div>
							<p class="subject">
								<a href="http://djt.qq.com/ppt/460">当当价格系统架构分析 </a>
							</p>
							<div class="ppt-visit-count">
								<div class="float-left">
									<span>6532 浏览</span>
								</div>
								<div class="float-right">
									<span>2015-1-26</span>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div>
							<div class="ppt-cover-content">
								<a href="http://djt.qq.com/ppt/461"> <img width="180"
									height="135" src="${pageContext.request.contextPath}/images/26103932616.gif">
								</a>
							</div>
							<p class="subject">
								<a href="http://djt.qq.com/ppt/461">乐蜂网前端数据收集方案及架构 </a>
							</p>
							<div class="ppt-visit-count">
								<div class="float-left">
									<span>6082 浏览</span>
								</div>
								<div class="float-right">
									<span>2015-1-26</span>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div>
							<div class="ppt-cover-content">
								<a href="http://djt.qq.com/ppt/459"> <img width="180"
									height="135" src="${pageContext.request.contextPath}/images/240_180_27100946283.jpg">
								</a>
							</div>
							<p class="subject">
								<a href="http://djt.qq.com/ppt/459">2014WOT技术峰会深圳站（腾讯安全平台部江虎）</a>
							</p>
							<div class="ppt-visit-count">
								<div class="float-left">
									<span>7831 浏览</span>
								</div>
								<div class="float-right">
									<span>2014-11-27</span>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div>
							<div class="ppt-cover-content">
								<a href="http://djt.qq.com/ppt/458"> <img width="180"
									height="135" src="${pageContext.request.contextPath}/images/240_180_03154232220.jpg">
								</a>
							</div>
							<p class="subject">
								<a href="http://djt.qq.com/ppt/458">58同城推荐系统设计与实现</a>
							</p>
							<div class="ppt-visit-count">
								<div class="float-left">
									<span>10424 浏览</span>
								</div>
								<div class="float-right">
									<span>2014-11-3</span>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div>
							<div class="ppt-cover-content">
								<a href="http://djt.qq.com/ppt/457"> <img width="180"
									height="135" src="${pageContext.request.contextPath}/images/240_180_03145437403.jpg">
								</a>
							</div>
							<p class="subject">
								<a href="http://djt.qq.com/ppt/457">APM 大数据在安全方面的应用</a>
							</p>
							<div class="ppt-visit-count">
								<div class="float-left">
									<span>9208 浏览</span>
								</div>
								<div class="float-right">
									<span>2014-11-3</span>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div>
							<div class="ppt-cover-content">
								<a href="http://djt.qq.com/ppt/456"> <img width="180"
									height="135" src="${pageContext.request.contextPath}/images/240_180_03145332512.jpg">
								</a>
							</div>
							<p class="subject">
								<a href="http://djt.qq.com/ppt/456">主机卫士主动防御</a>
							</p>
							<div class="ppt-visit-count">
								<div class="float-left">
									<span>6493 浏览</span>
								</div>
								<div class="float-right">
									<span>2014-11-3</span>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div>
							<div class="ppt-cover-content">
								<a href="http://djt.qq.com/ppt/455"> <img width="180"
									height="135" src="${pageContext.request.contextPath}/images/240_180_29095352811.png">
								</a>
							</div>
							<p class="subject">
								<a href="http://djt.qq.com/ppt/455">开放，前所未见</a>
							</p>
							<div class="ppt-visit-count">
								<div class="float-left">
									<span>1570 浏览</span>
								</div>
								<div class="float-right">
									<span>2014-9-29</span>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div>
							<div class="ppt-cover-content">
								<a href="http://djt.qq.com/ppt/454"> <img width="180"
									height="135" src="${pageContext.request.contextPath}/images/240_180_29095249480.png">
								</a>
							</div>
							<p class="subject">
								<a href="http://djt.qq.com/ppt/454">透过QQ群看产品设计</a>
							</p>
							<div class="ppt-visit-count">
								<div class="float-left">
									<span>2247 浏览</span>
								</div>
								<div class="float-right">
									<span>2014-9-29</span>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div>
							<div class="ppt-cover-content">
								<a href="http://djt.qq.com/ppt/453"> <img width="180"
									height="135" src="${pageContext.request.contextPath}/images/240_180_29095145458.png">
								</a>
							</div>
							<p class="subject">
								<a href="http://djt.qq.com/ppt/453">揭秘天天飞车</a>
							</p>
							<div class="ppt-visit-count">
								<div class="float-left">
									<span>2754 浏览</span>
								</div>
								<div class="float-right">
									<span>2014-9-29</span>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div>
							<div class="ppt-cover-content">
								<a href="http://djt.qq.com/ppt/452"> <img width="180"
									height="135" src="${pageContext.request.contextPath}/images/240_180_29095053661.png">
								</a>
							</div>
							<p class="subject">
								<a href="http://djt.qq.com/ppt/452">QQ大数据及其应用介绍</a>
							</p>
							<div class="ppt-visit-count">
								<div class="float-left">
									<span>4730 浏览</span>
								</div>
								<div class="float-right">
									<span>2014-9-29</span>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div>
							<div class="ppt-cover-content">
								<a href="http://djt.qq.com/ppt/451"> <img width="180"
									height="135" src="${pageContext.request.contextPath}/images/240_180_29094929789.png">
								</a>
							</div>
							<p class="subject">
								<a href="http://djt.qq.com/ppt/451">模式识别技术在微信中的应用</a>
							</p>
							<div class="ppt-visit-count">
								<div class="float-left">
									<span>4292 浏览</span>
								</div>
								<div class="float-right">
									<span>2014-9-29</span>
								</div>
							</div>
						</div>
					</li>
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
		<div id="footer" >
			<div class="footer_menu">
					<a class="navl" href="#">关于我们</a>
				 |  <a class="navl" target="_blank"href="#">网站地图</a>
				  | <a class="navl" target="_blank" href="#">RSS订阅</a>
				|   <a class="navl" target="_blank" href="#">不良信息举报</a> |
			</div>
			<p style="padding-top: 5px">Copyright © 1998 - 2013 pzy. All Rights Reserved.&nbsp;&nbsp;XX公司 版权所有</p>
		</div>
	</div>

</body>
</html>