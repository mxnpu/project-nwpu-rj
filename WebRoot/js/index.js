/**
 * 主页上的Javascript代码段
 * 
 * @author 许润华
 * @time 2010.05.27
 */
/**
 * 处理用户单击回复区域
 * 
 * @type class
 */
var replyObject = {
	// 展开一个用于回复的Div
	show : function(oItemId) {
		// set the remain show to the default.
		var temp = oItemId.split("_");
		var remainId = "replyRemain_reply_" + temp[1];
		var oRemain = document.getElementById(remainId);
		oRemain.innerHTML = "150";
		
		
		// 获取单击的该Item的id号
		var paras = oItemId.split("_");
		var id = paras[1];

		// 回复总区域
		var targetId = "replyDiv_" + id;
		var oReplyDiv = document.getElementById(targetId);
		oReplyDiv.style.display = "block";
		// 显示回复区域
		var listId = "replyList_" + id;
		var oReplyList = document.getElementById(listId);
		if (oReplyList != null) {
			oReplyList.style.display = "block";
		}
		// 回复区域
		var selfReplyId = "replySelf_" + id;
		var oSelfReply = document.getElementById(selfReplyId);
		if (oSelfReply != null) {
			oSelfReply.style.display = "block";
		}

		var textareaId = "reply_" + id;
		var oReplyText = document.getElementById(textareaId);
		oReplyText.value = "Reply Here :";
		oReplyText.select();

	},

	// 收起一个用于回复的Div
	hidden : function(oItemId) {
		var paras = oItemId.split("_");
		var id = paras[1];

		var targetId = "replyDiv_" + id;
		var oReplyDiv = document.getElementById(targetId);
		oReplyDiv.style.display = "none";

		var listId = "replyList_" + id;
		var oReplyList = document.getElementById(listId);
		if (oReplyList != null) {
			oReplyList.style.display = "none";
		}

		var selfReplyId = "replySelf_" + id;
		var oSelfReply = document.getElementById(selfReplyId);
		if (oSelfReply != null) {
			oSelfReply.style.display = "none";
		}

		var textareaId = "reply_" + id;
		var oReplyText = document.getElementById(textareaId);
		oReplyText.value = "";
	},

	look : function(oItemId) {
		var paras = oItemId.split("_");
		var id = paras[1];

		var targetId = "replyDiv_" + id;
		var oReplyDiv = document.getElementById(targetId);
		oReplyDiv.style.display = "block";

		var listId = "replyList_" + id;
		var oReplyList = document.getElementById(listId);
		if (oReplyList != null) {
			oReplyList.style.display = "block";
		}
	}
}

/**
 * Reply 的异步请求处理
 * 
 * @type
 */
var xmlrequest = null;
var itemId;
var replyAjax = {
	url : "", // 请求地址
	method : "", // 请求方式
	parameter : "", // 请求参数
	asynchronous : true, // 是否异步
	contentType : "application/x-www-form-urlencoded",
	itemId : "",

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

	replyBtn : function(oItemId) {
		// Get the id of the item.
		var paras = oItemId.split("_");
		var id = paras[2];
		itemId = id;

		// Get the reply content of the item.
		var textareaId = "reply_" + id;
		var oReplyText = document.getElementById(textareaId);
		var text = oReplyText.value;
		oReplyText.value = "";

		// Begin the ajax interact.
		this.method = "POST";
		this.url = "replyAjax.action";
		this.parameter = "replyContent=" + text + "&&replyItem=" + id;

		// Create the XMLHttpRequest.
		this.createXMLHttpRequest();
		// open a connection.
		xmlrequest.open(this.method, this.url, this.asynchronous);
		// set the request header.
		xmlrequest.setRequestHeader("Content-Type", this.contentType);
		// set the response function.
		xmlrequest.onreadystatechange = this.processReply;
		// send the request.
		if (this.parameter == "") {
			xmlrequest.send(null);
		} else {
			xmlrequest.send(this.parameter);
		}
	},

	processReply : function() {
		if (xmlrequest.readyState == 4) {
			if (xmlrequest.status == 200) {
				// Get the show area of the reply
				var oUlId = "reply_ul_" + itemId;
				var oReplyUl = document.getElementById(oUlId);
				while (oReplyUl.firstChild) {
					var oldNode = oReplyUl.removeChild(oReplyUl.firstChild);
					oldNode = null;
				}

				var responseStr = xmlrequest.responseText;
				var array = responseStr.split("@");
				var count = array.length;
				for (var i = 0; i < count; i++) {
					var replies = array[i].split("_");
					var user = replies[0];
					var replyId = replies[1];
					var content = replies[2];
					var recordTime = replies[3];
					var userId = replies[4];

					var oLI = document.createElement("li");
					var oReplyDiv = document.createElement("div");
					oReplyDiv.setAttribute("id", "li_reply_" + replyId);
					var oA = document.createElement("a");
					oA.setAttribute("href", "home.action?userId=" + userId);
					oA.setAttribute("target","_blank");
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
					var oLabel = document.createElement("label");
					oLabel.setAttribute("id", "label_"+replyId+"_"+itemId);
					oLabel.innerHTML = "Delete";
					oLabel.setAttribute("onclick", "replyDelAjax.deleteReply(this.id)");
					oReplyDiv.appendChild(oLabel);

					oLI.appendChild(oReplyDiv);
					oReplyUl.appendChild(oLI);
				}
			}
		}
	}

}


var replyDelAjax = {
	url : "", // 请求地址
	method : "", // 请求方式
	parameter : "", // 请求参数
	asynchronous : true, // 是否异步
	contentType : "application/x-www-form-urlencoded",
	itemId : "",

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
	
	processReply : function() {
		if (xmlrequest.readyState == 4) {
			if (xmlrequest.status == 200) {
				// Get the show area of the reply
				var oUlId = "reply_ul_" + itemId;
				var oReplyUl = document.getElementById(oUlId);
				while (oReplyUl.firstChild) {
					var oldNode = oReplyUl.removeChild(oReplyUl.firstChild);
					oldNode = null;
				}

				var responseStr = xmlrequest.responseText;
				var array = responseStr.split("@");
				var count = array.length;
				for (var i = 0; i < count; i++) {
					var replies = array[i].split("_");
					var user = replies[0];
					var replyId = replies[1];
					var content = replies[2];
					var recordTime = replies[3];
					var userId = replies[4];

					var oLI = document.createElement("li");
					var oReplyDiv = document.createElement("div");
					oReplyDiv.setAttribute("id", "li_reply_" + replyId);
					var oA = document.createElement("a");
					oA.setAttribute("href", "home.action?userId=" + userId);
					oA.setAttribute("target","_blank");
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
					var oLabel = document.createElement("label");
					oLabel.setAttribute("id", "label_"+replyId+"_"+itemId);
					oLabel.innerHTML = "Delete";
					oLabel.setAttribute("onclick", "replyDelAjax.deleteReply(this.id)");
					oReplyDiv.appendChild(oLabel);

					oLI.appendChild(oReplyDiv);
					oReplyUl.appendChild(oLI);
				}
			}
		}
	},

	deleteReply : function(args) {
		var para = args.split("_");
		var replyId = para[1];
		itemId = para[2];

		this.url = "deleteReply.action?replyId="+replyId+"&&itemId="+itemId;
		this.method = "GET";
		// Create the XMLHttpRequest.
		this.createXMLHttpRequest();
		// open a connection.
		xmlrequest.open(this.method, this.url, this.asynchronous);
		// set the request header.
		xmlrequest.setRequestHeader("Content-Type", this.contentType);
		// set the response function.
		xmlrequest.onreadystatechange = this.processReply;
		// send the request.
		if (this.parameter == "") {
			xmlrequest.send(null);
		} else {
			xmlrequest.send(this.parameter);
		}
	}

}