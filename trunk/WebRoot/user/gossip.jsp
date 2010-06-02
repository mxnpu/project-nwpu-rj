<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<jsp:include page="header.jsp"></jsp:include>
	<head>
		<title>留言板</title>
		<script type="text/javascript" src="../js/jquery-ui-1.7.2.custom.min.js"></script>
		<script type="text/javascript" src="../js/gossip.js"></script>
		<link type="text/css" href="../style/jquery-ui-1.7.2.custom.css" rel="stylesheet" />	
	</head>
	<body>
	<div id="wrap">
		<div id="personalityDiv">
			<img alt="Photo" src="${session.currentUser.photo}" />
			<br />
			<span>姓名:<s:property value="#session.currentUser.realName" />
			</span>
			<br>
			<br>
		</div>
		
		<div id="gossipDiv">
  			<label>留言板</label><br/>
  			<form action="addGossipCommon.action" method="POST" id="gossipForm">
  				<input type="hidden" id="userIdHidden" name="userIdHidden"
  					 value='<s:property value="#session.user.idUser"/>'>
  				<input type="hidden" id="gossipIdHidden" name="gossipIdHidden" value=''>
  				<textarea rows="3" cols="80" id='textarea_gossip_<s:property value="#session.user.idUser"/>' 
  					title="给他/她留言吧"  name="gossip" class="gossip"></textarea><br/>
  	  			<input id='btn_gossip_<s:property value="#session.user.idUser"/>' 
  	  				type="button" value="留言" onclick="myGossip.submit()" />
  			</form>
  		</div>
		
		<div id="gossipList">
			<ul id='ui_gossip_<s:property value="#session.user.idUser"/>'>
			<s:iterator value="messages" var="message">
				<span>回复内容</span>
				<li class="li_gossip">
  				<div id='li_gossip_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>' 
  						class="li_gossip_div">
  				
  					<img alt="Photo" src='<s:property value="#message.owner.photo"/>' />
					<br />
  					<a href='<s:url action="home.action"><s:param name="userId" value="#message.owner.idUser">
  					</s:param></s:url>' target="_blank" id='href_<s:property value="#message.title"/>'>
  						<s:property value="#message.owner.userName"/>
  					</a>
  					<span>:<s:property value="#message.content"/> </span><br>
  					<span><s:property value="#message.time"/></span>
  					<label id='label_reply_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>'
  						onclick="myGossip.addReply(this.id)">|回复</label>
  					<s:if test="#session.currentUser.idUser == #session.user.idUser">
  						<label id='label_del_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>'
  							class="del_label" >|删除</label>
  					</s:if>
  					<s:elseif test="#session.currentUser.idUser == #message.owner.idUser">
  						<label id='label_del_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>'
  							class="del_label" ">|删除 </label>
  					</s:elseif>
  					
  					<div id='gossip_reply_list' class="gossipReply">
  						<ul id='gossip_reply_ul_<s:property value="#message.title"/>' class="gossip_reply_ul">
  							<s:iterator value="#message.replies" var="reply">
  							<li>
  							<div id='li_gossip_reply_<s:property value="#reply.idReply"/>_<s:property value="#message.title"/>_<s:property value="#session.user.idUser"/>' 
  								class="li_gossip_del_div">
  	  							<a href='<s:url action="home.action" namespace="/user">
  	  								<s:param name="userId" value="#reply.user.idUser"></s:param></s:url>' 
  	  								target="_blank">
  	  								<s:property value="#reply.user.userName"/>
  	  							</a>
  	  							<span>:<s:property value="#reply.content"/></span><br>
  	  							<span><s:property value="#reply.time"/></span> 
  	  							<s:if test="#session.currentUser.idUser == #session.user.idUser">
	  	  							<label id='label_reply_del_<s:property value="#reply.idReply"/>_<s:property value="#message.title"/>'
  		  								class="label_reply_del">|删除</label>
  	  							</s:if>
  	  							<s:elseif test="#session.currentUser.idUser == #reply.user.idUser">
	  	  							<label id='label_reply_del_<s:property value="#reply.idReply"/>_<s:property value="#message.title"/>'
  		  								class="label_reply_del">|删除</label>
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
			<div>
				<s:iterator var="i" begin="1" end="%{totalPage}" step="1">
				<a href='<s:url action="getGossipByPage">
				<s:param name="totalPage" value="%{totalPage }"></s:param>
				<s:param name="pageNow" value="#i"></s:param>
				</s:url>'>
					<s:property value="#i"/>
				</a>
				<s:set name="endCount" value="%{totalPage}"></s:set>
				<s:if test="#i != #endCount">-</s:if>
				</s:iterator>
			</div>
			<!-- UI-dialog -->
			<div id="dialog" title="删除确认">
				<p>你确定删除么?</p>
			</div>
		</div>
	</div>
	</body>
	<jsp:include page="footer.jsp"></jsp:include>
</html>
