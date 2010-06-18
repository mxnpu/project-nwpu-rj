<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="header.jsp"></jsp:include>
<html>
  <head>
    <title><s:text name="index.homepage"/></title> 
    <script type="text/javascript" src="../js/jquery-ui-1.7.2.custom.min.js"></script>
    <script type="text/javascript" src="../js/myAjax.js"></script>
    <script type="text/javascript" src="../js/statementAjax.js"></script>
    <script type="text/javascript" src="../js/index.js"></script>
    <script type="text/javascript" src="../js/image.js"></script>
    <link rel="stylesheet" type="text/css" href="../style/index.css" />
    <link type="text/css" href="../style/jquery-ui-1.7.2.custom.css" rel="stylesheet" />
  </head>
  
  <body  id="indexBody" onload="myStmtAjax.getNewStmt()"> 
  <div id="wrap">
  	  <div id="photo">
  	  	<img alt="Photo" src="${session.currentUser.photo}" width="125" height="150" /><br/> 
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
  	  		<hr>	  		
  	  		<s:if test="#message.type == 'statement'">
  	  			<div class="figure">
  	  				<img alt="Photo" src="<s:property value="#message.owner.photo"/>" 
  	  						onload="ImageObject.changImageSize(this, 50, 75)"/>
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
  	  				<img alt="Photo" src="<s:property value="#message.owner.photo"/>" 
  	  					onload="ImageObject.changImageSize(this, 50, 75)"/>
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
  	  
  	  <div>
  	  	<s:text name="index.mail"></s:text><br>
  	  	<ul id='ul_mail'>
  	  		<s:iterator value="#session.mails" var="mail">
  	  		<li id='li_<s:property value="#mail.id" />'>
  	  			<s:if test="#mail.title == 'Friends Request'">
  	  				<a href='home.action?userId=<s:property value="#mail.fromUser.idUser"/>'>
  	  					<s:property value="#mail.fromUser.userName"/>
  	  				</a>
  	  				<span> <s:text name="index.addrequest"></s:text></span>
  	  				<label id='add_<s:property value="#mail.fromUser.idUser"/>_<s:property value="#mail.id" />' onclick="mailObject.mail(this.id)">
   					<s:text name="friend_allow"/></label>  
   					<label id='refuse_<s:property value="#mail.id" />'	onclick="mailObject.mail(this.id)">
   					<s:text name="friend_refuse"/></label>
  	  			</s:if>
  	  			<s:else>
  	  				<span><s:property value="#mail.title"/></span>
  	  				
  	  			</s:else>
  	  		</li>
  	  		</s:iterator>
  	  	</ul>
  	  </div>
  	  
  	  <div>
  	  	<s:text name="index.public"></s:text>
  	  	<ul>
  	  		<s:iterator value="#session.placards" var="placard" status="i">
  	  		<li>
  	  			<div id='placard_<s:property value="#placard.idPlacard"/>' class="div_placard">
  	  				<label class="placard"  onclick="placardObject.show)" onmouseover="JavaScript:this.style.cursor='pointer'">
  	  					<s:property value="#placard.title"/>
  	  				</label>
  	  			</div>
  	  			<!-- UI-dialog -->
				<div id='dialog<s:property value="#i.count"/>' title='<s:property value="#placard.title"/>'>
					<p><s:property value="#placard.content"/></p><br>
					<s:property value="#placard.time"/>
				</div>	
  	  		</li>
  	  		</s:iterator>
  	  	</ul>
  	  </div>
  </div>
  </body>
</html>
<jsp:include page="footer.jsp"></jsp:include>