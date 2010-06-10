<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<jsp:include page="header.jsp"></jsp:include>
<html>
  <head>
    <title><s:text name="index.homepage"/></title> 
    <script type="text/javascript" src="../js/myAjax.js"></script>
    <script type="text/javascript" src="../js/statementAjax.js"></script>
    <script type="text/javascript" src="../js/index.js"></script>
    <link rel="stylesheet" type="text/css" href="../style/index.css" />
  </head>
  
  <body  id="indexBody" onload="myStmtAjax.getNewStmt()"> 
  <div id="wrap">
  	  <div id="photo">
  	  	<img alt="Photo" src="${session.currentUser.photo}" /><br/> 
  	  	<a href="editPhoto.action"><s:text name="index.edit_photo"/></a>
  	  	<br/>
  	  </div>
  	  <div id="statementDiv">
  	  	<s:text name="home_state"/><label id="showLastStmt"></label><br>
  	  	<textarea rows="2" cols="80" name="statement" id="statement" title='<s:text name="index.update_situation"/>' 
  	  			onkeydown="myStmtAjax.checkMaxInput()">
  	  	</textarea><br/>
  	  	<input type="button" value='<s:text name="index.publish"/>' onclick="myStmtAjax.updateStmt()" />
  	  	<label id="remain">150</label>/150
  	  	<br>
  	  	<br>
  	  </div>
  	  <div id="latesMsgDiv">
  	  	<s:debug></s:debug>
  	  	<label><s:text name="index.latestMsg"></s:text></label>
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
  	  							onclick="replyObject.show(this.id);"><s:text name="index.return"/></label> |
  	  					<label id="label_<s:property value="#message.item.idItem"/>" 
  	  							onclick="replyObject.look(this.id);"><s:text name="index.scan"/></label> |
  	  					<label id="label_<s:property value="#message.item.idItem"/>" 
  	  							onclick="replyObject.hidden(this.id);"><s:text name="index.return_hide"/></label>
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
  	  									onclick="replyDelAjax.deleteReply(this.id)"><s:text name="index.delete"/></label>
  	  								</div>
  	  								</li>
  	  							</s:iterator>
  	  						</ul>
  	  					</div>
  	  					<div class="replySelf" id='replySelf_<s:property value="#message.item.idItem"/>'>
  	  						<textarea id='reply_<s:property value="#message.item.idItem"/>'
  	  							class="reply" rows="2" cols="80" onkeypress="myStmtAjax.replyCheckMaxInput(this.id)">
  	  						</textarea><br>
  	  						<input id='btn_reply_<s:property value="#message.item.idItem"/>' 
  	  							type="button" value='<s:text name="index.return"/>'onclick="replyAjax.replyBtn(this.id)"/>
  	  						<label id='replyRemain_reply_<s:property value="#message.item.idItem"/>'>150</label>/150
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
  	  				 target="_blank"><s:property value="#message.owner.userName"/></a><s:text name="index.blog_publish"/>
  	  				<a href='showBlog.action?id=<s:property value="#message.msgId"/>&&state=show'>
  	  					<s:property value="#message.title"/>
  	  				</a>
  	  			</h3>
  	  			<div class="content">
	  	  			<s:property value="#message.content"/>
	  	  		</div>
  	  			<div class="details">
  	  				<div class="legend">
  	  					<s:property value="#message.time"/>  | 
  	  					<label id="label_<s:property value="#message.item.idItem"/>" 
  	  							onclick="replyObject.show(this.id);"><s:text name="index.return"/></label> |
  	  					<label id="label_<s:property value="#message.item.idItem"/>" 
  	  							onclick="replyObject.look(this.id);"><s:text name="index.scan"/></label> |
  	  					<label id="label_<s:property value="#message.item.idItem"/>" 
  	  							onclick="replyObject.hidden(this.id);"><s:text name="index.return_hide"/></label>
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
  	  									onclick="replyDelAjax.deleteReply(this.id)"><s:text name="index.delete"/></label>
  	  								</div>
  	  								</li>
  	  							</s:iterator>
  	  						</ul>
  	  					</div>
  	  					<div class="replySelf" id='replySelf_<s:property value="#message.item.idItem"/>'>
  	  						<textarea id='reply_<s:property value="#message.item.idItem"/>'
  	  							class="reply" rows="1" cols="80" onkeypress="myStmtAjax.replyCheckMaxInput(this.id)">
  	  						</textarea><br>
  	  						<input id='btn_reply_<s:property value="#message.item.idItem"/>' 
  	  							type="button" value='<s:text name="index.return"/>'onclick="replyAjax.replyBtn(this.id)"/>
  	  						<label id='replyRemain_reply_<s:property value="#message.item.idItem"/>'>150</label>/150
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