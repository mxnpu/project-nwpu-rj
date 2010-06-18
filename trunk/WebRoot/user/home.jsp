<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<title><s:text name="header.personal_homepage" />
		</title>
		<script type="text/javascript" src="../js/home.js"></script>
		<script type="text/javascript" src="../js/image.js"></script>

		<link rel="stylesheet" type="text/css" href="../style/mainStyle.css" />
		<link rel="stylesheet" href="../style/navStyle.css" type="text/css"
			media="screen" />
		<link rel="stylesheet" href="../style/personalPagePanelStyle.css"
			type="text/css" media="screen" />
	</head>
	<jsp:include page="header.jsp"></jsp:include>
	<body onload="myStmtAjax.getNewStmt();">
		<div id="hiddenDiv">
			<input type="hidden" id="hidden" name="hidden"
				value='<s:property value="#session.user.idUser"/>' />
		</div>

		<div id="mainPanel">
			<!--Global Toolbox By: WangGuichao-->
			<div id="global_toolbox">
				<s:if test="#session.currentUser.idUser == #session.user.idUser">
					<ul id="photoBox">
						<!--主人的头像-->

						<li>
							<img id="userPhoto" src="${session.currentUser.photo}"
								width="150" height="200" />
						</li>
						<li>
							<span><s:text name="home_name" /> <s:property
									value="#session.currentUser.realName" /> </span>
							<br>
							<span><s:text name="home_birth" /> <s:property
									value="#session.currentUser.birthday" /> </span>
							<br>
							<span><s:text name="home_love" /> <s:property
									value="#session.currentUser.hoby" /> </span>
							<br>
						</li>
						<li>
							<br>
						</li>
						<li>
							<a style="color: #34425c" href="editPhoto.action"><s:text
									name="home_change_photo" /> </a>
						</li>
						<li>
							<a style="color: #34425c" href="topersonal_info.action"><s:text
									name="home_edit" /> </a>
						</li>

					</ul>
				</s:if>
				<s:else>
					<ul id="photoBox">
						<!--主人的头像-->

						<li>
							<img id="userPhoto" src="${session.user.photo}"
								onload="ImageObject.changImageSize(this, 150, 200)" />
						</li>
						<li>
							<span><s:text name="home_name" /> <s:property
									value="#session.user.realName" /> </span>
							<br>
							<span><s:text name="home_birth" /> <s:property
									value="#session.user.birthday" /> </span>
							<br>
							<span><s:text name="home_love" /> <s:property
									value="#session.user.hoby" /> </span>
							<br>
						</li>

					</ul>
				</s:else>
			</div>

			<div id="content_bg">
				<div class="content_tab_header">
					<span id="personal_state"><label id="showLastStmt"></label>
					</span>
					<span id="all_state"><a href=""><s:text
								name="home_all_state" /> </a> </span>

				</div>
				<div id="content">
					<ul id="content_list">
						<div id="blogDiv">
							<s:text name="home_bloglist"></s:text>
							<span> <a
								href='<s:url action="showAllBlogs.action">
  						<s:param name="userId" value="#session.user.idUser"></s:param>
  					</s:url>'>
									<s:text name="home_allblogs"></s:text> </a> </span>
							<br>
							<s:iterator value="#session.blogMsg" var="msg">
								<li class="content_item">
									<ul class="blog_editor">
										<li>
											<img src="../style/image/icon_blog.png" />
										</li>
										<li>
											<a href="#">Edit</a>
										</li>
										<li>
											<a href="#">Delete</a>
										</li>

									</ul>
									<span class="blog_item">
										<ul>
											<li class="message_detail">

												<p>
													<a
														href='<s:url action="showBlog.action">
  														<s:param name="id" value="#msg.msgId"></s:param>
  														<s:param name="state" value="'show'"></s:param>
  														</s:url>'>
														<s:property value="#msg.title" /> </a>
												</p>

												<span class="blog_date"><s:property value="#msg.time" /></span>
												<br>
												<s:property value="#msg.content" />
												<br>
											</li>
										</ul> </span>

								</li>
							</s:iterator>


						</div>




						<div id="gossipDiv">
							<label>
								<s:text name="gossip_leave_message" />
							</label>
							|
							<span><a
								href='<s:url action="allGossip.action"><s:param name="userId" value="#session.user.idUser">
  					</s:param></s:url>'><s:text
										name="home_all_leave_message" /> </a> </span>
							<br>
							<textarea rows="3" cols="80"
								id='textarea_gossip_<s:property value="#session.user.idUser"/>'
								title='<s:text name="gossip_give_message"/>' name="gossip"
								class="gossip" onkeypress=
	InputCheck.checkMaxInput(this.id);
></textarea>
							<br />
							<input id='btn_gossip_<s:property value="#session.user.idUser"/>'
								type="button" value='<s:text name="gossip_message"/>'
								onclick=
	myGossipAjax.addGossip(this.id);;;;;;;;;;;;;;;;
/>
							<label
								id="gossip_remain_<s:property value="#session.user.idUser"/>">
								200
							</label>
							/200
						</div>

						<div id="gossipListDiv">

							<ul id='ui_gossip_<s:property value="#session.user.idUser"/>'>
								<s:iterator value="#session.gossipMsg" var="message">
									<li class="content_item">
										<ul class="replayMessage_editor">

											<li>
												<label
													id='label_reply_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>'
													onclick=
	myGossipAjax.addReply(this.id);
>
													<s:text name="title.return" />
												</label>
											</li>
											<li>
												<label
													id='label_reply_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>'
													onclick=
	myGossipReplyAjax.showAllReplies(this.id);
>
													<s:text name="home_read" />
												</label>
											</li>

											<li>
												<label
													id='label_reply_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>'
													onclick=
	myGossipReplyAjax.hiddenAllReplies(this.id);
>
													<s:text name="home_stop" />
												</label>
											</li>
										</ul>
										<span class="message_item">
											<ul>
												<li class="message_detail">
													<!--头像URL-->
													<img class="message_photo"
														src='<s:property value="#message.owner.photo"/>'
														onload="ImageObject.changImageSize(this, 50, 65)" />
													<!--自由发挥-->
													<p>
														<a
															href='<s:url action="home.action"><s:param name="userId" value="#message.owner.idUser">
  					</s:param></s:url>'
															target="_blank"
															id='href_<s:property value="#message.title"/>'> <s:property
																value="#message.owner.userName" /> </a>
														<span>:<s:property value="#message.content" /> </span>
														<br>
													</p>

													<span class="blog_date"><s:property value="#message.time" /></span>


													<s:if
														test="#session.currentUser.idUser == #session.user.idUser">
														<label
															id='label_del_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>'
															onclick=
	myGossipAjax.delGossip(this.id);
>
															<s:text name="gossip_delete" />
														</label>
													</s:if>
													<s:elseif
														test="#session.currentUser.idUser == #message.owner.idUser">
														<label
															id='label_del_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>'
															onclick=
	myGossipAjax.delGossip(this.id);
>
															<s:text name="gossip_delete" />
														</label>
													</s:elseif>

												</li>

												<!--Replys-->

												<ul
													id='gossip_reply_ul_<s:property value="#message.title"/>'
													class="gossip_reply_ul">
													<s:iterator value="#message.replies" var="reply">
														<div
															id='li_gossip_reply_<s:property value="#reply.idReply"/>'>
															<li class="message_detail_replay">
																<img class="message_photo" src="<s:property
																			value="#reply.user.photo" />" />
																<p>
																	<a
																		href='<s:url action="home.action" namespace="/user">
  	  								<s:param name="userId" value="#reply.user.idUser"></s:param></s:url>'
																		target="_blank"> <s:property
																			value="#reply.user.userName" /> </a><span>:<s:property
																			value="#reply.content" /> </span>
																</p>

																<span class="blog_date"><s:property
																		value="#reply.time" /> </span>

																<s:if
																	test="#session.currentUser.idUser == #session.user.idUser">
																	<label
																		id='label_reply_del_<s:property value="#reply.idReply"/>_<s:property value="#message.title"/>'
																		onclick=
	myGossipReplyAjax.delReply(this.id);
>
																		<s:text name="gossip_delete" />
																	</label>
																</s:if>
																<s:elseif
																	test="#session.currentUser.idUser == #reply.user.idUser">
																	<label
																		id='label_reply_del_<s:property value="#reply.idReply"/>_<s:property value="#message.title"/>'
																		onclick=
	myGossipReplyAjax.delReply(this.id);
>
																		<s:text name="gossip_delete" />
																	</label>
																</s:elseif>
															</li>
														</div>
													</s:iterator>
												</ul>
											</ul> </span>

									</li>
								</s:iterator>
							</ul>
						</div>

					</ul>

					<br>
				</div>
			</div>

		</div>


		<!--  
		<div id="wrap">

			
			<div id="statementDiv">
				<span><s:property value="#session.user.realName" /> </span>
				<s:text name="home_state" />
				<label id="showLastStmt"></label>
				|
				<span><a href=""><s:text name="home_all_state" /> </a> </span>
				<br />
				<br />
			</div>

		
			<div id="personalityDiv">
				<s:if test="#session.currentUser.idUser == #session.user.idUser">
					<img alt="Photo" src="${session.currentUser.photo}" width="150"
						height="200" />
					<br />
					<span><s:text name="home_name" /> <s:property
							value="#session.currentUser.realName" /> </span>
					<br>
					<span><s:text name="home_birth" /> <s:property
							value="#session.currentUser.birthday" /> </span>
					<br>
					<span><s:text name="home_love" /> <s:property
							value="#session.currentUser.hoby" /> </span>
					<br>
					<a href="editPhoto.action"><s:text name="home_change_photo" />
					</a> | 
  	  		<a href="topersonal_info.action"><s:text name="home_edit" />
					</a>
					<br />
				</s:if>
				<s:else>
					<img alt="Photo" src="${session.user.photo}"
						onload="ImageObject.changImageSize(this, 150, 200)" />
					<br />
					<span><s:text name="home_name" /> <s:property
							value="#session.user.realName" /> </span>
					<br>
					<span><s:text name="home_birth" /> <s:property
							value="#session.user.birthday" /> </span>
					<br>
					<span><s:text name="home_love" /> <s:property
							value="#session.user.hoby" /> </span>
					<br>
					<br />
				</s:else>
				<br />
			</div>

			<div id="blogDiv">
				<span><s:text name="home_bloglist"></s:text> </span>
				<br>
				<ul>
					<s:iterator value="#session.blogMsg" var="msg">
						<li>
							<hr />
							<div>
								<a
									href='<s:url action="showBlog.action">
  								<s:param name="id" value="#msg.msgId"></s:param>
  								<s:param name="state" value="'show'"></s:param>
  							</s:url>'>
									<s:property value="#msg.title" /> </a>
								<br>
								<s:property value="#msg.content" />
								<br>
								<a
									href='<s:url action="showBlog.action">
  								<s:param name="id" value="#msg.msgId"></s:param>
  								<s:param name="state" value="'show'"></s:param>
  							</s:url>'>
									<s:text name="home.blog.detail"></s:text> </a>
							</div>
						</li>
					</s:iterator>
				</ul>
				<span> <a
					href='<s:url action="showAllBlogs.action">
  						<s:param name="userId" value="#session.user.idUser"></s:param>
  					</s:url>'>
						<s:text name="home_allblogs"></s:text> </a> </span>
				<br>
				<br>
			</div>


			<div id="gossipDiv">
				<label>
					<s:text name="gossip_leave_message" />
				</label>
				|
				<span><a
					href='<s:url action="allGossip.action"><s:param name="userId" value="#session.user.idUser">
  					</s:param></s:url>'><s:text
							name="home_all_leave_message" /> </a> </span>
				<br>
				<textarea rows="3" cols="80"
					id='textarea_gossip_<s:property value="#session.user.idUser"/>'
					title='<s:text name="gossip_give_message"/>' name="gossip"
					class="gossip" onkeypress=
	InputCheck.checkMaxInput(this.id);
></textarea>
				<br />
				<input id='btn_gossip_<s:property value="#session.user.idUser"/>'
					type="button" value='<s:text name="gossip_message"/>'
					onclick=
	myGossipAjax.addGossip(this.id);;;;
/>
				<label id="gossip_remain_<s:property value="#session.user.idUser"/>">
					200
				</label>
				/200
			</div>

			<div id="gossipListDiv">
				<ul id='ui_gossip_<s:property value="#session.user.idUser"/>'>
					<s:iterator value="#session.gossipMsg" var="message">
						<li>
							<div id='li_gossip_<s:property value="#message.title"/>'>
								<img alt="Photo"
									src='<s:property value="#message.owner.photo"/>'
									onload="ImageObject.changImageSize(this, 50, 65)" />
								<br />
								<a
									href='<s:url action="home.action"><s:param name="userId" value="#message.owner.idUser">
  					</s:param></s:url>'
									target="_blank" id='href_<s:property value="#message.title"/>'>
									<s:property value="#message.owner.userName" /> </a>
								<span>:<s:property value="#message.content" /> </span>
								<br>
								<span><s:property value="#message.time" /> |</span>
								<label
									id='label_reply_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>'
									onclick=
	myGossipReplyAjax.showAllReplies(this.id);
>
									<s:text name="home_read" />
								</label>
								<label
									id='label_reply_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>'
									onclick=
	myGossipReplyAjax.hiddenAllReplies(this.id);
>
									<s:text name="home_stop" />
								</label>
								<label
									id='label_reply_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>'
									onclick=
	myGossipAjax.addReply(this.id);
>
									<s:text name="title.return" />
								</label>
								<s:if test="#session.currentUser.idUser == #session.user.idUser">
									<label
										id='label_del_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>'
										onclick=
	myGossipAjax.delGossip(this.id);
>
										<s:text name="gossip_delete" />
									</label>
								</s:if>
								<s:elseif
									test="#session.currentUser.idUser == #message.owner.idUser">
									<label
										id='label_del_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>'
										onclick=
	myGossipAjax.delGossip(this.id);
>
										<s:text name="gossip_delete" />
									</label>
								</s:elseif>

								<div id='gossip_reply_list' class="gossipReply">
									<ul id='gossip_reply_ul_<s:property value="#message.title"/>'
										class="gossip_reply_ul">
										<s:iterator value="#message.replies" var="reply">
											<li>
												<div
													id='li_gossip_reply_<s:property value="#reply.idReply"/>'>
													<a
														href='<s:url action="home.action" namespace="/user">
  	  								<s:param name="userId" value="#reply.user.idUser"></s:param></s:url>'
														target="_blank"> <s:property
															value="#reply.user.userName" /> </a>
													<span>:<s:property value="#reply.content" /> </span>
													<br>
													<span><s:property value="#reply.time" /> </span>
													<s:if
														test="#session.currentUser.idUser == #session.user.idUser">
														<label
															id='label_reply_del_<s:property value="#reply.idReply"/>_<s:property value="#message.title"/>'
															onclick=
	myGossipReplyAjax.delReply(this.id);
>
															<s:text name="gossip_delete" />
														</label>
													</s:if>
													<s:elseif
														test="#session.currentUser.idUser == #reply.user.idUser">
														<label
															id='label_reply_del_<s:property value="#reply.idReply"/>_<s:property value="#message.title"/>'
															onclick=
	myGossipReplyAjax.delReply(this.id);
>
															<s:text name="gossip_delete" />
														</label>
													</s:elseif>
												</div>
											</li>
										</s:iterator>
									</ul>
								</div>
							</div>
							<hr />
						</li>
					</s:iterator>
				</ul>
				<span><a
					href='<s:url action="allGossip.action"><s:param name="userId" value="#session.user.idUser">
  					</s:param></s:url>'><s:text
							name="home_all_leave_message" /> </a> </span>
				<br>
			</div>

			<div id="friendDiv">
			</div>


		</div>-->
	</body>
	<jsp:include page="footer.jsp"></jsp:include>
</html>
