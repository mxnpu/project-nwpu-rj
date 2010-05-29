/**
 * AJAX类
 * 
 * @author 许润华
 * @time 2010.05.27
 */
/**
 * 处理Statement AJAX请求的类
 * 
 * @type class
 */
var xmlrequest = null;

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
	 * 响应处理的函数
	 */
	responseNewStmt : function() {
		if (xmlrequest.readyState == 4) {
			if (xmlrequest.status == 200) {
				var responseStr = xmlrequest.responseText;
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
		xmlrequest.open(this.method, this.url, this.asynchronous);
		// set the request header.
		xmlrequest.setRequestHeader("Content-Type", this.contentType);
		// set the response function.
		xmlrequest.onreadystatechange = this.responseNewStmt;
		// send the request.
		if (this.parameter == "") {
			xmlrequest.send(null);
		}
		else {
			xmlrequest.send(this.parameter);
		}
	},
	
	updateStmt : function() {
		
		this.method = "POST";
		this.url = "changeStmt.action";
		this.parameter = "statement=" + document.getElementById("statement").value;
		
		// Create the XMLHttpRequest.
		this.createXMLHttpRequest();
		// open a connection.
		xmlrequest.open(this.method, this.url, this.asynchronous);
		// set the request header.
		xmlrequest.setRequestHeader("Content-Type", this.contentType);
		// set the response function.
		xmlrequest.onreadystatechange = this.responseUpdate;
		// send the request.
		if (this.parameter == "") {
			xmlrequest.send(null);
		}
		else {
			xmlrequest.send(this.parameter);
		}
	},
	
	responseUpdate : function() {
		if (xmlrequest.readyState == 4) {
			if (xmlrequest.status == 200) {
				var responseStr = xmlrequest.responseText;
				document.getElementById('showLastStmt').innerHTML = responseStr;
				document.getElementById('statement').value = "";
			}
		}

	}
}
