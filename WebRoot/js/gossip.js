/**
 * 留言板相关的Javascript
 */
var myGossip = {
	submit : function() {
		var oForm = document.getElementById("gossipForm");
		oForm.submit();
	},

	addReply : function(id) {
		var args = id.split("_");
		var gossipId = args[2]; // get the gossip id you want to reply.

		// Get the hidden scope of the gossip id in the form.
		var oHiddenGossip = document.getElementById("gossipIdHidden");
		oHiddenGossip.value = gossipId;

		var oHiddenUser = document.getElementById("userIdHidden");
		var userId = oHiddenUser.value;

		var oA = document.getElementById("href_" + gossipId);
		var userName = oA.innerHTML;

		var oBtn = document.getElementById("btn_gossip_" + userId);
		oBtn.value = "Reply";

		var textareaId = "textarea_gossip_" + userId;
		var oTextarea = document.getElementById(textareaId);
		oTextarea.value = "Reply " + userName.trim() + " : ";
		oTextarea.focus();

	}
}


var InputCheck = {
	checkMaxInput : function (id) {
		var args = id.split("_");
		var userID = args[2];
	
		var maxLen = 200; 
		var oText = document.getElementById(id);
		var oRemain = document.getElementById("gossip_remain_"+userID);
		
		if (oText.value.length > maxLen) {
			oText.value = oText.value.substring(0, maxLen);
		}
		else {
			oRemain.innerHTML = maxLen - oText.value.length;
		}
	}
}


$(function(){
				var gossipID;
				var flag = true;
				var args;
				// Dialog			
				$('#dialog').dialog({
					autoOpen: false,
					width: 400,
					buttons: {
						"OK": function() { 
							if (flag) {
								var ids = gossipID.split("_");
								var gossipId = ids[2];
								var userId = ids[3];
								window.location.href = "delGossipCommon.action?gossipId="
												+gossipId+"&&userId="+userId;
							}
							else {
								var par = args.split("_");
								var gossipId = par[4];
								var replyId = par[3];
								var userId = par[5];
								window.location.href = "delGossipReplyCommon.action?gossipId="
											+gossipId+"&&userId="+userId+"&&replyId="+replyId;	
							}
							
							$(this).dialog("close");
						}, 
						"Cancle": function() { 
							$(this).dialog("close"); 
						} 
					}
				});
				
				// Dialog Link
				$('.del_label').click(function(){
					flag = true;
					gossipID = $(this).parent(".li_gossip_div").attr("id");
					$('#dialog').dialog('open');
					return false;
				});		
				
				$('.label_reply_del').click(function(){
					flag = false;
					args = $(this).parent(".li_gossip_del_div").attr("id");
					$('#dialog').dialog('open');
					return false;
				});
			});

			
var bodyObject = {
	ready : function () {
		var oText = document.getElementsByTagName("textarea")[0];
		oText.value = "";
	}
}