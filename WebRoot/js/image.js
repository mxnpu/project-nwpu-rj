/**
 * Image Class.
 * 
 * @type class
 */
var ImageObject = {
	/**
	 * 用 JavaScript 实现网页图片等比例缩放
	 * 
	 * @param {}
	 *            ImgD the img element.
	 * @param {}
	 *            FitWidth the wanted width
	 * @param {}
	 *            FitHeight the height width
	 */
	changImageSize : function(ImgD, FitWidth, FitHeight) {
		var image = new Image(); // create the new image.
		image.src = ImgD.src;
		if (image.width > 0 && image.height > 0) {
			if (image.width / image.height >= FitWidth / FitHeight) {
				if (image.width > FitWidth) {
					ImgD.width = FitWidth;
					ImgD.height = (image.height * FitWidth) / image.width;
				} else {
					// ImgD.width = image.width;
					// ImgD.height = image.height;
					ImgD.width = FitWidth;
					ImgD.height = FitHeight;
				}
			} else {
				if (image.height > FitHeight) {
					ImgD.height = FitHeight;
					ImgD.width = (image.width * FitHeight) / image.height;
				} else {
					// ImgD.width = image.width;
					// ImgD.height = image.height;
					ImgD.width = FitWidth;
					ImgD.height = FitHeight;
				}
			}
		}
	},

	/**
	 * 预显示要上传的图片
	 * 
	 * @param {}
	 *            id 上传图片文件Id
	 */
	preViewImage : function(fileId, showId, flag) {
		var image = document.getElementById(fileId);
		var imagePath = this.getFilePath(image);

		var imageName = image.value.substring(image.value.lastIndexOf("."),
				image.value.length);
		imageName = imageName.toLowerCase();
		if ((imageName != '.jpg') && (imageName != '.gif')
				&& (imageName != '.jpeg') && (imageName != '.png')
				&& (imageName != '.bmp')) {

			alert("Please choose a picture!");
			image.focus();

			image.select();
			document.selection.clear();

		} else {

			if (flag == "more") {
				var oPreviewDiv = document.getElementById(showId);
				while (oPreviewDiv.firstChild) {
					var oldNode = oPreviewDiv
							.removeChild(oPreviewDiv.firstChild);
					oldNode = null;
				}

				var oBigImg = document.createElement("img");
				oBigImg.setAttribute("width", "150");
				oBigImg.setAttribute("height", "200");
				oBigImg.setAttribute("src", imagePath);
				var oSmallImg = document.createElement("img");
				oSmallImg.setAttribute("width", "50");
				oSmallImg.setAttribute("height", "65");
				oSmallImg.setAttribute("src", imagePath);
				var oBr1 = document.createElement("br");
				var oBr2 = document.createElement("br");
				var oBr3 = document.createElement("br");
				var oSpan1 = document.createElement("span");
				oSpan1.innerHTML = "The Photo Preview";
				var oSpan2 = document.createElement("span");
				oSpan2.innerHTML = "The Thumbnail";

				oPreviewDiv.appendChild(oSpan1);
				oPreviewDiv.appendChild(oBr1);
				oPreviewDiv.appendChild(oBigImg);
				oPreviewDiv.appendChild(oBr2);
				oPreviewDiv.appendChild(oSpan2);
				oPreviewDiv.appendChild(oBr3);
				oPreviewDiv.appendChild(oSmallImg);

			}
			else {
				var oImg = document.getElementById(showId);
				oImg.setAttribute("width", "150");
				oImg.setAttribute("height", "200");
				oImg.setAttribute("src", imagePath);
			}
		}
	},

	/**
	 * 得到图片文件的地址
	 * 
	 * @param {}
	 *            obj 图片文件
	 */
	getFilePath : function(obj) {
		if (obj) {
			if (window.navigator.userAgent.indexOf("MSIE") >= 1) {
				obj.select();
				return document.selection.createRange().text;
			} else if (window.navigator.userAgent.indexOf("Firefox") >= 1) {
				if (obj.files) {
					return obj.files.item(0).getAsDataURL();
				}
				return obj.value;
			}
			return obj.value;
		}
	}
}