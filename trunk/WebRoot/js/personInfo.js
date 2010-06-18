var remainName;
var PersonInfo = {
	ready : function() {
		var oTextarea = document.getElementById("hobby");
		var hobby = oTextarea.innerHTML.trim();
		oTextarea.innnerHTML = hobby;
		
		var oUserName = document.getElementById("username");
		remainName = oUserName.value;
		
	}
}

var Validate = new Object;
var ajaxNameValidate = true;
Validate.required = function(element, s, e, message, showId) {
	var args = arguments.length;
	var flag = false;
	var message;
	var showId;
	if (args == 5) {
		flag = true;
	} else {
		message = arguments[1];
		showId = arguments[2];
	}

	with (element) {
		if (value == null || value == "") {

			var oText = document.createTextNode(message);
			if (document.getElementById(showId).firstChild != null) {
				var child = document.getElementById(showId).firstChild;
				document.getElementById(showId).removeChild(child);
			}
			document.getElementById(showId).appendChild(oText);
			ajaxNameValidate = false;
			return false;

		} else {
			if (flag && value.length < s || value.length > e) {
				var oText = document.createTextNode("Length Scope" + s + "-" + e);
				if (document.getElementById(showId).firstChild != null) {
					var child = document.getElementById(showId).firstChild;
					document.getElementById(showId).removeChild(child);
				}
				document.getElementById(showId).appendChild(oText);
				ajaxNameValidate = false;
				return false;
			} else {
				if (document.getElementById(showId).firstChild != null) {
					var child = document.getElementById(showId).firstChild;
					document.getElementById(showId).removeChild(child);
				}
				ajaxNameValidate = true;
				return true;
			}
		}
	}
}

/**
 * 检查Email地址是否正确
 * 
 * @param {}
 *            emailElement email输入控件
 */
Validate.email = function(emailElement, showId) {
	var regEmail = /^(?:\w+\.?)*\w+@(?:\w+\.?)*\w+$/;
	var flag = regEmail.test(emailElement.value);
	if (!flag) {
		var oText = document.createTextNode("Invalide Email Address");
		if (document.getElementById(showId).firstChild != null) {
			var child = document.getElementById(showId).firstChild;
			document.getElementById(showId).removeChild(child);
		}
		document.getElementById(showId).appendChild(oText);
		return false;
	} else {
		if (document.getElementById(showId).firstChild != null) {
			var child = document.getElementById(showId).firstChild;
			document.getElementById(showId).removeChild(child);
		}
		return true;
	}
}

Validate.changeCode = function(obj) {
	// 获取当前的时间作为参数，无具体意义
	var time = new Date().getTime();
	// 每次请求需要一个不同的参数，否则可能会返回同样的验证码
	obj.src = "random.action?id=" + time;
}

var xmlrequest;

var myNameValidateAjax = {
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
	
	validate : function(value) {
		if (ajaxNameValidate && remainName != value) {
			
			var url = "isNameExist.action?valiName=" + value;
			var method="GET";
			
			// Create the XMLHttpRequest.
			this.createXMLHttpRequest();
			// open a connection.
			xmlrequest.open(method, url, true);
			// set the request header.
			xmlrequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			// set the response function.
			xmlrequest.onreadystatechange = this.process;
			// send the request.
			xmlrequest.send(null);
		}
		else {
			return false;
		}
		
		

	},
	
	process : function(request) {
		if (xmlrequest.readyState == 4) {
			if (xmlrequest.status == 200) {
				document.getElementById("userNameError").innerHTML = xmlrequest.responseText;
			}
		}
		
	}
}

var photoXMLHttpRequest;
var photoAJAX = {
	createXMLHttpRequest : function() {
		if (window.XMLHttpRequest) {
			// DOM 2
			photoXMLHttpRequest = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			try {
				// IE
				photoXMLHttpRequest = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					photoXMLHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {

				}
			}

		}
	},
	
	changPhoto : function() {
		
			var url = "fileUpload.action";
			var method="POST";
			var parm = $("#changPhoto").serialize();
			
			// Create the XMLHttpRequest.
			this.createXMLHttpRequest();
			// open a connection.
			photoXMLHttpRequest.open(method, url, true);
			// set the request header.
			photoXMLHttpRequest.setRequestHeader("Content-Type", "multipart/form-data");
			// set the response function.
			photoXMLHttpRequest.onreadystatechange = this.process;
			// send the request.
			photoXMLHttpRequest.send(parm);
	},
	
	process : function(request) {
		if (photoXMLHttpRequest.readyState == 4) {
			if (photoXMLHttpRequest.status == 200) {
				photoXMLHttpRequest.responseText;
			}
		}
		
	}
}