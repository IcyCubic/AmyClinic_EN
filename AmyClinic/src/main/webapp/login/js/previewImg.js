function PreviewImage(imgFile) {

	var pattern = /(\.*.jpg$)|(\.*.png$)|(\.*.jpeg$)|(\.*.gif$)|(\.*.bmp$)/;
	if (!pattern.test(imgFile.value)) {
		Lobibox.notify("error", {
			size: 'mini',
			title: '只支援jpg/jpeg/png/gif之格式檔案',
			delay: 1500,
			delayIndicator: false,
			sound: false,
			position: "center top"
			});
//		alert("只支援jpg/jpeg/png/gif/bmp之格式檔案");
		imgFile.focus();
	} else {
		var path;
		if (document.all) { // IE
			imgFile.select();
			imgFile.blur();
			path = document.selection.createRange().text;
			document.getElementById("imgPreview").style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='scale',src=\""+ path + "\")";// 濾鏡
			// document.getElementById('img1').src = path; // IE 無效
		} else { // FF 或 Chrome 等
			path = URL.createObjectURL(imgFile.files[0]);
			document.getElementById("imgPreview").innerHTML = "<img src='"+ path +"'  width='243' height='200'/>";
			// document.getElementById('img1').src = path; // Chrome 有效
		}
	}
}

function PreviewImage2(imgFile) {

	var pattern = /(\.*.jpg$)|(\.*.png$)|(\.*.jpeg$)|(\.*.gif$)|(\.*.bmp$)/;
	if (!pattern.test(imgFile.value)) {
		Lobibox.notify("error", {
			size: 'mini',
			title: '只支援jpg/jpeg/png/gif之格式檔案',
			delay: 1500,
			delayIndicator: false,
			sound: false,
			position: "center top"
			});
//		return;
//		alert("只支援jpg/jpeg/png/gif/bmp之格式檔案");
		imgFile.focus();
	} else {
		var path;
		if (document.all) { // IE
			imgFile.select();
			imgFile.blur();
			path = document.selection.createRange().text;
			document.getElementById("imgPreview2").style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='scale',src=\""+ path + "\")";// 濾鏡
			// document.getElementById('img1').src = path; // IE 無效
		} else { // FF 或 Chrome 等
			path = URL.createObjectURL(imgFile.files[0]);
			document.getElementById("imgPreview2").innerHTML = "<img src='"+ path +"'  width='243' height='200'/>";
			// document.getElementById('img1').src = path; // Chrome 有效
		}
	}
}
