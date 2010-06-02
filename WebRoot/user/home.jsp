<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>个人主页</title>
    <script type="text/javascript" src="../js/home.js"></script>
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
  		<span><s:property value="#session.user.realName"/></span> 最近状态 :
  		<label id="showLastStmt"></label> | <span><a href="">所有状态</a></span>
  	  	<br/>
  	  	<br/>
  	</div>
  	
  	<!-- 显示用户个人信息 -->
  	<div id="personalityDiv">
  		<s:if test="#session.currentUser.idUser == #session.user.idUser">
  			<img alt="Photo" src="${session.currentUser.photo}" /><br/> 
  			<span>姓名:<s:property value="#session.currentUser.realName"/></span><br>
  			<span>生日:<s:property value="#session.currentUser.birthday"/></span><br>
  			<span>爱好:<s:property value="#session.currentUser.hoby"/></span><br>
  	  		<a href="editPhoto.action">换头像</a> | 
  	  		<a href="">编辑我的资料</a>
  	  		<br/>
  		</s:if>
  		<s:else>
  			<img alt="Photo" src="${session.user.photo}" /><br/>
  			<span>姓名:<s:property value="#session.user.realName"/></span><br>
  			<span>生日:<s:property value="#session.user.birthday"/></span><br>
  			<span>爱好:<s:property value="#session.user.hoby"/></span><br> 
  	  		<br/>
  		</s:else>
  		<br/>
  	</div>
  	
  	<div id="blogDiv">
  	</div>
  	
  	
  	<div id="gossipDiv">
  		<label>留言板</label> | 
  		<span><a href='<s:url action="allGossip.action"><s:param name="userId" value="#session.user.idUser">
  					</s:param></s:url>'>所有留言</a></span><br>
  		<textarea rows="3" cols="80" id='textarea_gossip_<s:property value="#session.user.idUser"/>' 
  				title="给他/她留言吧"  name="gossip" class="gossip"></textarea><br/>
  	  	<input id='btn_gossip_<s:property value="#session.user.idUser"/>' 
  	  		type="button" value="留言" onclick="myGossipAjax.addGossip(this.id)" />
  	</div>
  	
  	<div id="gossipListDiv">
  		<ul id='ui_gossip_<s:property value="#session.user.idUser"/>'>
  			<s:iterator value="#session.gossipMsg" var="message">
  				<li>
  				<div id='li_gossip_<s:property value="#message.title"/>'>
  					<img alt="Photo" src='<s:property value="#message.owner.photo"/>' />
					<br />
  					<a href='<s:url action="home.action"><s:param name="userId" value="#message.owner.idUser">
  					</s:param></s:url>' target="_blank" id='href_<s:property value="#message.title"/>'>
  						<s:property value="#message.owner.userName"/>
  					</a>
  					<span>:<s:property value="#message.content"/> </span><br>
  					<span><s:property value="#message.time"/> |</span>
  					<label id='label_reply_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>'
  						onclick="myGossipReplyAjax.showAllReplies(this.id)"> 查看 | </label>
  					<label id='label_reply_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>'
  						onclick="myGossipReplyAjax.hiddenAllReplies(this.id)"> 收起 | </label>
  					<label id='label_reply_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>'
  						onclick="myGossipAjax.addReply(this.id)"> 回复 </label>
  					<s:if test="#session.currentUser.idUser == #session.user.idUser">
  						<label id='label_del_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>'
  						onclick="myGossipAjax.delGossip(this.id)"> | 删除 </label>
  					</s:if>
  					<s:elseif test="#session.currentUser.idUser == #message.owner.idUser">
  						<label id='label_del_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>'
  						onclick="myGossipAjax.delGossip(this.id)"> | 删除 </label>
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
  		  								onclick="myGossipReplyAjax.delReply(this.id)"> | 删除</label>
  	  							</s:if>
  	  							<s:elseif test="#session.currentUser.idUser == #reply.user.idUser">
	  	  							<label id='label_reply_del_<s:property value="#reply.idReply"/>_<s:property value="#message.title"/>'
  		  								onclick="myGossipReplyAjax.delReply(this.id)"> | 删除</label>
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
  					</s:param></s:url>'>所有留言</a></span><br>
  	</div>
  	
  	<div id="friendDiv">
  	</div>
  	
  	
  </div>
  </body>
  <jsp:include page="footer.jsp"></jsp:include>
</html>
