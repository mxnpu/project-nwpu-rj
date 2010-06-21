/**
 * Reply 的异步请求处理
 * 
 * @type
 */
var xmlrequest = null;
var itemId;
var replyBlogAjax = {
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

	reply : function(blogId) {

		var id = blogId.trim();
		var content = document.getElementById("replyContent").value.trim();
		document.getElementById("replyContent").value = "";

		// Begin the ajax interact.
		this.method = "GET";
		this.url = "addBlogReply?id="+id+"&&content="+content;

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
				var responseStr = xmlrequest.responseText;

				var oReplyUl = document.getElementById("content_list_reply");
				while (oReplyUl.firstChild) {
					var oldNode = oReplyUl.removeChild(oReplyUl.firstChild);
					oldNode = null;
				}

				var array = responseStr.split("@&");
				var count = array.length;
				for (var i = 0; i < count; i++) {
					var replies = array[i].split("_&");

					var userName = replies[0];
					var userid  = replies[1]
					var photo = replies[2];
					var content = replies[3];
					var recordTime = replies[4];
					
					var oBLI = document.createElement("li");
					oBLI.setAttribute("class","content_item");
					var oEUL = document.createElement("ul");
					oEUL.setAttribute("class","replayMessage_editor");
					var oTempLI = document.createElement("li");
					var oImgTemp = document.createElement("img");
					oImgTemp.setAttribute("src", "../style/image/icon_message.png");
					oTempLI.appendChild(oImgTemp);
					oEUL.appendChild(oTempLI);
					oBLI.appendChild(oEUL);
					
					var oDiv = document.createElement("div");
					oDiv.setAttribute("class","message_item");
					var oTempUL = document.createElement("ul");
					oTempUL.setAttribute("id","ul_blog_replies");
					
					var oLI = document.createElement("li");
					oLI.setAttribute("class","message_detail");
					var oImg = document.createElement("img");
					oImg.setAttribute("alt", "Photo");
					oImg.setAttribute("src", photo);
					oImg.setAttribute("width", "50");
					oImg.setAttribute("height", "65");
					oLI.appendChild(oImg);
					var oP1 = document.createElement("p");
					var oA = document.createElement("a");
					oA.setAttribute("href", "home.action?userId=" + userid);
					oA.innerHTML = userName;
					oP1.appendChild(oA);
					oLI.appendChild(oP1);
					var oP2 = document.createElement("p");
					oP2.innerHTML = ":" + content;
					oLI.appendChild(oP2);
					var oSpan = document.createElement("span");
					oSpan.setAttribute("class","message_date");
					oSpan.innerHTML = recordTime;
					oLI.appendChild(oSpan);
					
					oTempUL.appendChild(oLI);
					oDiv.appendChild(oTempUL);
					oBLI.appendChild(oDiv);
					oReplyUl.appendChild(oBLI);
				}
			}
		}
	}

}

var InputCheck = {
	checkMaxInput : function () {
		var maxLen = 200; 
		var oText = document.getElementById("replyContent");
		var oRemain = document.getElementById("gossip_remain");
		
		if (oText.value.length > maxLen) {
			oText.value = oText.value.substring(0, maxLen);
		}
		else {
			oRemain.innerHTML = maxLen - oText.value.length;
		}
	}
}

var bodyObject = {
	ready : function () {
		var oText = document.getElementsByTagName("textarea")[0];
		oText.value = "";
	}
}