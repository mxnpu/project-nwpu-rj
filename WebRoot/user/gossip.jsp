<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<jsp:include page="header.jsp"></jsp:include>
	<head>
		<title><s:text name="gossip_leave_message" /></title>
		<script type="text/javascript" src="../js/jquery-ui-1.7.2.custom.min.js"></script>
		<script type="text/javascript" src="../js/gossip.js"></script>
		<link type="text/css" href="../style/jquery-ui-1.7.2.custom.css" rel="stylesheet" />	
		<link rel="stylesheet" href="../style/viewMessagePanelStyle.css" type="text/css" media="screen" />
	</head>
	
	<body onload="bodyObject.ready()">
	<div id="mainPanel">
		<div id="global_toolbox">
			<ul id="photoBox">
				<li>
					<br><br>
					<img alt="Photo" src="${session.user.photo}" width="150" height="200"/>
				</li>
				<li>
					<br>
					<span><s:text name="gossip_name" /><s:property value="#session.user.realName" /></span>
				</li>
			</ul>
		</div>

		<div id="content_bg">
			<!-- Gossip or reply text area -->
			<div id="gossipDiv">
				<label>
					<s:text name="gossip_leave_message" />
				</label>
				<br />
				<form action="addGossipCommon.action" method="POST" id="gossipForm">
					<input type="hidden" id="userIdHidden" name="userIdHidden"
							value='<s:property value="#session.user.idUser"/>'>
					<input type="hidden" id="gossipIdHidden" name="gossipIdHidden"
							value=''>
					<textarea rows="3" cols="100" id='textarea_gossip_<s:property value="#session.user.idUser"/>'
							title='<s:text name="gossip_give_message"/>' name="gossip"
							class="gossip" onkeypress="InputCheck.checkMaxInput(this.id);">
					</textarea>
					<br />
					<input id='btn_gossip_<s:property value="#session.user.idUser"/>'
							type="button" value='<s:text name="gossip_message"/>'
							onclick="myGossip.submit();"/>
					<label id="gossip_remain_<s:property value="#session.user.idUser"/>">200</label>/200
				</form>
				<br>
				<br>
			</div>

			<div id="content">
				<!-- <ul id='ui_gossip_<s:property value="#session.user.idUser"/>'> -->
				<ul id="content_list">
				<s:iterator value="messages" var="message">
					<li class="content_item">
						<ul class="replayMessage_editor" >
							<li><img src="../style/image/icon_message.png" /></li>
							<li id='li_gossip_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>' 
  									class="li_gossip_div">
								<label id='label_reply_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>'
										onclick="myGossip.addReply(this.id);"
										onmouseover="JavaScript:this.style.cursor='pointer'">
									<s:text name="gossip_return" />
								</label>
							</li>
							<s:if test="#session.currentUser.idUser == #session.user.idUser">
							<li id='li_gossip_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>' 
  									class="li_gossip_div">
								<label id='label_del_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>'
										class="del_label" onmouseover="JavaScript:this.style.cursor='pointer'">
									<s:text name="gossip_delete" />
								</label>
							</li>
							</s:if>
							<s:elseif test="#session.currentUser.idUser == #message.owner.idUser">
							<li id='li_gossip_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>' 
  									class="li_gossip_div">
								<label id='label_del_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>'
										class="del_label" onmouseover="JavaScript:this.style.cursor='pointer'">
									<s:text name="gossip_delete" />
								</label>
							</li>
							</s:elseif>
						</ul>
						
						<ul class="message_item">
							<li class="message_detail">
								<img class="message_photo" src="<s:property value="#message.owner.photo"/>" 
									width="50" height="65"/>
							
								<a href='<s:url action="home.action">
											<s:param name="userId" value="#message.owner.idUser"></s:param>
										</s:url>'
									id='href_<s:property value="#message.title"/>'> 
									<s:property value="#message.owner.userName" /> 
								</a>
								<span>:<s:property value="#message.content" /> </span>
								<span class="blog_date"><s:property value="#message.time" /> </span>
								<br>
							</li>
							<!--Replys-->
							<li id='gossip_reply_list' class="gossipReply">
								<ul id='gossip_reply_ul_<s:property value="#message.title"/>'
									class="gossip_reply_ul">
								<s:iterator value="#message.replies" var="reply">
									<li class="message_detail_replay">
										<div id='li_gossip_reply_<s:property value="#reply.idReply"/>_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>' 
  												class="li_gossip_del_div">
											<img class="message_photo" src='<s:property value="#reply.user.photo" />' width="50" height="65"/>
											<a href='<s:url action="home.action" namespace="/user">
  	  													<s:param name="userId" value="#reply.user.idUser"></s:param>
  	  												</s:url>'> 
  	  											<s:property value="#reply.user.userName" /> 
  	  										</a>
											<span>:<s:property value="#reply.content" /> </span>
											<span class="blog_date"><s:property value="#reply.time" /> </span>
											<br>
											
											<s:if test="#session.currentUser.idUser == #session.user.idUser">
											<label id='label_reply_del_<s:property value="#reply.idReply"/>_<s:property value="#message.title"/>'
													class="label_reply_del" onmouseover="JavaScript:this.style.cursor='pointer'">
												<s:text name="gossip_delete" />
											</label>
 											</s:if>
											<s:elseif test="#session.currentUser.idUser == #reply.user.idUser">
											<label id='label_reply_del_<s:property value="#reply.idReply"/>_<s:property value="#message.title"/>'
													class="label_reply_del" onmouseover="JavaScript:this.style.cursor='pointer'">
												<s:text name="gossip_delete" />
											</label>
											</s:elseif>
										</div>
									</li>
								</s:iterator>
								</ul>
							</li>
						</ul>
					</li>
				</s:iterator>
				</ul>

				<div>
					<s:iterator var="i" begin="1" end="%{totalPage}" step="1">
						<a href='<s:url action="getGossipByPage">
									<s:param name="totalPage" value="%{totalPage }"></s:param>
									<s:param name="pageNow" value="#i"></s:param>
						</s:url>'>
						<s:property value="#i" /> </a>
						<s:set name="endCount" value="%{totalPage}"></s:set>
						<s:if test="#i != #endCount">-</s:if>
					</s:iterator>
				</div>
				
				<!-- UI-dialog -->
				<div id="dialog" title='<s:text name="gossip_delete_confirm"/>'>
					<p><s:text name="gossip_you_delete_confirm" /></p>
				</div>
			</div>
		</div>
	</div>
	</body>
	<jsp:include page="footer.jsp"></jsp:include>
</html>
