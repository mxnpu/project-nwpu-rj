<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
  <head>
    <title><s:text name="header.personal_homepage"/></title>
    <script type="text/javascript" src="../js/home.js"></script>
    <script type="text/javascript" src="../js/image.js"></script>
    <link rel="stylesheet" type="text/css" href="../style/home.css" />
  </head>
  <jsp:include page="header.jsp"></jsp:include>
  <body onload="myStmtAjax.getNewStmt();">
  <div id="hiddenDiv">
  	<input type="hidden" id="hidden" name="hidden" value='<s:property value="#session.user.idUser"/>'/>
  </div>
  <div id="wrap">
  	
  	<!-- 显示该用户当前的状态 -->
  	<div id="statementDiv">
  		<span><s:property value="#session.user.realName"/></span> <s:text name="home_state"/>
  		<label id="showLastStmt"></label> | <span><a href=""><s:text name="home_all_state"/></a></span>
  	  	<br/>
  	  	<br/>
  	</div>
  	
  	<!-- 显示用户个人信息 -->
  	<div id="personalityDiv">
  		<s:if test="#session.currentUser.idUser == #session.user.idUser">
  			<img alt="Photo" src="${session.currentUser.photo}" width="150" height="200" /><br/> 
  			<span><s:text name="home_name"/><s:property value="#session.currentUser.realName"/></span><br>
  			<span><s:text name="home_birth"/><s:property value="#session.currentUser.birthday"/></span><br>
  			<span><s:text name="home_love"/><s:property value="#session.currentUser.hoby"/></span><br>
  	  		<a href="editPhoto.action"><s:text name="home_change_photo"/></a> | 
  	  		<a href="topersonal_info.action"><s:text name="home_edit"/></a>
  	  		<br/>
  		</s:if>
  		<s:else>
  			<img alt="Photo" src="${session.user.photo}" 
  				onload="ImageObject.changImageSize(this, 150, 200)"/><br/>
  			<span><s:text name="home_name"/><s:property value="#session.user.realName"/></span><br>
  			<span><s:text name="home_birth"/><s:property value="#session.user.birthday"/></span><br>
  			<span><s:text name="home_love"/><s:property value="#session.user.hoby"/></span><br> 
  	  		<br/>
  		</s:else>
  		<br/>
  	</div>
  	
  	<div id="blogDiv">
  		<span><s:text name="home_bloglist"></s:text></span> 
  		<br>
  		<ul>
  		<s:iterator value="#session.blogMsg" var="msg">
  			<li>
  				<hr/>
  				<div>
  					<a href='<s:url action="showBlog.action">
  								<s:param name="id" value="#msg.msgId"></s:param>
  								<s:param name="state" value="'show'"></s:param>
  							</s:url>'>
  						<s:property value="#msg.title"/>
  					</a>
  					<br>
  					<s:property value="#msg.content"/><br>
  					<a href='<s:url action="showBlog.action">
  								<s:param name="id" value="#msg.msgId"></s:param>
  								<s:param name="state" value="'show'"></s:param>
  							</s:url>'>
  						<s:text name="home.blog.detail"></s:text>
  					</a>
  				</div>
  			</li>
  		</s:iterator>
  		</ul>
  		<span>
  			<a href='<s:url action="showAllBlogs.action">
  						<s:param name="userId" value="#session.user.idUser"></s:param>
  					</s:url>'>
  				<s:text name="home_allblogs"></s:text>
  			</a>
  		</span>
  		<br>
  		<br>
  	</div>
  	
  	
  	<div id="gossipDiv">
  		<label><s:text name="gossip_leave_message"/></label> | 
  		<span><a href='<s:url action="allGossip.action"><s:param name="userId" value="#session.user.idUser">
  					</s:param></s:url>'><s:text name="home_all_leave_message"/></a></span><br>
  		<textarea rows="3" cols="80" id='textarea_gossip_<s:property value="#session.user.idUser"/>' 
  				title='<s:text name="gossip_give_message"/>'  name="gossip" class="gossip" onkeypress="InputCheck.checkMaxInput(this.id)"></textarea><br/>
  	  	<input id='btn_gossip_<s:property value="#session.user.idUser"/>' 
  	  		type="button" value='<s:text name="gossip_message"/>' onclick="myGossipAjax.addGossip(this.id)" />
  	  	<label id="gossip_remain_<s:property value="#session.user.idUser"/>">200</label>/200
  	</div>
  	
  	<div id="gossipListDiv">
  		<ul id='ui_gossip_<s:property value="#session.user.idUser"/>'>
  			<s:iterator value="#session.gossipMsg" var="message">
  				<li>
  				<div id='li_gossip_<s:property value="#message.title"/>'>
  					<img alt="Photo" src='<s:property value="#message.owner.photo"/>' 
  							onload="ImageObject.changImageSize(this, 50, 65)"/>
					<br />
  					<a href='<s:url action="home.action"><s:param name="userId" value="#message.owner.idUser">
  					</s:param></s:url>' target="_blank" id='href_<s:property value="#message.title"/>'>
  						<s:property value="#message.owner.userName"/>
  					</a>
  					<span>:<s:property value="#message.content"/> </span><br>
  					<span><s:property value="#message.time"/> |</span>
  					<label id='label_reply_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>'
  						onclick="myGossipReplyAjax.showAllReplies(this.id)"> <s:text name="home_read"/></label>
  					<label id='label_reply_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>'
  						onclick="myGossipReplyAjax.hiddenAllReplies(this.id)"> <s:text name="home_stop"/></label>
  					<label id='label_reply_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>'
  						onclick="myGossipAjax.addReply(this.id)"> <s:text name="title.return"/> </label>
  					<s:if test="#session.currentUser.idUser == #session.user.idUser">
  						<label id='label_del_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>'
  						onclick="myGossipAjax.delGossip(this.id)"> <s:text name="gossip_delete"/> </label>
  					</s:if>
  					<s:elseif test="#session.currentUser.idUser == #message.owner.idUser">
  						<label id='label_del_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>'
  						onclick="myGossipAjax.delGossip(this.id)"> <s:text name="gossip_delete"/></label>
  					</s:elseif>
  					
  					<div id='gossip_reply_list' class="gossipReply">
  						<ul id='gossip_reply_ul_<s:property value="#message.title"/>' class="gossip_reply_ul">
  							<s:iterator value="#message.replies" var="reply">
  							<li>
  							<div id='li_gossip_reply_<s:property value="#reply.idReply"/>'>
  	  							<a href='<s:url action="home.action" namespace="/user">
  	  								<s:param name="userId" value="#reply.user.idUser"></s:param></s:url>' 
  	  								target="_blank">
  	  								<s:property value="#reply.user.userName"/>
  	  							</a>
  	  							<span>:<s:property value="#reply.content"/></span><br>
  	  							<span><s:property value="#reply.time"/></span> 
  	  							<s:if test="#session.currentUser.idUser == #session.user.idUser">
	  	  							<label id='label_reply_del_<s:property value="#reply.idReply"/>_<s:property value="#message.title"/>'
  		  								onclick="myGossipReplyAjax.delReply(this.id)"><s:text name="gossip_delete"/></label>
  	  							</s:if>
  	  							<s:elseif test="#session.currentUser.idUser == #reply.user.idUser">
	  	  							<label id='label_reply_del_<s:property value="#reply.idReply"/>_<s:property value="#message.title"/>'
  		  								onclick="myGossipReplyAjax.delReply(this.id)"><s:text name="gossip_delete"/></label>
  	  							</s:elseif>
  	  						</div>
  							</li>
  							</s:iterator>
  						</ul>
  					</div>
  				</div>
  				<hr/>
  				</li>			
  			</s:iterator>
  		</ul>
  		<span><a href='<s:url action="allGossip.action"><s:param name="userId" value="#session.user.idUser">
  					</s:param></s:url>'><s:text name="home_all_leave_message"/></a></span><br>
  	</div>
  	
  	<div id="friendDiv">
  	</div>
  	
  	
  </div>
  </body>
  <jsp:include page="footer.jsp"></jsp:include>
</html>