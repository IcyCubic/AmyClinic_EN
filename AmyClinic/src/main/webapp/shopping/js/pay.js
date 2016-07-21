$('form').card({
	container: '.card-wrapper',
	formatting: true,
	messages: {
	        validDate: '有效\n期限'
	},
	placeholders: {
    name: '持卡人姓名',
    expiry: 'MM/YY'
},
	})
$(function() {
	var pay = $('#paysubmit');
	pay.prop("disabled",true);
	var name = $('input[name="name"]');
	var patt_name = /^[^\u0020\u3000][\u4e00-\u9fa5\u0020a-zA-Z]{1,20}$/
	name.blur(function() {
		if ($(this).val().length == 0 || !patt_name.test($(this).val())) {
			pay.prop("disabled",true);
		} else {
			pay.removeAttr("disabled");
		}
	})
	
	var number = $('input[name="number"]');
	number.bind('cut copy paste', function (e) {
		e.preventDefault(); //取消動作
		});
	number.blur(function() {
		var patt_number = /^[^\u0020\u3000][0-9\u0020]*$/
		if ($(this).val().length == 0 || !patt_number.test($(this).val())) {
			pay.prop("disabled",true);
		} else {
			pay.removeAttr("disabled");
		}
	})
	
	
	
	
	var expiry = $('input[name="expiry"]');
	expiry.bind('cut copy paste', function (e) {
		e.preventDefault(); //取消動作
		});
	var patt_expiry = /^(0[1-9])|(1[0-2]).*$/
		expiry.blur(function() {
		if ($(this).val().length == 0 || !patt_expiry.test($(this).val())) {
			pay.prop("disabled",true);
		} else {
			pay.removeAttr("disabled");
		}
	})
	
	var cvc = $('input[name="cvc"]');
	cvc.bind('cut copy paste', function (e) {
		e.preventDefault(); //取消動作
		});
	var patt_cvc = /^[0-9]{3}$/
	cvc.blur(function() {
		if ($(this).val().length == 0 || !patt_cvc.test($(this).val())) {
			pay.prop("disabled",true);
		} else {
			pay.removeAttr("disabled");
		}
	})
	
	pay.click(function() {
		if(name.val().length==0 || number.val().length==0 || expiry.val().length==0 || cvc.val().length==0 || !patt_name.test(name.val()) || !patt_cvc.test(cvc.val()) || !patt_expiry.test(expiry.val())) {
			$(this).prop("disabled",true);
		} else {
			pay.removeAttr("disabled");
		}
	})	
	
		
	
})	