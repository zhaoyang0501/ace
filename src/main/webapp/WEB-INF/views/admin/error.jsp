<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ch">
<%@ include file="common/meta.jsp"%>
<head>
<link href="${pageContext.request.contextPath}/css/chosen.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ims/ims.project.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/falgun/bootbox.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/falgun/chosen.jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ims/ims.common.js"></script>
<script type="text/javascript">

	$(document).ready(function(){		

		$(".chzn-select").chosen({
			allow_single_deselect : false,
			search_contains : false
		});

		$.ims.common.findAllUser(function(){
			$("#s_pm").chosen({
				allow_single_deselect : true,
				no_results_text : "没有找到这个用户.",
				disable_search_threshold : 5,
				enable_split_word_search : true,
				search_contains : true
			});
		}, "s_pm");
		
		$.ims.common.findAllUser(function(){
			$("#pm").chosen({
				allow_single_deselect : true,
				no_results_text : "没有找到这个用户.",
				disable_search_threshold : 5,
				enable_split_word_search : true,
				search_contains : true
			});
		}, "pm");
		$.ims.project.initProjectDataTable();
	});
</script>
</head>
<body>
	<div class="layout">
		<div class="container error-wrapper">
			<div class="row">
				<div class="span4 offset2">
					<div class="error-code">
						error
						<div>
						</div>
					</div>
				</div>
				<div class="span5">
					<div class="error-message">
						<h4>Oops! Page not found... </h4>
						<p>
							 We are sorry the page you are trying to reach dose not exist :(
						</p>
						<ul class="error-suggestion">
							<li>Check to be sure you have a correct username and password. If it's a link, it could be out of date and no longer available on the website. </li>
							<li>Visiting our full website <a href="${pageContext.request.contextPath}/j_spring_security_logout">sitemap here.</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>