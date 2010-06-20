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
		oBtn.value = "Gossip";

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
						oLI.setAttribute("class", "content_item");

						// reply show hidden button
						var oUL1 = document.createElement("ul");
						oUL1.setAttribute("class", "replayMessage_editor");
						var oLI1 = document.createElement("li");
						var oLabel1 = document.createElement("label");
						oLabel1.setAttribute("id", "label_reply_" + gossipId
										+ "_" + userId);
						oLabel1.setAttribute("onclick",
								"myGossipAjax.addReply(this.id);");
						oLabel1.setAttribute("onmouseover",
								"JavaScript:this.style.cursor='pointer'");
						oLabel1.innerHTML = "Reply";
						var oLI2 = document.createElement("li");
						var oLabel2 = document.createElement("label");
						oLabel2.setAttribute("id", "label_reply_" + gossipId
										+ "_" + userId);
						oLabel2.setAttribute("onclick",
								"myGossipReplyAjax.showAllReplies(this.id);");
						oLabel2.setAttribute("onmouseover",
								"JavaScript:this.style.cursor='pointer'");
						oLabel2.innerHTML = "Show";
						var oLI3 = document.createElement("li");
						var oLabel3 = document.createElement("label");
						oLabel3.setAttribute("id", "label_reply_" + gossipId
										+ "_" + userId);
						oLabel3.setAttribute("onclick",
								"myGossipReplyAjax.hiddenAllReplies(this.id);");
						oLabel3.setAttribute("onmouseover",
								"JavaScript:this.style.cursor='pointer'");
						oLabel2.innerHTML = "Hide";
						oLI1.appendChild(oLabel1);
						oLI2.appendChild(oLabel2);
						oLI3.appendChild(oLabel3);
						oUL1.appendChild(oLI1);
						oUL1.appendChild(oLI2);
						oUL1.appendChild(oLI3);

						// message
						var oUL2 = document.createElement("ul");
						oUL2.setAttribute("class", "message_item");
						var oUL2LI1 = document.createElement("li");
						oUL2LI1.setAttribute("class", "message_detail");
						var oImg = document.createElement("img");
						oImg.setAttribute("class", "message_photo");
						oImg.setAttribute("alt", "Photo");
						oImg.setAttribute("src", ownerPhoto);
						oImg.setAttribute("width", "50");
						oImg.setAttribute("height", "65");
						var oPTemp = document.createElement("p");
						var oA = document.createElement("a");
						oA.setAttribute("id", "href_" + gossipId);
						oA.setAttribute("href", "home.action?userId="
										+ gossipOwnerId);
						oA.innerHTML = userName.trim();
						var oSpan1 = document.createElement("span");
						oSpan1.innerHTML = ":" + content;
						var oBr1 = document.createElement("br");
						oPTemp.appendChild(oA);
						oPTemp.appendChild(oSpan1);
						oPTemp.appendChild(oBr1);
						var oSpan2 = document.createElement("span");
						oSpan2.setAttribute("class", "blog_date");
						oSpan2.innerHTML = recordTime.trim();
						oUL2LI1.appendChild(oImg);
						oUL2LI1.appendChild(oPTemp);
						oUL2LI1.appendChild(oSpan2);
						if (userId == currentId) {
							var oLabelDel = document.createElement("label");
							oLabelDel.setAttribute("id", "label_del_"
											+ gossipId + "_" + userId);
							oLabelDel.innerHTML = " | Delete";
							oLabelDel.setAttribute("onclick",
									"myGossipAjax.delGossip(this.id)");
							oLabelDel.setAttribute("onmouseover",
									"JavaScript:this.style.cursor='pointer'");
							oUL2LI1.appendChild(oLabelDel);
						}

						var oUL2LI2 = document.createElement("li");
						var oUL2LI2UL = document.createElement("ul");
						oUL2LI2UL.setAttribute("id", "gossip_reply_ul_"
										+ gossipId);
						oUL2LI2UL.setAttribute("class", "gossip_reply_ul");
						oUL2LI2.appendChild(oUL2LI2UL);
						oUL2.appendChild(oUL2LI1);
						oUL2.appendChild(oUL2LI2);

						oLI.appendChild(oUL1);
						oLI.appendChild(oUL2);
						oGossipUl.appendChild(oLI);
					}
					oGossipUl.style.display="block";

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
						var photo = replies[6];

						var oLI = document.createElement("li");
						oLI.setAttribute("class", "message_detail_replay");
						var oImg = document.createElement("img");
						oImg.setAttribute("class", "message_photo");
						oImg.setAttribute("alt", "Photo");
						oImg.setAttribute("src", photo);
						oImg.setAttribute("width", "50");
						oImg.setAttribute("height", "65");
						var oPTemp = document.createElement("p");
						var oA = document.createElement("a");
						oA.setAttribute("href", "home.action?userId=" + userId);
						oA.innerHTML = user.trim();
						var oSpan1 = document.createElement("span");
						oSpan1.innerHTML = ":" + content;
						oPTemp.appendChild(oA);
						oPTemp.appendChild(oSpan1);
						var oSpan2 = document.createElement("span");
						oSpan2.setAttribute("class", "blog_date");
						oSpan2.innerHTML = recordTime.trim();
						oLI.appendChild(oImg);
						oLI.appendChild(oPTemp);
						oLI.appendChild(oSpan2);
						if (userId == currentUserId) {
							var oLabel = document.createElement("label");
							oLabel.setAttribute("id", "label_reply_del_"
											+ replyId + "_" + gossipId);
							oLabel.innerHTML = " | Delete";
							oLabel.setAttribute("onclick",
									"myGossipReplyAjax.delReply(this.id);");
							oLabel.setAttribute("onmouseover",
									"JavaScript:this.style.cursor='pointer'");
							oLI.appendChild(oLabel);
						}

						oReplyUl.appendChild(oLI);
					}
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
		oText.value = "Reply " + name.trim() + ":";
		oBtn.value = "Reply";
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
					return;
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
					var photo = replies[6];

					var oLI = document.createElement("li");
					oLI.setAttribute("class", "message_detail_replay");
					var oImg = document.createElement("img");
					oImg.setAttribute("class", "message_photo");
					oImg.setAttribute("alt", "Photo");
					oImg.setAttribute("src", photo);
					oImg.setAttribute("width", "50");
					oImg.setAttribute("height", "65");
					var oPTemp = document.createElement("p");
					var oA = document.createElement("a");
					oA.setAttribute("href", "home.action?userId=" + userId);
					oA.innerHTML = user.trim();
					var oSpan1 = document.createElement("span");
					oSpan1.innerHTML = ":" + content;
					oPTemp.appendChild(oA);
					oPTemp.appendChild(oSpan1);
					var oSpan2 = document.createElement("span");
					oSpan2.setAttribute("class", "blog_date");
					oSpan2.innerHTML = recordTime.trim();
					oLI.appendChild(oImg);
					oLI.appendChild(oPTemp);
					oLI.appendChild(oSpan2);
					if (userId == currentUserId) {
						var oLabel = document.createElement("label");
						oLabel.setAttribute("id", "label_reply_del_" + replyId
										+ "_" + gossipIdScope);
						oLabel.innerHTML = " | Delete";
						oLabel.setAttribute("onclick",
								"myGossipReplyAjax.delReply(this.id);");
						oLabel.setAttribute("onmouseover",
								"JavaScript:this.style.cursor='pointer'");
						oLI.appendChild(oLabel);
					}

					oReplyUl.appendChild(oLI);
				}
				oReplyUl.style.display="block";
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

var InputCheck = {
	checkMaxInput : function(id) {
		var args = id.split("_");
		var userID = args[2];

		var maxLen = 200;
		var oText = document.getElementById(id);
		var oRemain = document.getElementById("gossip_remain_" + userID);

		if (oText.value.length > maxLen) {
			oText.value = oText.value.substring(0, maxLen);
		} else {
			oRemain.innerHTML = maxLen - oText.value.length;
		}
	}
}
