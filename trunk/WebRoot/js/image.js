/**
 * Image Class.
 * 
 * @type class  
 */
var ImageObject = {
	/**
	 * 用 JavaScript 实现网页图片等比例缩放
	 * 
	 * @param {} ImgD the img element.
	 * @param {} FitWidth the wanted width
	 * @param {} FitHeight the height width
	 */
	changImageSize : function(ImgD, FitWidth, FitHeight) {
		var image = new Image();	// create the new image.
		image.src = ImgD.src;		
		if (image.width > 0 && image.height > 0) {
			if (image.width / image.height >= FitWidth / FitHeight) {
				if (image.width > FitWidth) {
					ImgD.width = FitWidth;
					ImgD.height = (image.height * FitWidth) / image.width;
				} else {
//					ImgD.width = image.width;
//					ImgD.height = image.height;
					ImgD.width = FitWidth;
					ImgD.height = FitHeight;
				}
			} else {
				if (image.height > FitHeight) {
					ImgD.height = FitHeight;
					ImgD.width = (image.width * FitHeight) / image.height;
				} else {
//					ImgD.width = image.width;
//					ImgD.height = image.height;
					ImgD.width = FitWidth;
					ImgD.height = FitHeight;
				}
			}
		}
	}
}