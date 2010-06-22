<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title><s:text name="header.personal_homepage" /></title>
	<script type="text/javascript" src="../js/home.js"></script>
	<script type="text/javascript" src="../js/image.js"></script>
	<link rel="stylesheet" type="text/css" href="../style/mainStyle.css" />
	<link rel="stylesheet" type="text/css" href="../style/navStyle.css"  media="screen" />
	<link rel="stylesheet" type="text/css" href="../style/personalPagePanelStyle.css" media="screen" />
</head>
<jsp:include page="header.jsp"></jsp:include>
<body onload="myStmtAjax.getNewStmt();bodyObject.ready();">
	<div id="hiddenDiv">
		<input type="hidden" id="hidden" name="hidden"
			value='<s:property value="#session.user.idUser"/>' />
	</div>

	<div id="mainPanel">
	<!--Global Toolbox By: WangGuichao-->
	<div id="global_toolbox">
		<s:if test="#session.currentUser.idUser == #session.user.idUser">
			<ul id="photoBox">
				<li>
					<img id="userPhoto" src="${session.currentUser.photo}"
							width="200" height="250" />
				</li>
				<li>
					<br>
					<br>
				</li>
				<li>
					<span><s:text name="home_name" /><s:property value="#session.currentUser.realName" /></span>
				</li>
				<li>
					<br>
				</li>
				<li>
					<span><s:text name="home_birth" /> <s:property value="#session.currentUser.birth" /> </span>
				</li>
				<li>
					<span><s:text name="home_love" /> <s:property value="#session.currentUser.hoby" /> </span>
			    </li>
				<li>
					<br>
					<br>
				</li>
				<li>
					<a style="color: #34425c" href="topersonal_info.action"><s:text name="home_change_photo" /> </a>
				</li>
				<li>
					<a style="color: #34425c" href="topersonal_info.action"><s:text name="home_edit" /> </a>
				</li>

			</ul>
		</s:if>
		<s:else>
			<ul id="photoBox">
				<li>
					<img id="userPhoto" src="${session.user.photo}"
								width="200" height="250"  />
				</li>
				<li>
					<br>
					<br>
				</li>
				<li>
					<span><s:text name="home_name" /> <s:property value="#session.user.realName" /> </span>
				</li>
				<li>
					<br>
				</li>
				<li>		
					<span><s:text name="home_birth" /> <s:property value="#session.user.birthday" /> </span>
				</li>
				<li>
					<span><s:text name="home_love" /> <s:property value="#session.user.hoby" /> </span>
				</li>
				<li>
					<br>
					<br>
				</li>
			</ul>
		</s:else>
	</div>

	<div id="content_bg">
		
		<div class="content_tab_header">
			<span id="personal_state"><s:text name="home_state"/><label id="showLastStmt"></label></span>
			<span id="all_state">
				<!-- 
				<a href=""><s:text name="home_all_state" /></a>
				 -->
			</span>
		</div>
		
		<div id="content">
		<ul id="content_list">
			
			<li id="gossipDiv">
				<span id="latest_blogs"><label><s:text name="gossip_leave_message" /></label></span>
				<span id="all_blogs">
					<a href='<s:url action="allGossip.action">
								<s:param name="userId" value="#session.user.idUser">
  								</s:param>
  							 </s:url>'>
  						<s:text name="home_all_leave_message" /> 
  					</a> 
  				</span>
				<br>
				<textarea rows="3" cols="95"
						id='textarea_gossip_<s:property value="#session.user.idUser"/>'
						title='<s:text name="gossip_give_message"/>' name="gossip"
						class="gossip" onkeypress="InputCheck.checkMaxInput(this.id);">
				</textarea>
				<br>
				<br>
				<br>
				<br>
				<br>
				<span id="gossip_remain">
					<input id='btn_gossip_<s:property value="#session.user.idUser"/>'
						type="button" value='<s:text name="gossip_message"/>'
						onclick="myGossipAjax.addGossip(this.id);"/>
					<label id="gossip_remain_<s:property value="#session.user.idUser"/>">200</label>/200
				</span>
				<br>
				<br/>
			</li>
		
			<li id="blogDiv">
				<span id="latest_blogs"><s:text name="home_bloglist"></s:text></span>
				<span id="all_blogs"> 
					<a href='<s:url action="showAllBlogs.action">
  							<s:param name="userId" value="#session.user.idUser"></s:param>
  							</s:url>'>
						<s:text name="home_allblogs"></s:text> 
					</a>
				</span> 
				<br>
				<s:iterator value="#session.blogMsg" var="msg">
				<li class="content_item">
					<ul class="blog_editor">
						<li>
							<img src="../style/image/icon_blog.png" />
						</li>
						<li>
							<a href='<s:url action="showBlog.action">
  										<s:param name="id" value="#msg.msgId"></s:param>
  										<s:param name="state" value="'show'"></s:param>
  									</s:url>'>
  									Edit
  							</a>
  						</li>		
						<li>
							<a href='<s:url action="deleteBlog.action">
  										<s:param name="id" value="#msg.msgId"></s:param>
  									</s:url>'>Delete</a>
  						</li>
					</ul>	
					<ul class="blog_item">
						<li class="message_detail">
						<p> 
							<a href='<s:url action="showBlog.action">
  										<s:param name="id" value="#msg.msgId"></s:param>
  										<s:param name="state" value="'show'"></s:param>
  									</s:url>'>
								<s:property value="#msg.title" /> 
							</a>
						</p>

						<span class="blog_date"><s:property value="#msg.time" /></span>
						<br>
						<s:property value="#msg.content" />
						<br>
						</li>
					</ul> 

				</li>
				</s:iterator>
			</li>
	

			<li id="gossipListDiv">
				<ul id='ui_gossip_<s:property value="#session.user.idUser"/>'>
					<s:iterator value="#session.gossipMsg" var="message">
					<li class="content_item">
						<ul class="replayMessage_editor">
							<li>
								<label id='label_reply_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>'
											onclick="myGossipAjax.addReply(this.id);"
											onmouseover="JavaScript:this.style.cursor='pointer'">
										<s:text name="title.return" />
								</label>
							</li>
							<li>
								<label id='label_reply_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>'
										onclick="myGossipReplyAjax.showAllReplies(this.id);"
										onmouseover="JavaScript:this.style.cursor='pointer'">
									<s:text name="home_read" />
								</label>
							</li>
							<li>
								<label id='label_reply_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>'
										onclick="myGossipReplyAjax.hiddenAllReplies(this.id);"
										onmouseover="JavaScript:this.style.cursor='pointer'" >
									<s:text name="home_stop" />
			    				</label>
							</li>
						</ul>
					
						<ul class="message_item">
							<li class="message_detail">
								<img class="message_photo" src='<s:property value="#message.owner.photo"/>'
										width="50" height="65"/>
								<p>
									<a href='<s:url action="home.action">
												<s:param name="userId" value="#message.owner.idUser">
  												</s:param>
  											</s:url>' 
  									    id='href_<s:property value="#message.title"/>'> 
  									  <s:property value="#message.owner.userName" />
  								    </a>
  								    <span>:<s:property value="#message.content" /> </span>
									<br>
								</p>
								<span class="blog_date"><s:property value="#message.time" /></span>
								<s:if test="#session.currentUser.idUser == #session.user.idUser">
									<label id='label_del_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>'
											onclick="myGossipAjax.delGossip(this.id);"
											onmouseover="JavaScript:this.style.cursor='pointer'" >
										  | <s:text name="gossip_delete" />
									</label>
								</s:if>
								<s:elseif test="#session.currentUser.idUser == #message.owner.idUser">
									<label id='label_del_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>'
											onclick="myGossipAjax.delGossip(this.id);"
											onmouseover="JavaScript:this.style.cursor='pointer'">
										  | <s:text name="gossip_delete" />
									</label>
								</s:elseif>
							</li>
							
							<li>
							<!--Replys-->
							<ul id='gossip_reply_ul_<s:property value="#message.title"/>' class="gossip_reply_ul">
								<s:iterator value="#message.replies" var="reply">								
									<li class="message_detail_replay">
										<img class="message_photo" src="<s:property value="#reply.user.photo" />" 
												width="50" height="65"/>
										<p>
										<a href='<s:url action="home.action" namespace="/user">
  	  												<s:param name="userId" value="#reply.user.idUser">
  	  												</s:param>
  	  												</s:url>' > 
  	  										<s:property value="#reply.user.userName" /> 
  	  									</a>
  	  									<span>:<s:property value="#reply.content" /> </span>
										</p>

										<span class="blog_date"><s:property value="#reply.time" /> </span>
 										<s:if test="#session.currentUser.idUser == #session.user.idUser">
											<label id='label_reply_del_<s:property value="#reply.idReply"/>_<s:property value="#message.title"/>'
													onclick="myGossipReplyAjax.delReply(this.id);"
													onmouseover="JavaScript:this.style.cursor='pointer'">
												  | <s:text name="gossip_delete" />
											</label>
										</s:if>
										<s:elseif test="#session.currentUser.idUser == #reply.user.idUser">
											<label id='label_reply_del_<s:property value="#reply.idReply"/>_<s:property value="#message.title"/>'
													onclick="myGossipReplyAjax.delReply(this.id);"
													onmouseover="JavaScript:this.style.cursor='pointer'">
												  | <s:text name="gossip_delete" />
											</label>
										</s:elseif>
									</li>								
								</s:iterator>
							</ul>
							</li>
						</ul> 
					</li>
					</s:iterator>
				</ul>
			</li>
		</ul>
		<br>
		</div>
	</div>
	</div>
	</body>
	<jsp:include page="footer.jsp"></jsp:include>
</html>
