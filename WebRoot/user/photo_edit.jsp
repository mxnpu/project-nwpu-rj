<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<jsp:include page="header.jsp"></jsp:include>
<html>
	<head>
		<title><s:text name="index.edit_photo" /></title>
		<script type="text/javascript" src="../js/image.js"></script>
	</head>

	<body>
		<div id="mainPanel">
			<div id="photo">
				<s:form action="fileUpload.action" method="post"
					enctype="multipart/form-data">
					<img id="photo" alt="Photo" src="${session.currentUser.photo}" 
							width="150" height="200"/>
					<br />
					<s:file id="uploadimg" name="photo" 
						onchange="ImageObject.preViewImage(this.id, 'preview', 'more')"></s:file>
					<s:submit type="submit" value="上传"></s:submit>
				</s:form>
			</div>
			<!-- preview  panel -->
			<div id="preview"></div> 
		</div>
	</body>
</html>
<jsp:include page="footer.jsp"></jsp:include>