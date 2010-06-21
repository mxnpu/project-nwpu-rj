<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
	<jsp:include page="header.jsp"></jsp:include>
	<head>
		<title><s:text name="index.homepage" />
		</title>
		<script type="text/javascript" src="../js/statementAjax.js"></script>
		<script type="text/javascript"
			src="../js/jquery-ui-1.7.2.custom.min.js"></script>
		<script type="text/javascript" src="../js/index.js"></script>
		<script type="text/javascript" src="../js/image.js"></script>
		<link type="text/css" href="../style/jquery-ui-1.7.2.custom.css"
			rel="stylesheet" />
		<link rel="stylesheet" href="../style/frontPagePanelStyle.css"
			type="text/css" media="screen" />

	</head>

	<body id="indexBody" onload="myStmtAjax.getNewStmt()">
	<div id="mainPanel">
		<!--Global Toolbox-->
		<div id="global_toolbox">
			<ul id="linkBox">
				<li><button id="linkButton_friend" onclick="javascript:window.location.href='showFriends.action'"></button></li>
				<li><button id="linkButton_album" onclick="javascript:window.location.href='toalbum.action'"></button></li>
				<li><button id="linkButton_blog" onclick="javascript:window.location.href='showAllBlogs.action'"></button></li>
			</ul>
			<ul id="systemMessageBox">
				<li><h6><s:text name="index.public"></s:text></h6></li>
				<s:iterator value="#session.placards" var="placard" status="i">
					<li>
					<div id='placard_<s:property value="#placard.idPlacard"/>' class="div_placard">
						<label class="placard" onclick="placardObject.show)"
								onmouseover="JavaScript:this.style.cursor='pointer'">
							<s:property value="#placard.title" />
						</label>
					</div>
					<div id='dialog<s:property value="#i.count"/>'
							title='<s:property value="#placard.title"/>'>
						<p><s:property value="#placard.content" /></p>
						<br>
						<s:property value="#placard.time" />
					</div>
					</li>
				</s:iterator>
			</ul>
		</div>

		<div id="content_bg">
			<div id="statementDiv">
				<s:text name="home_state" />
				<label id="showLastStmt"></label>
				<br>
				<textarea rows="2" cols="80" name="statement" id="statement"
						title='<s:text name="index.update_situation"/>'
						onkeydown="myStmtAjax.checkMaxInput()">
  	  			</textarea>
				<br />
				<input type="button" value='<s:text name="index.publish"/>'
						onclick="myStmtAjax.updateStmt()" />
				<label id="remain">150</label>/150
				<br>
				<br>
			</div>
			
			<div id="recent_reply">
				<s:text name="index.mail"></s:text>
				<br>
				<ul id='ul_mail'>
					<s:iterator value="#session.mails" var="mail">
					<li id='li_<s:property value="#mail.id" />'>
						<s:if test="#mail.title == 'Friends Request'">
							<a href='home.action?userId=<s:property value="#mail.fromUser.idUser"/>'>
								<s:property value="#mail.fromUser.userName" /> 
							</a>
							<span> <s:text name="index.addrequest"></s:text> </span>
							<span id="operation_span">
							<label id='add_<s:property value="#mail.fromUser.idUser"/>_<s:property value="#mail.id" />'
										onclick="mailObject.mail(this.id)"
										onmouseover="JavaScript:this.style.cursor='pointer'">
								<s:text name="friend_allow" />
							</label>
							<label id='refuse_<s:property value="#mail.id" />'
										onclick="mailObject.mail(this.id)"
										onmouseover="JavaScript:this.style.cursor='pointer'">
										<s:text name="friend_refuse" />
							</label>
							</span>
						</s:if>
						<s:else>
							<span>${ mail.content}</span>
							<span id="operation_span">
							<label id='close_<s:property value="#mail.id" />'
										onclick="mailObject.mail(this.id)"
										onmouseover="JavaScript:this.style.cursor='pointer'">
										<s:text name="index.closemail" />
							</label>
							</span>
						</s:else>
						</li>
					</s:iterator>
				</ul>
			</div>

			<div class="content_tab_header">
			<ul class="content_tab">
				<li class="content_tab_active">
					<a href="#"><span>My Message Board</span> </a>
				</li>
			</ul>
			</div>
			
			<div id="content">
			<ul id="content_list">
				<s:iterator value="#session.msg" var="message">
					<li class="content_item">
					<s:if test="#message.type == 'statement'">
						<ul class="replayMessage_editor">
							<li><img src="../style/image/icon_message.png" /></li>
							<li><label id="label_<s:property value="#message.item.idItem"/>"
										onclick="replyObject.show(this.id);"
										onmouseover="JavaScript:this.style.cursor='pointer'">
									<s:text name="index.return" />
								</label>
							</li>
							<li>
								<label id="label_<s:property value="#message.item.idItem"/>"
										onclick="replyObject.look(this.id);"
										onmouseover="JavaScript:this.style.cursor='pointer'">
									<s:text name="index.scan" />
								</label>
							</li>
							<li>
								<label id="label_<s:property value="#message.item.idItem"/>"
										onclick="replyObject.hidden(this.id);"
										onmouseover="JavaScript:this.style.cursor='pointer'">
									<s:text name="index.return_hide" />
								</label>
							</li>
						</ul>

						<span class="message_item">
						<ul>
							<li class="message_detail">
								<img alt="Photo" src="<s:property value="#message.owner.photo"/>"
										width="50" height="65"/>
								
								<h3>
									<a href='<s:url action="home.action" namespace="/user">
  	  											<s:param name="userId" value="#message.owner.idUser">
  	  											</s:param>
  	 											</s:url>' >
  	  									<s:property value="#message.owner.userName" /> 
  	  								</a>:
									<s:property value="#message.content" />
									<br />
								</h3>
								
								<span class="blog_date"><s:property value="#message.time" /> </span>
							</li>

							<!--Replys-->
							<div class="replyDiv" id='replyDiv_<s:property value="#message.item.idItem"/>'>
								<ul id='reply_ul_<s:property value="#message.item.idItem"/>'>
								<s:iterator value="#message.replies" var="reply">
									<li class="message_detail_replay">
										<img class="message_photo" src="<s:property value="#reply.user.photo" />" 
												width="40" height="55"/>
										
										<a href='<s:url action="home.action" namespace="/user">
  	  												<s:param name="userId" value="#reply.user.idUser"></s:param>
  	  											</s:url>' > 
  	  										<s:property value="#reply.user.userName" /> 
  	  									</a>
  	  									<span>:<s:property value="#reply.content" /> </span>
 									
										<span class="blog_date"><s:property value="#reply.time" /> </span>
										<label id="label_<s:property value="#reply.idReply"/>_<s:property value="#message.item.idItem"/>"
												onclick="replyDelAjax.deleteReply(this.id)"
												onmouseover="JavaScript:this.style.cursor='pointer'">
											| Delete
										</label>
									</li>
								</s:iterator>
								</ul>
											
								<div class="replySelf" style="display: none" id='replySelf_<s:property value="#message.item.idItem"/>'>
									<textarea id='reply_<s:property value="#message.item.idItem"/>'
											 	class="reply" rows="2" cols="80"
												onkeypress="myStmtAjax.replyCheckMaxInput(this.id)">
  	  								</textarea>
									<br>
									<input id='btn_reply_<s:property value="#message.item.idItem"/>'
											type="button" value='<s:text name="index.return"/>'
											onclick="replyAjax.replyBtn(this.id)" />
									<label id='replyRemain_reply_<s:property value="#message.item.idItem"/>'>150</label>/150

								</div>
							</div>
						</ul> 
						</span>
					</s:if>
					
					<s:if test="#message.type == 'blog'">
					<ul class="replayMessage_editor">
						<li><img src="../style/image/icon_message.png" /></li>
						<li>
							<label id="label_<s:property value="#message.item.idItem"/>"
									onclick="replyObject.show(this.id);"
									onmouseover="JavaScript:this.style.cursor='pointer'">
								<s:text name="index.return" />
							</label>
						</li>
						<li>
							<label id="label_<s:property value="#message.item.idItem"/>"
									onclick="replyObject.look(this.id);"
									onmouseover="JavaScript:this.style.cursor='pointer'">
								<s:text name="index.scan" />
							</label>
						</li>
						<li>
							<label id="label_<s:property value="#message.item.idItem"/>"
									onclick="replyObject.hidden(this.id);"
									onmouseover="JavaScript:this.style.cursor='pointer'">
								<s:text name="index.return_hide" />
							</label>
						</li>
					</ul>
					<span class="message_item">
						<ul>
							<li class="message_detail">
								<img alt="Photo" src="<s:property value="#message.owner.photo"/>"
										width="50" height="65"/>
								<p>
								<h3>
								<a href='<s:url action="home.action" namespace="/user">
  	  										<s:param name="userId" value="#message.owner.idUser">
  	  										</s:param>
  	  									</s:url>' >
  	  								<s:property value="#message.owner.userName" /> 
  	  							</a>
								<s:text name="index.blog_publish" />
								<a href='showBlog.action?id=<s:property value="#message.msgId"/>&&state=show'>
									<s:property value="#message.title" /> 
								</a>
								</h3>
								</p>

								<span class="blog_date"><s:property value="#message.time" /> </span>
								
								<div class="content"><s:property value="#message.content" /></div>
							</li>

							<!--Replys-->
							<div class="replyDiv" id='replyDiv_<s:property value="#message.item.idItem"/>'>
								<ul id='reply_ul_<s:property value="#message.item.idItem"/>'>
								<s:iterator value="#message.replies" var="reply">
									<li class="message_detail_replay">
										<img class="message_photo" src='<s:property value="#reply.user.photo"/>' 
												width="40" height="55"/>
										<p>
										<a href='<s:url action="home.action" namespace="/user">
  	  												<s:param name="userId" value="#reply.user.idUser">
  	  												</s:param>
  	  											</s:url>'> 
  	  										<s:property value="#reply.user.userName" /> 
  	  									</a>
  	  									<span>:<s:property value="#reply.content" /> </span>
										</p>
										<span class="blog_date"><s:property value="#reply.time" /> </span>
										<label id="label_<s:property value="#reply.idReply"/>_<s:property value="#message.item.idItem"/>"
												onclick="replyDelAjax.deleteReply(this.id)"
												onmouseover="JavaScript:this.style.cursor='pointer'">
											| Delete
										</label>
									</li>
								</s:iterator>
								</ul>
							</div>
							<div class="replySelf" style="display: none" id='replySelf_<s:property value="#message.item.idItem"/>'>
								<textarea id='reply_<s:property value="#message.item.idItem"/>'
									class="reply" rows="2" cols="80"
									onkeypress="myStmtAjax.replyCheckMaxInput(this.id)">
  	  							</textarea>
								<br>
								<input id='btn_reply_<s:property value="#message.item.idItem"/>'
										type="button" value='<s:text name="index.return"/>'
										onclick="replyAjax.replyBtn(this.id)" />
								<label id='replyRemain_reply_<s:property value="#message.item.idItem"/>'> 150</label>/150
							</div>
						</ul> 
					</span>
					</s:if>
					</li>
				</s:iterator>

			</ul>
			</div>

		</div>
	</div>

	</body>
</html>
<jsp:include page="footer.jsp"></jsp:include>