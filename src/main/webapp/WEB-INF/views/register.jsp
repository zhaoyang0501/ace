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
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
<link href="${pageContext.request.contextPath}/css/datetimepicker.css" rel="stylesheet">
<script type="text/javascript">
	$(document).ready(function(){
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
	});
</script>
</head>
<body>
	<%@ include file="top.jsp"%>
	<!----head end -->


	<script type="text/javascript" src="${pageContext.request.contextPath}/js/u_header.js"></script>
	<div class="container">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/ppts.css">
		<div class="row" style="padding-top: 15px;">
		
			<div class="span12" >
			<h1>新用户注册</h1>
					<form class="form-horizontal center"  method="post" action="${pageContext.request.contextPath}/registerUser" style="border: 1px solid #E2E2E2;padding-top: 20px;">
					  <div class="control-group">
					    <label class="control-label" for="userName">用户名</label>
					    <div class="controls">
					      <input type="text" id="userName" name="user.userName" placeholder="">
					    </div>
					  </div>
					  
					  <div class="control-group">
					    <label class="control-label" for="password">密码</label>
					    <div class="controls">
					      <input type="text" name="user.password" placeholder="">
					    </div>
					  </div>
					  
					   <div class="control-group">
					    <label class="control-label" for="user.school">学校</label>
					    <div class="controls">
					      <input type="text" name="user.school" placeholder="">
					    </div>
					  </div>
					  
					  <div class="control-group">
					    <label class="control-label" for="user.className">班级</label>
					    <div class="controls">
					      <input type="text"  name="user.className" >
					    </div>
					  </div>
					  
					    <div class="control-group">
					    <label class="control-label" for="inputPassword">性别</label>
					    <div class="controls">
					      <select name="user.sex">
					       <option value=""></option>
					      <option value="男">男</option>
					      <option value="女">女</option>
					      </select>
					    </div>
					  </div>
					  
					   <div class="control-group">
					    <label class="control-label" for="user.birthDay">生日</label>
					    <div class="controls">
					      <div class=" input-append date">
										 <input class="user.birthDay"  type="text" value="" readonly="readonly" >
										 <span class="add-on"><i class="icon-th"></i></span>
							</div>
					    </div>
					  </div>
					  
					  <div class="control-group">
					    <div class="controls">
					      <button type="submit" class="btn">注册</button>
					    </div>
					  </div>
				</form>
			</div>
		</div>
		<!-- 页脚 -->
		<%@ include file="top.jsp"%>
	</div>

</body>
</html>