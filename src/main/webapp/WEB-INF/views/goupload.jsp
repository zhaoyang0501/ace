<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
	<%@ include file="validateLogin.jsp"%>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/spark-md5.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui-1.8.22.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
<link href="${pageContext.request.contextPath}/css/datetimepicker.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript">
	var start,end;
	$(document).ready(function(){
		/**监听表单提交事件*/
		$("form").submit( function () {
			if( $("#resourcemd5Str").val()==""){
				alert("未上传资源文件");
				return false;
			}else{
				$("#file").removeAttr("name");
				return true;
			}
		} );
		
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
		var formvalidate= $("#resource_form").validate({
			errorPlacement: function(error, element) {
				$( element ).closest(".controls").append( error );
			},
			ignore:"",
			rules: {
				"resource.name":  "required",
				"categoryId":  "required",
				"imgPath":  "required",
				"filePath":  "required"
				},
			messages: {
				"resource.name":  "请填写资源名称",
				"categoryId":  "请选择资源类别",
				"imgPath":  "请上传缩略图图片",
				"filePath":  "请上传资源文件"
				
			}
		});
		/**读取到文件MD5回调函数*/
		 function readFileMd5CallBack(md5){
			 /**首先根据文件的Md5查找数据库看有没有被上传，如果数据库已经有此文件，则记录文件名MD5，否则上传文件*/
			 $.get("findResourceByMd5?md5="+md5, function(data){
				  if(data.resource==null){
					  $("#resourcemd5Str").val(md5);
					  $("#resourcefilePath").val($("#file").val());
					  $.ajaxFileUpload( {
					      url : 'ajaxdoUpload',     //用于文件上传的服务器端请求地址  
					      secureuri : false,            //一般设置为false  
					      fileElementId : "file",        //文件上传的id属性  <input type="file" id="file" name="file" />  
					      dataType : 'text',            //返回值类型 一般设置为json  
					      success : function(data, status) {
					    	  end=new Date().getTime();
					          alert("上传成功，总用时"+(end-start)/1000+"秒");
					      },
					      error : function(status) { // 服务器响应失败时的处理函数
					    	  alert(status+"上传出错");
					      }
					    })
				  }else{
					  $("#resourcemd5Str").val(data.resource.md5Str);
					  $("#resourcefilePath").val(data.resource.filePath);
					  end=new Date().getTime();
					  alert("启动秒传上传成功，总用时"+(end-start)/1000+"秒");
				  }
				});
		 }
		 /***监听上传按钮点击事件*/
		 $("#fileupload_btn").click( function() {
			 start=new Date().getTime();
			    var fileReader = new FileReader(), box = document.getElementById('box');
			    blobSlice = File.prototype.mozSlice || File.prototype.webkitSlice || File.prototype.slice, file = document.getElementById("file").files[0], chunkSize = 2097152,
			    chunks = 1, currentChunk = 0, spark = new SparkMD5();
			    fileReader.onload = function(e) {
			        spark.appendBinary(e.target.result);
			        currentChunk++;
			        if (currentChunk < chunks) {
			            loadNext();
			        } else {
			        	/**读取到了MD5后调用回调函数 判断是否上传文件*/
			        	readFileMd5CallBack(spark.end());
			        }
			    };
			    function loadNext() {
			        var start = currentChunk * chunkSize, end = start + chunkSize >= file.size ? file.size : start + chunkSize;
			        fileReader.readAsBinaryString(blobSlice.call(file, start, end));
			    }

			    loadNext();
			});
		
	});
</script>
</head>
<body>
	<%@ include file="top.jsp"%>
	<!----head end -->


	<script type="text/javascript" src="${pageContext.request.contextPath}/js/u_header.js"></script>
	<div class="container">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/ppts.css"/>
		<div class="row" style="padding-top: 15px;">
		
			<div class="span12" >
			<h3> ${ resource.id ==null?"上传资源":"修改资源"}</h3>
					<form id='resource_form' class="form-horizontal center" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/doUpload" style="border: 1px solid #E2E2E2;padding-top: 20px;">
					  <input type="hidden" name='resource.id' value="${resource.id }">
					  <input type="hidden" id='resourcemd5Str' name='resource.md5Str' value="${resource.md5Str }">
					  <input type="hidden" id='resourcefilePath' name='resource.filePath' value="${resource.filePath }">
					  <div class="control-group">
					    <label class="control-label" for="userName">资源名称</label>
					    <div class="controls">
					      <input type="text"  name="resource.name" placeholder="" value='${resource.name}'/>
					    </div>
					  </div>
					   <div class="control-group">
					    <label class="control-label" for="userName">类别</label>
					    <div class="controls">
					     	<select name='categoryId' value="${resource.category.id }">
					     	<option value=""></option>
					     		<c:forEach items="${categorys }" var="bean">
					     		<c:if test="${resource.category.id==bean.id}">
					     			<option selected="selected" value="${bean.id }">${bean.name }</option>
					     		</c:if>
					     		<c:if test="${resource.category.id!=bean.id}">
					     			<option value="${bean.id }">${bean.name }</option>
					     		</c:if>
					     		</c:forEach>
					     	</select>
					    </div>
					  </div>
					  <div class="control-group">
					    <label class="control-label" for="userName">是否允许别人下载</label>
					    <div class="controls">
					     	<select name='resource.allowDownload' value="${resource.allowDownload}">
					     	<option value=""></option>
					     	<c:if test="${resource.allowDownload=='是'}">
					     		<option selected="selected" value="是">是</option>
					     		<option value="否">否</option>
					     	</c:if>
					     	<c:if test="${resource.allowDownload=='否'}">
					     		<option  value="是">是</option>
					     		<option selected="selected" value="否">否</option>
					     	</c:if>	
					     	
					     	<c:if test="${resource.allowDownload==null}">
					     		<option  value="是">是</option>
					     		<option  value="否">否</option>
					     	</c:if>	
					     	</select>
					    </div>
					  </div>
					  <div class="control-group">
					    <label class="control-label" for="userName">是否允许别人播放</label>
					    <div class="controls">
					     	<select name='resource.allowPlay' value="${resource.allowPlay}">
					     	<option value=""></option>
					     	<c:if test="${resource.allowPlay=='是'}">
					     		<option selected="selected" value="是">是</option>
					     		<option value="否">否</option>
					     	</c:if>
					     	<c:if test="${resource.allowPlay=='否'}">
					     		<option  value="是">是</option>
					     		<option selected="selected" value="否">否</option>
					     	</c:if>	
					     	
					     	<c:if test="${resource.allowPlay==null}">
					     		<option  value="是">是</option>
					     		<option  value="否">否</option>
					     	</c:if>	
					     	</select>
					    </div>
					  </div>
					  <div class="control-group">
					    <label class="control-label" for="password">缩略图</label>
					    <div class="controls">
					      <input name='imgPath' type="file" class="file" >
					    </div>
					  </div>
					   <div class="control-group">
					    <label class="control-label" for="user.school">选择文件</label>
					    <div class="controls">
					      <input  name='file' id='file' type="file" class="file"> <input value="上传" id='fileupload_btn' type="button" class="btn" >
					    </div>
					  </div>
					  
					   <div class="control-group">
					    <label class="control-label" for="password">描述</label>
					    <div class="controls">
					      <textarea rows="3" cols="" name='resource.remark'>${resource.remark }</textarea>
					    </div>
					  </div>
					  
					  <div class="control-group">
					    <div class="controls">
					      <button type="submit" class="btn">提交</button>
					    </div>
					  </div>
				</form>
			</div>
		</div>
		<!-- 页脚 -->
		<%@ include file="foot.jsp"%>
	</div>

</body>
</html>