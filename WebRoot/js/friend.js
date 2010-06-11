$(function() {
			var userID;
			// Dialog
			$('#dialog').dialog({
				autoOpen : false,
				width : 400,
				buttons : {
					"OK" : function() {
						window.location.href = "deleteFriend?friendId=" + userID;
						$(this).dialog("close");
					},
					"Cancle" : function() {
						$(this).dialog("close");
					}
				}
			});

			// Dialog Link
			$('.delete_friend').click(function() {
						userID = $(this).parent(".delete_friend_div")
								.attr("id");
						$('#dialog').dialog('open');
						return false;
					});
		});