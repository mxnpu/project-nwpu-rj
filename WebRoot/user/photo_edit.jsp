<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<jsp:include page="header.jsp"></jsp:include>
<html>
	<head>
		<title><s:text name="index.edit_photo"/></title>
	</head>

	<body>
		<div id="wrap">
			<div id="photo">
				<s:form action="fileUpload.action" method="post" enctype="multipart/form-data">
					<img alt="Photo" src="${session.currentUser.photo}" />
					<br />
					<s:file name="photo"></s:file>
					<s:submit type="submit" value="上传"></s:submit>
				</s:form>
			</div>
		</div>
	</body>
</html>
<jsp:include page="footer.jsp"></jsp:include>