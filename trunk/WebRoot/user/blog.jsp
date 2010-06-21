<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html> 
	<head>
		<title><s:text name="title.read_blog"/></title>
		<script type="text/javascript" src="../js/blog.js"></script>
		<link type="text/css" rel="stylesheet" href="../style/showBlogPanelStyle.css" />	
  </head>
  <jsp:include page="header.jsp"></jsp:include>
  <body onload="bodyObject.ready()"> 
  	<div id="mainPanel">
  		<div id="global_toolbox">
            <ul id="photolayer">
			  <li>
                <img id="userPhoto" src="${session.currentUser.photo}"
							width="200" height="250" />
              </li>
             
            </ul>
        </div>
        
        <div id="content_bg">
        	<div class="content_tab_header">
            	<ul class="content_tab">
              		<li class="content_tab_active">
              			<span><a href="#" class="title"><s:property value="blog.title" /></a></span>
					</li>
					<li class="content_tab_active" id="editor">
            		<a href='showBlog?id=<s:property value="blog.id" />&&state=edit'>
            			<font color="green" size="3">Edit</font>
            		</a>
            		</li>
            	</ul>
          	</div>
          	<div id="content">
          		<ul id="content_list">
	              <li class="content_item">
    	            <span class="blog_text">
     					${blog.content }
    	            </span>
    	          </li>
    	          <li class="content_item">
    	          	<div id="reply_area">
   						<textarea id="replyContent" name="replyContent" rows="2" cols="93"
   									onkeypress="InputCheck.checkMaxInput();">
   						</textarea>
   						<br>
   						<button id="<s:property value="blog.id" />" 
   							onclick="replyBlogAjax.reply(this.id)">
   							<s:text name="title.return"/>
   						</button>
   						<label id="gossip_remain">200</label>/200
   						<br>
   					</div>
    	          </li>
    	        </ul>  
          	</div>
          	
          	<div class="content_tab_header">
        	    <ul class="content_tab">
            	  <li class="content_tab_active"><span><s:text name="title.all_return"/></span></li>
          		</ul>
         	 </div>
         	 
         	 <div id="content">
	            <ul id="content_list_reply">
	            	<s:iterator value="replyList" var="reply">
	            	<li class="content_item">
              		  <ul class="replayMessage_editor">
                		  <li><img src="../style/image/icon_message.png"/></li>
                	  </ul>
               		  <div class="message_item">
                   		<ul id="ul_blog_replies">                  		
                    		<li class="message_detail">
                    		  <img alt="Photo" src='<s:property value="#reply.user.photo"/>' 
  									width="50" height="65"/>
                    		  <p>
                    		  <a href='<s:url action="home.action" namespace="/user">
  	  										<s:param name="userId" value="#reply.user.idUser"></s:param></s:url>' >
  	  									<s:property value="#reply.user.userName"/>
  	  						  </a>
  	  						  </p>
                     		 <span class="message_date"><s:property value="#reply.time"/></span>
                     		 <p>:<s:property value="#reply.content"/></p>
                    		</li>
                  		</ul>
                	  </div>
              		</li>
              		</s:iterator>
  				</ul>
  			</div>
        </div>
  		
    </div>
  </body>
  <jsp:include page="footer.jsp"></jsp:include>
</html>

