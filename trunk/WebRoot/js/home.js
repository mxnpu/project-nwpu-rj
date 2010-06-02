/**
 * AJAX类
 * 
 * @author 许润华
 * @time 2010.05.27
 */
/**
 * 处理Gossip AJAX请求的类
 * 
 * @type class
 */
var xmlreq = null;

var myStmtAjax = {

	url : "", // 请求地址
	method : "", // 请求方式
	parameter : "", // 请求参数
	asynchronous : true, // 是否异步
	contentType : "application/x-www-form-urlencoded",

	/**
	 * 初始化Ajax类
	 * 
	 * @param {}
	 *            url 请求地址
	 * @param {}
	 *            method 请求方式
	 * @param {}
	 *            parameter 请求参数
	 * @param {}
	 *            ayychronous 是否异步
	 */
	init : function(url, method, parameter, asynchronous) {
		this.url = url;
		this.method = method;
		this.parameter = parameter;
		this.asynchronous = asynchronous;
	},

	/**
	 * 创建XHR对象
	 */
	createXMLHttpRequest : function() {

		if (window.XMLHttpRequest) {
			// DOM 2
			xmlreq = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			try {
				// IE
				xmlreq = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					xmlreq = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {

				}
			}

		}
	},

	/**
	 * 响应处理的函数
	 */
	responseNewStmt : function() {
		if (xmlreq.readyState == 4) {
			if (xmlreq.status == 200) {
				var responseStr = xmlreq.responseText;
				document.getElementById('showLastStmt').innerHTML = responseStr;
			}
		}

	},

	/**
	 * 开始Ajax方式发送请求
	 * 
	 * @param {}
	 *            url 请求地址
	 * @param {}
	 *            method 请求方式
	 * @param {}
	 *            parameter 请求参数
	 * @param {}
	 *            ayychronous 是否异步
	 */
	getNewStmt : function() {

		this.method = "GET";
		this.url = "getNewStmt.action";

		// Create the XMLHttpRequest.
		this.createXMLHttpRequest();
		// open a connection.
		xmlreq.open(this.method, this.url, this.asynchronous);
		// set the request header.
		xmlreq.setRequestHeader("Content-Type", this.contentType);
		// set the response function.
		xmlreq.onreadystatechange = this.responseNewStmt;
		// send the request.
		if (this.parameter == "") {
			xmlreq.send(null);
		} else {
			xmlreq.send(this.parameter);
		}
	}
}

var xmlrequest = null;
var replyGossip;
var myGossipAjax = {

	url : "", // 请求地址
	method : "", // 请求方式
	parameter : "", // 请求参数
	asynchronous : true, // 是否异步
	contentType : "application/x-www-form-urlencoded",

	/**
	 * 创建XHR对象
	 */
	createXMLHttpRequest : function() {

		if (window.XMLHttpRequest) {
			// DOM 2
			xmlrequest = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			try {
				// IE
				xmlrequest = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					xmlrequest = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {

				}
			}

		}
	},

	/**
	 * 开始Ajax方式发送请求
	 * 
	 * @param {}
	 *            url 请求地址
	 * @param {}
	 *            method 请求方式
	 * @param {}
	 *            parameter 请求参数
	 * @param {}
	 *            ayychronous 是否异步
	 */
	addGossip : function(id) {

		// Get the user id
		var args = id.split("_");
		var userId = args[2];

		var textareaId = "textarea_gossip_" + userId;
		var oTextarea = document.getElementById(textareaId);
		var content = oTextarea.value;
		// after get the value, clear the textarea.
		oTextarea.value = "";
		var btnId = "btn_gossip_" + userId;
		var oBtn = document.getElementById(btnId);
		oBtn.value = "留言";

		this.method = "POST";
		this.url = "addGossip.action";
		this.parameter = "userId=" + userId + "&&content=" + content
				+ "&&gossipId=" + replyGossip;

		// Create the XMLHttpRequest.
		this.createXMLHttpRequest();
		// open a connection.
		xmlrequest.open(this.method, this.url, this.asynchronous);
		// set the request header.
		xmlrequest.setRequestHeader("Content-Type", this.contentType);
		// set the response function.
		xmlrequest.onreadystatechange = this.response;
		// send the request.
		if (this.parameter == "") {
			xmlrequest.send(null);
		} else {
			xmlrequest.send(this.parameter);
		}
	},

	response : function() {
		if (xmlrequest.readyState == 4) {
			if (xmlrequest.status == 200) {
				var responseStr = xmlrequest.responseText.split("&*");
				var head = responseStr[0]; // 获得头部，辨别这是留言的结果，还是回复的结果
				var response = responseStr[1];

				// if this is the gossip
				if (head == "gossip") {
					var oHidden = document.getElementById("hidden");
					var userId = oHidden.value;

					// Get the show area of the reply
					var oUlId = "ui_gossip_" + userId;
					var oGossipUl = document.getElementById(oUlId);
					while (oGossipUl.firstChild) {
						var oldNode = oGossipUl
								.removeChild(oGossipUl.firstChild);
						oldNode = null;
					}

					var array = response.split("#!");
					var count = array.length;
					for (var i = 0; i < count; i++) {
						var gossipInfo = array[i].split("~!");

						var userName = gossipInfo[0];
						var gossipOwnerId = gossipInfo[1];
						var gossipId = gossipInfo[2];
						var content = gossipInfo[3];
						var recordTime = gossipInfo[4];
						var currentId = gossipInfo[5];
						var ownerPhoto = gossipInfo[6];

						var oLI = document.createElement("li");
						var oGossipDiv = document.createElement("div");
						oGossipDiv.setAttribute("id", "li_gossip_" + gossipId);
						
						var oImg = document.createElement("img");
						oImg.setAttribute("alt","Photo");
						oImg.setAttribute("src",ownerPhoto);
						oGossipDiv.appendChild(oImg);
						
						var oBr1 = document.createElement("br");
						oGossipDiv.appendChild(oBr1);
						
						var oA = document.createElement("a");
						oA.setAttribute("id", "href_" + gossipId);
						oA.setAttribute("href", "home.action?userId=" + gossipOwnerId);
						oA.setAttribute("target", "_blank");
						oA.innerHTML = userName;
						oGossipDiv.appendChild(oA);
						
						var oSpan1 = document.createElement("span");
						oSpan1.innerHTML = ":" + content;
						oGossipDiv.appendChild(oSpan1);
						var oBr = document.createElement("br");
						oGossipDiv.appendChild(oBr);
						var oSpan2 = document.createElement("span");
						oSpan2.innerHTML = recordTime + " | ";
						oGossipDiv.appendChild(oSpan2);

						var oLabelShow = document.createElement("label");
						oLabelShow.setAttribute("id", "label_reply_" + gossipId + "_"
										+ userId);
						oLabelShow.innerHTML = "查看 |";
						oLabelShow.setAttribute("onclick",
								"myGossipReplyAjax.showAllReplies(this.id)");
						oGossipDiv.appendChild(oLabelShow);
						
						var oLabelHidden = document.createElement("label");
						oLabelHidden.setAttribute("id", "label_reply_" + gossipId + "_"
										+ userId);
						oLabelHidden.innerHTML = "收起 |";
						oLabelHidden.setAttribute("onclick",
								"myGossipReplyAjax.hiddenAllReplies(this.id)");
						oGossipDiv.appendChild(oLabelHidden);

						var oLabelReply = document.createElement("label");
						oLabelReply.setAttribute("id", "label_reply_" + gossipId
										+ "_" + userId);
						oLabelReply.innerHTML = "回复 ";
						oLabelReply.setAttribute("onclick", "myGossipAjax.addReply(this.id)");
						oGossipDiv.appendChild(oLabelReply);

						// if the message owener is the current user
						if (userId == currentId) {
							var oLabelDel = document.createElement("label");
							oLabelDel.setAttribute("id", "label_del_" + gossipId
											+ "_" + userId);
							oLabelDel.innerHTML = " | 删除";
							oLabelDel.setAttribute("onclick", "myGossipAjax.delGossip(this.id)");
							oGossipDiv.appendChild(oLabelDel);
						}

						var oReplyDiv = document.createElement("div");
						oReplyDiv
								.setAttribute("id", "gossip_reply_" + gossipId);
						var oUl = document.createElement("ul");
						oUl.setAttribute("id", "gossip_reply_ul_" + gossipId);
						oReplyDiv.appendChild(oUl);
						oGossipDiv.appendChild(oReplyDiv);

						oLI.appendChild(oGossipDiv);
						var oHr = document.createElement("hr");
						oLI.appendChild(oHr);
						oGossipUl.appendChild(oLI);
					}
				} else { // the gossip's reply
					// Get the show area of the reply
					gossipId = head.split("_")[1]
					var oUlId = "gossip_reply_ul_" + gossipId;
					var oReplyUl = document.getElementById(oUlId);
					while (oReplyUl.firstChild) {
						var oldNode = oReplyUl.removeChild(oReplyUl.firstChild);
						oldNode = null;
					}

					var array = response.split("#!");
					var count = array.length;
					for (var i = 0; i < count; i++) {
						var replies = array[i].split("~!");
						var user = replies[0];
						var replyId = replies[1];
						var content = replies[2];
						var recordTime = replies[3];
						var userId = replies[4];
						var currentUserId = replies[5];

						var oLI = document.createElement("li");
						var oReplyDiv = document.createElement("div");
						oReplyDiv.setAttribute("id", "li_gossip_reply_"
										+ replyId);

						var oA = document.createElement("a");
						oA.setAttribute("href", "home.action?userId=" + userId);
						oA.setAttribute("target", "_blank");
						oA.innerHTML = user;
						oReplyDiv.appendChild(oA);

						var oSpan1 = document.createElement("span");
						oSpan1.innerHTML = ":" + content;
						oReplyDiv.appendChild(oSpan1);

						var oBr = document.createElement("br");
						oReplyDiv.appendChild(oBr);

						var oSpan2 = document.createElement("span");
						oSpan2.innerHTML = recordTime;
						oReplyDiv.appendChild(oSpan2);

						if (userId == currentUserId) {
							var oLabel = document.createElement("label");
							oLabel.setAttribute("id", "label_" + replyId + "_"
											+ gossipId);
							oLabel.innerHTML = " | 删除";
							oLabel.setAttribute("onclick", "");
							oReplyDiv.appendChild(oLabel);
						}

						oLI.appendChild(oReplyDiv);
						oReplyUl.appendChild(oLI);
					}

					var oListDiv = document.getElementById("gossip_reply_ul_"
							+ gossipId);
					oListDiv.style.display = "block";
				}

			}
		}
	},

	addReply : function(id) {
		var args = id.split("_");
		var gossipId = args[2];
		var userId = args[3];
		replyGossip = gossipId;

		var aId = "href_" + gossipId;
		var btnId = "btn_gossip_" + userId;
		var textareaId = "textarea_gossip_" + userId;
		var oBtn = document.getElementById(btnId);
		var oText = document.getElementById(textareaId);
		var oA = document.getElementById(aId);
		var name = oA.innerHTML;
		oText.value = "回复 " + name.trim() + ":";
		oBtn.value = "回复";
		oText.focus();
	},
	
	delGossip : function(id) {
		var args = id.split("_");
		var gossipID = args[2];
		var userID = args[3];
		
		this.method = "POST";
		this.url = "delGossip.action";
		this.parameter = "userId=" + userID + "&&gossipId=" + gossipID;
		
		// Create the XMLHttpRequest.
		this.createXMLHttpRequest();
		// open a connection.
		xmlrequest.open(this.method, this.url, this.asynchronous);
		// set the request header.
		xmlrequest.setRequestHeader("Content-Type", this.contentType);
		// set the response function.
		xmlrequest.onreadystatechange = this.response;
		// send the request.
		if (this.parameter == "") {
			xmlrequest.send(null);
		} else {
			xmlrequest.send(this.parameter);
		}
	}
}

var xmlreqGossipReply = null;
var gossipIdScope;
var myGossipReplyAjax = {
	url : "", // 请求地址
	method : "", // 请求方式
	parameter : "", // 请求参数
	asynchronous : true, // 是否异步
	contentType : "application/x-www-form-urlencoded",

	/**
	 * 创建XHR对象
	 */
	createXMLHttpRequest : function() {

		if (window.XMLHttpRequest) {
			// DOM 2
			xmlreqGossipReply = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			try {
				// IE
				xmlreqGossipReply = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					xmlreqGossipReply = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {

				}
			}

		}
	},

	showAllReplies : function(id) {
		var args = id.split("_");
		var gossipId = args[2];
		var userId = args[3];

		gossipIdScope = gossipId;

		this.method = "POST";
		this.url = "getGossipReplies.action";
		this.parameter = "userId=" + userId + "&&gossipId=" + gossipId;

		// Create the XMLHttpRequest.
		this.createXMLHttpRequest();
		// open a connection.
		xmlreqGossipReply.open(this.method, this.url, this.asynchronous);
		// set the request header.
		xmlreqGossipReply.setRequestHeader("Content-Type", this.contentType);
		// set the response function.
		xmlreqGossipReply.onreadystatechange = this.responseShowReplies;
		// send the request.
		if (this.parameter == "") {
			xmlreqGossipReply.send(null);
		} else {
			xmlreqGossipReply.send(this.parameter);
		}
	},

	responseShowReplies : function() {
		if (xmlreqGossipReply.readyState == 4) {
			if (xmlreqGossipReply.status == 200) {
				var responseStr = xmlreqGossipReply.responseText.split("&*");
				var response = responseStr[1];
				
				if (response == "") {
					return ;
				}
				
				// Get the show area of the reply
				var oUlId = "gossip_reply_ul_" + gossipIdScope;
				var oReplyUl = document.getElementById(oUlId);
				if (oReplyUl != null) {
					while (oReplyUl.firstChild) {
						var oldNode = oReplyUl.removeChild(oReplyUl.firstChild);
						oldNode = null;
					}
				}

				var array = response.split("#!");
				var count = array.length;
				for (var i = 0; i < count; i++) {
					var replies = array[i].split("~!");
					var user = replies[0];
					var replyId = replies[1];
					var content = replies[2];
					var recordTime = replies[3];
					var userId = replies[4];
					var currentUserId = replies[5];

					var oLI = document.createElement("li");
					var oReplyDiv = document.createElement("div");
					oReplyDiv.setAttribute("id", "li_gossip_reply_" + replyId);

					var oA = document.createElement("a");
					oA.setAttribute("href", "home.action?userId=" + userId);
					oA.setAttribute("target", "_blank");
					oA.innerHTML = user;
					oReplyDiv.appendChild(oA);

					var oSpan1 = document.createElement("span");
					oSpan1.innerHTML = ":" + content;
					oReplyDiv.appendChild(oSpan1);

					var oBr = document.createElement("br");
					oReplyDiv.appendChild(oBr);

					var oSpan2 = document.createElement("span");
					oSpan2.innerHTML = recordTime;
					oReplyDiv.appendChild(oSpan2);

					if (userId == currentUserId) {
						var oLabel = document.createElement("label");
						oLabel.setAttribute("id", "label_reply_del_" + replyId + "_"
										+ gossipIdScope);
						oLabel.innerHTML = " | 删除";
						oLabel.setAttribute("onclick", "myGossipReplyAjax.delReply(this.id)");
						oReplyDiv.appendChild(oLabel);
					}

					oLI.appendChild(oReplyDiv);
					oReplyUl.appendChild(oLI);
				}

				var oListDiv = document.getElementById("gossip_reply_ul_"
						+ gossipIdScope);
				oListDiv.style.display = "block";
			}
		}
	},
	
	hiddenAllReplies : function(id) {
		var args = id.split("_");
		var gossipId = args[2];
		
		var showReplyListId = "gossip_reply_ul_" + gossipId;
		var oList = document.getElementById(showReplyListId);
		oList.style.display = "none";
	},
	
	delReply : function(id) {
		var args = id.split("_");
		var replyId = args[3];
		var gossipId = args[4];
		gossipIdScope = gossipId;
		
		this.method = "POST";
		this.url = "delGossipReply.action";
		this.parameter = "replyId=" + replyId + "&&gossipId=" + gossipId;

		// Create the XMLHttpRequest.
		this.createXMLHttpRequest();
		// open a connection.
		xmlreqGossipReply.open(this.method, this.url, this.asynchronous);
		// set the request header.
		xmlreqGossipReply.setRequestHeader("Content-Type", this.contentType);
		// set the response function.
		xmlreqGossipReply.onreadystatechange = this.responseShowReplies;
		// send the request.
		if (this.parameter == "") {
			xmlreqGossipReply.send(null);
		} else {
			xmlreqGossipReply.send(this.parameter);
		}
	}
}
