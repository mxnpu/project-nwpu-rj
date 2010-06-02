<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<jsp:include page="header.jsp"></jsp:include>
<html>
  <head>
    <title>首页</title> 
    <script type="text/javascript" src="../js/myAjax.js"></script>
    <script type="text/javascript" src="../js/statementAjax.js"></script>
    <script type="text/javascript" src="../js/index.js"></script>
    <link rel="stylesheet" type="text/css" href="../style/index.css" />
  </head>
  
  <body  id="indexBody" onload="myStmtAjax.getNewStmt()"> 
  <div id="wrap">
  	  <div id="photo">
  	  	<img alt="Photo" src="${session.currentUser.photo}" /><br/> 
  	  	<a href="editPhoto.action">编辑头像</a>
  	  	<br/>
  	  </div>
  	  <div id="statementDiv">
  	  	最新状态： <label id="showLastStmt"></label><br>
  	  	<textarea rows="1" cols="80" name="statement" id="statement" title="更新你的新状态吧"></textarea><br/>
  	  	<input type="button" value="发布" onclick="myStmtAjax.updateStmt()" />
  	  	<br>
  	  	<br>
  	  </div>
  	  <div id="latesMsgDiv">
  	  	<s:debug></s:debug>
  	  	<label>好友新鲜事</label>
  	  	<br>
  	  	<ul>
  	  	<s:iterator value="#session.msg" var="message">  
  	  		<li>	  		
  	  		<s:if test="#message.type == 'statement'">
  	  			<div class="figure">
  	  				<img alt="Photo" src="<s:property value="#message.owner.photo"/>" />
  	  			</div>
  	  			<h3>
  	  				<a href='<s:url action="home.action" namespace="/user">
  	  						<s:param name="userId" value="#message.owner.idUser"></s:param></s:url>'
  	  				 target="_blank"><s:property value="#message.owner.userName"/></a>:
  		  			<s:property value="#message.content"/><br/>
  	  			</h3>
  	  			<div class="details">
  	  				<div class="legend">
  	  					<s:property value="#message.time"/> |
  	  					<label id="label_<s:property value="#message.item.idItem"/>" 
  	  							onclick="replyObject.show(this.id);">回复</label> |
  	  					<label id="label_<s:property value="#message.item.idItem"/>" 
  	  							onclick="replyObject.look(this.id);">查看</label> |
  	  					<label id="label_<s:property value="#message.item.idItem"/>" 
  	  							onclick="replyObject.hidden(this.id);">收起回复</label>
  	  				</div>		
  	  				<div class="replyDiv" id='replyDiv_<s:property value="#message.item.idItem"/>'>
  	  					<div class="replyList" id='replyList_<s:property value="#message.item.idItem"/>'>
  	  						<ul id='reply_ul_<s:property value="#message.item.idItem"/>'>
  	  							<s:iterator value="#message.replies" var="reply">
  	  								<li>
  	  								<div id='li_reply_<s:property value="#reply.idReply"/>'>
  	  									<a href='<s:url action="home.action" namespace="/user">
  	  										<s:param name="userId" value="#reply.user.idUser"></s:param>
  	  									</s:url>' target="_blank">
  	  									<s:property value="#reply.user.userName"/>
  	  									</a>
  	  									<span>:<s:property value="#reply.content"/></span><br>
  	  									<span><s:property value="#reply.time"/></span> | 
  	  									<label id='label_<s:property value="#reply.idReply"/>_<s:property value="#message.item.idItem"/>'
  	  									onclick="replyDelAjax.deleteReply(this.id)">删除</label>
  	  								</div>
  	  								</li>
  	  							</s:iterator>
  	  						</ul>
  	  					</div>
  	  					<div class="replySelf" id='replySelf_<s:property value="#message.item.idItem"/>'>
  	  						<textarea id='reply_<s:property value="#message.item.idItem"/>'
  	  							class="reply" rows="1" cols="80" >
  	  						</textarea>
  	  						<br>
  	  						<input id='btn_reply_<s:property value="#message.item.idItem"/>' 
  	  							type="button" value="回复" onclick="replyAjax.replyBtn(this.id)"/>
  	  					</div>
  	  				</div>	
  	  			</div>
  	  		</s:if>
  	  		<s:if test="#message.type == 'blog'">
  	  			<div class="figure">
  	  				<img alt="Photo" src="<s:property value="#message.owner.photo"/>" />
  	  			</div>
  	  			<h3>
  	  				<a href='<s:url action="home.action" namespace="/user">
  	  						<s:param name="userId" value="#message.owner.idUser"></s:param></s:url>'
  	  				 target="_blank"><s:property value="#message.owner.userName"/></a>:发表日志
  	  				<a href=""><s:property value="#message.title"/></a>
  	  			</h3>
  	  			<div class="content">
	  	  			<s:property value="#message.content"/>
	  	  		</div>
  	  			<div class="details">
  	  				<div class="legend">
  	  					<s:property value="#message.time"/>  | 
  	  					<label id="label_<s:property value="#message.item.idItem"/>" 
  	  							onclick="replyObject.show(this.id);">回复</label> |
  	  					<label id="label_<s:property value="#message.item.idItem"/>" 
  	  							onclick="replyObject.look(this.id);">查看</label> |
  	  					<label id="label_<s:property value="#message.item.idItem"/>" 
  	  							onclick="replyObject.hidden(this.id);">收起回复</label>
  	  				</div>
  	  				<div class="replyDiv" id='replyDiv_<s:property value="#message.item.idItem"/>'>
  	  					<div class="replyList" id='replyList_<s:property value="#message.item.idItem"/>'>
  	  						<ul id='reply_ul_<s:property value="#message.item.idItem"/>'>
  	  							<s:iterator value="#message.replies" var="reply">
  	  								<li>
  	  								<div id='li_reply_<s:property value="#reply.idReply"/>'>
  	  									<a href='<s:url action="home.action" namespace="/user">
  	  										<s:param name="userId" value="#reply.user.idUser"></s:param>
  	  									</s:url>' target="_blank"><s:property value="#reply.user.userName"/></a>
  	  									<span>:<s:property value="#reply.content"/></span><br>
  	  									<span><s:property value="#reply.time"/></span> | 
  	  									<label id='label_<s:property value="#reply.idReply"/>_<s:property value="#message.item.idItem"/>'
  	  									onclick="replyDelAjax.deleteReply(this.id)">删除</label>
  	  								</div>
  	  								</li>
  	  							</s:iterator>
  	  						</ul>
  	  					</div>
  	  					<div class="replySelf" id='replySelf_<s:property value="#message.item.idItem"/>'>
  	  						<textarea id='reply_<s:property value="#message.item.idItem"/>'
  	  							class="reply" rows="1" cols="80" >
  	  						</textarea>
  	  						<br>
  	  						<input id='btn_reply_<s:property value="#message.item.idItem"/>' 
  	  							type="button" value="回复" onclick="replyAjax.replyBtn(this.id)"/>
  	  					</div>
  	  				</div>	
  	  			</div>
  	  		</s:if>
  	  		</li>
  	  	</s:iterator>
  	  	</ul>
  	  	<br>		
  	  </div>
  </div>
  </body>
</html>
<jsp:include page="footer.jsp"></jsp:include>