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

				var oReplyUl = document.getElementById("ul_blog_replies");
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
					
					var oLI = document.createElement("li");

					var oImg = document.createElement("img");
					oImg.setAttribute("alt", "Photo");
					oImg.setAttribute("src", photo);
					oImg.setAttribute("width", "50");
					oImg.setAttribute("height", "65");
					oLI.appendChild(oImg);

					var oA = document.createElement("a");
					oA.setAttribute("href", "home.action?userId=" + userid);
					oA.innerHTML = userName;
					oLI.appendChild(oA);

					var oSpan1 = document.createElement("span");
					oSpan1.innerHTML = ":" + content;
					oLI.appendChild(oSpan1);
					var oBr = document.createElement("br");
					oLI.appendChild(oBr);
					var oSpan2 = document.createElement("span");
					oSpan2.innerHTML = recordTime;
					oLI.appendChild(oSpan2);

					
					oReplyUl.appendChild(oLI);

				}
			}
		}
	}

}