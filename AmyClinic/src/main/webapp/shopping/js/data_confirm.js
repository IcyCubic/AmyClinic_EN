
function getContextPath() { //obtains context path. EL doesn't work with separated .js
		return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
}

$(function(){
	var reward_dis = $("#reward_dis");
	var should_pay = $("#should_pay");
	var reward_pts = $("#reward_pts");
	var newRwd = $("#newRwd");
	var subtotal = $("#subtotal").val();
	//設定本次可得紅利點數的預設值
	newRwd.append(Math.round(subtotal/100).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
	
	//要來驗證每個欄位的長度和格式
	
	//姓名只能輸入中英文及半型空白，且不得以半型空白開頭
	$('input[name="mname"]').blur(function(){
		var warn_name = $("#warnname");
		var patt_name = /^[^\u0020\u3000][\u4e00-\u9fa5\u0020a-zA-Z]{1,20}$/
			if($(this).val().length == 0) {
				warn_name.html("&nbsp;&nbsp;&nbsp;&nbsp;<span class='fontisred'>請勿空白</span>");
				$("#confirm").prop("disabled",true);
			} else if (!patt_name.test($(this).val())) {
				warn_name.html("&nbsp;&nbsp;&nbsp;&nbsp;<span class='fontisred'>格式錯誤</span>");
				$("#confirm").prop("disabled",true);
			} else {
				warn_name.empty();
				$("#confirm").removeAttr("disabled");
			}
	});
	
	//地址
	$('input[name="addr"]').blur(function(){
		var warn_addr = $("#warnaddr");
		var patt_addr = /^[^\u0020\u3000][\u4e00-\u9fa5\u0020a-zA-Z0-9]{1,50}$/
		if($(this).val().length == 0) {
			warn_addr.html("&nbsp;&nbsp;&nbsp;&nbsp;<span class='fontisred'>請勿空白</span>");
			$("#confirm").prop("disabled",true);
		} else if (!patt_addr.test($(this).val())) {
			warn_addr.html("&nbsp;&nbsp;&nbsp;&nbsp;<span class='fontisred'>格式錯誤</span>");
			$("#confirm").prop("disabled",true);
		} else {
			warn_addr.empty();
			$("#confirm").removeAttr("disabled");
		}
	});
	
	//電話最多只能10碼，且需為純數字
	$('input[name="phone"]').blur(function(){
		var warn = $("#warnphone");
		var patt = /^[0-9]+$/;
		if($(this).val().length > 10) {
			warn.html("&nbsp;&nbsp;&nbsp;&nbsp;<span class='fontisred'>電話長度超過</span>");
			$("#confirm").prop("disabled",true);
		} else if($(this).val().length < 7){
			warn.html("&nbsp;&nbsp;&nbsp;&nbsp;<span class='fontisred'>電話長度太短</span>");
			$("#confirm").prop("disabled",true);
		} else if(!patt.test($(this).val())){
			warn.html("&nbsp;&nbsp;&nbsp;&nbsp;<span class='fontisred'>請輸入純數字</span>");
			$("#confirm").prop("disabled",true);
		} else if($(this).val().length == 0) {
			warn.html("&nbsp;&nbsp;&nbsp;&nbsp;<span class='fontisred'>請勿空白</span>");
			$("#confirm").prop("disabled",true);
		} else {
			warn.empty();
			$("#confirm").removeAttr("disabled");
		}
	});
	
	//email需符合格式
	$('input[name="email"]').blur(function(){
		var warn_email = $("#warnemail");
		var patt_email = /^[a-zA-Z0-9_]*@[a-zA-Z0-9]+(\.[a-zA-Z]+){1,3}$/
		if ($(this).val().length == 0){
			warn_email.html("&nbsp;&nbsp;&nbsp;&nbsp;<span class='fontisred'>請勿空白</span>");
			$("#confirm").prop("disabled",true);
		} else if (!patt_email.test($(this).val())) {
			warn_email.empty();
			warn_email.html("&nbsp;&nbsp;&nbsp;&nbsp;<span class='fontisred'>格式錯誤</span>");
			$("#confirm").prop("disabled",true);
		} else {
			warn_email.empty();
			$("#confirm").removeAttr("disabled");
		}
	});
	
	//送出時再做最後的檢查
	$("#confirm").click(function(){
		var myReward_pts = reward_pts.val();
		var pay = should_pay.text();
		var mname = $('input[name="mname"]').val();
		var addr = $('input[name="addr"]').val();
		var phone = $('input[name="phone"]').val();
		var email = $('input[name="email"]').val();
		var myNewRwd = $("#newRwd").text();
		if(mname.length == 0 || addr.length == 0 || phone.length == 0 || email.length == 0) {
			Lobibox.notify("error", {
				size: 'mini',
				title: '資料請填寫完整',
				delay: 1500,
				delayIndicator: false,
				sound: false,
				position: "center top"
				});
			return;
		}
		$.ajax({
			"type":"post",
			"url": getContextPath()+ "/shoppings/neworder",
			"dataType":"json",
			"data":{"reward_pts": myReward_pts, "should_pay":pay, "mname":mname, "addr":addr, "phone":phone, "email":email},
			"success":function(datas) {
				$.each(datas,function(i,data) {
				var oid = data;
				window.location.href = getContextPath()+ "/shoppings/checkforpay?oid="+oid;
				})
				
			}
		})
		
	});
	
	
	//取消訂單，把購物車殺掉
	$("#cancel").click(function(){
		Lobibox.confirm({
			title: "取消訂單",
			msg: "要取消訂單嗎？",
			callback: function ($this, type, ev) {
			    if(type == 'yes') {
			    	$.ajax({
						"type":"post",
						"url": getContextPath()+ "/shoppings/killorder",
						"success":function(data){
							window.location.href = getContextPath()+ "/shopping/prod_list.jsp";
						}
					})
			    } else {}
			}
			});
//		if(confirm("要取消訂單嗎？")) {
//			$.ajax({
//				"type":"post",
//				"url": getContextPath()+ "/shoppings/killorder",
//				"success":function(data){
//					window.location.href = getContextPath()+ "/shopping/prod_list.jsp";
//				}
//			})
//		}
	});
	
	//依照使用者輸入的紅利點數動態改變扣抵金額、應付金額、所得紅利點數，並且針對值去做驗證
	reward_pts.keyup(function(){
		var member_reward_pts = $("#member_reward_pts").val();
		var myReward_pts = $(this).val();
		var patt = /^[1-9][0-9]*$/;
		if((member_reward_pts - myReward_pts) < 0 || myReward_pts < 0 || !patt.test(myReward_pts) || myReward_pts.length <= 0 || (subtotal- myReward_pts) < 0) {
			reward_dis.empty()
			          .append(0);
			should_pay.empty()
			          .append(subtotal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
			newRwd.empty()
				  .append(Math.round((subtotal/100)).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
			return;
		}
		reward_dis.empty()
		          .append((myReward_pts).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
		should_pay.empty()
		          .append((subtotal - myReward_pts).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
		newRwd.empty()
		      .append(Math.round((subtotal - myReward_pts)/100).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
	})
	
	//如果使用者輸入不合法的紅利點數，blur之後會回到0
	reward_pts.blur(function(){
		var reward_dis1 = reward_dis.text();
		$(this).val(reward_dis1);
		$(this).attr("value",reward_dis1);
		
	})
	
})
	
