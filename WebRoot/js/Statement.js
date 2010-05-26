/**
 * 异步提交用户更新的状态信息。
 * 
 * @author 许润华
 * @type class 
 */
var myStatementChange = {
	url : "changeStmt.action",
	params : "",
	update : function() {
		this.params = $('statement').serialize();
		var myAjax = new Ajax.Request(this.url, {
					method : 'post',
					parameters : this.params,
					onComplete : this.showResponse,
					asynchronous : true
				});

	},
	showResponse : function(request) {
		$('showLastStmt').innerHTML = request.responseText;
		$('statement').setValue('');
	}
}

/**
 * 页面展现时，获得该用户最新的状态信息。
 * 
 * @type class
 */
var myNewStatement = {
	url : "getNewStmt.action",
	params : "",
	update : function() {
		var myAjax = new Ajax.Request(this.url, {
					method : 'get',
					parameters : this.params,
					onComplete : this.showResponse,
					asynchronous : true
				});

	},
	showResponse : function(request) {
		$('showLastStmt').innerHTML = request.responseText;
	}
}