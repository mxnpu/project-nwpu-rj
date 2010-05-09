var Validate = new Object;

/**
 * 重发action请求，改变验证码
 * 
 * @param {}
 *            obj 验证码元素
 */
Validate.changeCode = function(obj) {
	// 获取当前的时间作为参数，无具体意义
	var time = new Date().getTime();
	// 每次请求需要一个不同的参数，否则可能会返回同样的验证码
	obj.src = "random.action?id=" + time;
}

/**
 * 判断元素是否为空
 * 
 * @param {}
 *            element 需要判断的元素
 * @param {}
 *            message 出错提示信息
 * @param {}
 *            showId 提示信息位置
 * @return {Boolean} 表单为空时，返回false； 否则返回 true
 */
Validate.required = function(element, message, showId) {
	with (element) {
		if (value == null || value == "") {

			var oText = document.createTextNode(message);
			if (document.getElementById(showId).firstChild != null) {
				var child = document.getElementById(showId).firstChild;
				document.getElementById(showId).removeChild(child);
			}
			document.getElementById(showId).appendChild(oText);
			return false;

		} 
		else {
			return true;
		}
	}
}

Validate.email = function() {

}

var FormUtil = new Object;

/**
 * 打开页面时让表单第一个非隐藏元素获得焦点
 */
FormUtil.focusOnFirst = function() {
	if (document.forms.length > 0) {
		for (var i = 0; i < document.forms[0].elements.length; i++) {
			var oFiled = document.forms[0].elements[i];
			if (oFiled.type != "hidden") {
				oFiled.focus();
				return;
			}
		}
	}
}
