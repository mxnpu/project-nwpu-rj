<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<jsp:include page="header.jsp"></jsp:include>
	<head>
		<link rel="stylesheet" href="../style/searchResultPanelStyle.css" type="text/css" media="screen" />
	</head>
	<body>
	<div id="mainPanel">
		<div id="global_toolbox">
			<ul id="photolayer">
			<li>
				<img id="userPhoto" src="${session.currentUser.photo}" width="150" height="200"/>
			</li>
			<li>
				<form action="searchFriends">
					<div id="search">
						<s:if test="%{userName} != null">
						<input id="search_input" name="userName" type="text" value="#username" />
						<button type="submit">
							<s:text name="friend.search" />
						</button>
						</s:if>
						<s:else>
							<input id="search_input" name="userName" type="text" />
							<br>
							<input type="radio" name="scope" id="scope" value="fromFriends"  />
							<s:text name="friend.goodfriend" /><br/>
							<input type="radio" name="scope" id="scope" value="fromAll" checked="checked"/>
							<s:text name="friend.all" /><br/>
							<button type="submit" id="search_button"></button>
						</s:else>
					</div>
				</form>			
			</li>
		</ul>
		</div>
			<!--Friends Panel-->
			<div id="content_bg">
				<div class="content_tab_header">
					<ul class="content_tab">
						<li class="content_tab_active">
							<a href="#"><span><s:text name="search_user.ask"/></span>
							</a>
						</li>
					</ul>
				</div>
				<div id="content">


					<ul id="content_list">
						<s:iterator value="users" var="user">
							<li class="content_item">
								<ul class="addfriend_editor">
                  					<li><img src="../style/image/icon_search_result.png"/></li>
                  					<li>
                  						<a href="addFriendToRequestList?friendId=<s:property value="#user.idUser" />">
                  							<s:text name="search_user.add"/>
                  						</a>
                  					</li>
                				</ul>
			
								<ul class="friend_item">
										<li class="friend_photo">
											
											<img src="<s:property value="#user.photo" />" />
										</li>
										<li class="friend_detail">
											<span><a href="#user.idUser"><s:property
														value="#user.userName" />
											</a> <br> 
											</span>
										</li>
									</ul> 
							</li>
						</s:iterator>

					</ul>
					<div>
						<s:iterator var="i" begin="1" end="%{totalPage}" step="1">
							<a
								href="<s:url action="searchUser"><s:param name="userName" value="%{userName }"></s:param><s:param name="totalPage" value="%{totalPage }"></s:param><s:param name="pageNow" value="#i"></s:param></s:url>"><s:property
									value="#i" />
							</a>
						</s:iterator>
					</div>
				</div>
				<div id="request" align="right">
					<label>
						<s:text name="friend.friend_ask"/>
					</label>
					<br>
					<s:iterator value="requestList" var="mail">
						<a href="home?userId=<s:property value="#mail.fromUser.idUser"/>" /><s:property value="#mail.fromUser.userName" />

						</a><s:text name="friend.ask_add_friend"/> <a
							href="addFriend?friendId=<s:property value="#mail.fromUser.idUser" />&mailId=<s:property value="#mail.id" />"><s:text name="friend_allow"/></a>

						<a	href="refuseFriend?friendId=<s:property value="#mail.fromUser.idUser" />&mailId=<s:property value="#mail.id" />"><s:text name="friend_refuse"/></a>
						<br>
					</s:iterator>
				</div>
			</div>
			<!--Footer-->
			<div id="footer">
				<jsp:include page="footer.jsp"></jsp:include>
			</div>

		</div>

	</body>
</html>

