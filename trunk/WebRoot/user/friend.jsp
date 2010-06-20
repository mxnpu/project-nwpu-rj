<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<jsp:include page="header.jsp"></jsp:include>
  	<head>
    	<title><s:text name="friend.myfriend"/></title>
		<script type="text/javascript" src="../js/jquery-ui-1.7.2.custom.min.js"></script>
		<script type="text/javascript" src="../js/friend.js"></script>
		<link type="text/css" href="../style/jquery-ui-1.7.2.custom.css" rel="stylesheet" />
		<link rel="stylesheet" href="../style/addFriendPanelStyle.css" type="text/css" media="screen" />
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
							<input type="radio" name="scope" id="scope" value="fromFriends" checked="checked" />
							<s:text name="friend.goodfriend" /><br/>
							<input type="radio" name="scope" id="scope" value="fromAll" />
							<s:text name="friend.all" /><br/>
							<button type="submit" id="search_button"></button>
						</s:else>
					</div>
				</form>			
			</li>
		</ul>
 	</div>
  	<div id="content_bg">
  		<div class="content_tab_header">
			<ul class="content_tab">
				<li class="content_tab_active">
					<a href="#"><span>Add Friends</span> </a>
				</li>
			</ul>
		</div>
		<div id="content">
			<ul id="content_list">
				<s:iterator value="friends" var="user">
				<li class="content_item">
					<ul class="addfriend_editor">
						<li><img src="../style/image/icon_add_friend.png" /></li>
						<li> 
							<div id='<s:property value="#user.idUser" />' class="delete_friend_div">
 				  				<label class="delete_friend" onmouseover="JavaScript:this.style.cursor='pointer'"><s:text name="friend.delete_friend"/></label>
   							</div>
						</li>
					</ul>
				
					<ul id="content_list" class="friend_item">
						<li class="friend_photo">
							<img src="<s:property value="#user.photo" />" />
						</li>
							<li class="friend_detail">
								<span>
									Name: 
									<a href="home?userId=<s:property value="#user.idUser"/>">
										<s:property value="#user.userName" /> 
									</a>
								</span>
							</li>
					</ul> 
					
				</li>
				</s:iterator>
			</ul>
			
			<div>	
			<s:iterator var="i" begin="1" end="%{totalPage}" step="1">
				<a href="<s:url action="getFriendsByPage">
					<s:param name="userName" value="%{userName }"></s:param>
					<s:param name="totalPage" value="%{totalPage }"></s:param>
					<s:param name="pageAction" value="%{pageAction }"></s:param>
					<s:param name="pageNow" value="#i"></s:param>
					</s:url>">
					<s:property value="#i"/>
				</a>
			</s:iterator>
		</div>
		</div>
   		
   	</div>
   </div>
   
   <!-- UI-dialog -->
   <div id="dialog" title='<s:text name="gossip_delete_confirm"/>'>
		<p><s:text name="friend.deldialog.content"/></p>
   </div>
  </body>
  <jsp:include page="footer.jsp"></jsp:include>
</html>
