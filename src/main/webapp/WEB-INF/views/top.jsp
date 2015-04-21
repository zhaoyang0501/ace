<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="index-topbar-wrapper">
		<div class="light-blue-left"></div>
		<div class="index-topbar clearfix">
			<div class="topbar-light">
				<img alt="腾讯大讲堂 给成长加点料" src="${pageContext.request.contextPath}/images/topbar-light.jpg">
			</div>
			<div class="topbar-logo">
				
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
				<li id="nav_1"><a href="${pageContext.request.contextPath}/index">首页</a></li>
				<li id="nav_3"><a href="${pageContext.request.contextPath}/find">资源检索</a></li>
				<li id="nav_6"><a href="http://djt.qq.com/page/178">我的上传</a></li>
				<li id="nav_6"><a href="http://djt.qq.com/page/178">个人中心</a></li>
			</ul>
		</div>
	</div>