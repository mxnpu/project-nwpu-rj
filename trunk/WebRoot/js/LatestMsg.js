/**
 * 获得好友新鲜事。
 * 
 * @author 许润华
 * @type class
 */
var myLatestMsg = {
	url : "latestMsg.action",
	params : "",
	update : function() {
		var myAjax = new Ajax.Request(this.url, {
					method : 'post',
					parameters : this.params,
					onComplete : this.showResponse,
					asynchronous : true
				});

	},
	showResponse : function(request) {
	}
}
