addEvent(window, "load", sortables_init);

function getContextPath() { //obtains context path. EL doesn't work with separated .js
		return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
}
function upd(key,quantity,index) {
			var amount;
			$.ajax({
				"type":"get",
				"url":getContextPath()+'/free/queryprodbyid',
				"data":{"pid" : key},
				"async":false,
				"success":function(data){
					//抓庫存量
					amount = data.amount;
				}
				
			})
			
			var price = $('#pri'+index).val();
			var newQty = $("#send_qty" + index).val();
			
			if(newQty < 0) {
				$("#send_qty" + index).val(quantity);
				$("#subtotal" + index).empty();
				$("#subtotal" + index).append((price * quantity).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "元");
				return;
			}
			if(newQty == 0) {
				Lobibox.notify("error", {
					size: 'mini',
					title: '請點刪除按鈕刪除',
					delay: 1500,
					delayIndicator: false,
					sound: false,
					position: "center top"
					});
				$("#subtotal" + index).empty();
				$("#subtotal" + index).append((price * quantity).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "元");
				$("#send_qty" + index).val(quantity);
				return;
			}
		//使用者輸入的數量與舊數量相同
			if(newQty == quantity) {
				$("#subtotal" + index).empty();
				$("#subtotal" + index).append((price * quantity).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "元");
				$("#send_qty" + index).val(quantity);
				return;
			}
		//使用者輸入的數量超過庫存量
			if((amount - newQty) < 0) {
				Lobibox.notify("error", {
					size: 'mini',
					title: '庫存量不足！',
					delay: 1500,
					delayIndicator: false,
					sound: false,
					position: "center top"
					});
				$("#send_qty" + index).val(quantity);
				$("#subtotal" + index).empty();
				$("#subtotal" + index).append((price * quantity).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "元");
				return;
			}
		//使用者輸入非數字及0開頭的數字	
			var patt = /^[1-9][0-9]*$/;
			if(!patt.test(newQty)) {
				$("#send_qty" + index).val(quantity);
				$("#subtotal" + index).empty();
				$("#subtotal" + index).append((price * quantity).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "元");
				return;
			}
		//都通過才送到Servlet處理，如果成功就更改數量，發生例外回傳修改失敗訊息	
			$.ajax({
					"type":"post",
					"url":getContextPath()+'/free/updateOIProd',
					"data":{"pid" : key , "newQy" : newQty , "amount" : amount , "quantity" : quantity},
					"success":function(data){
						$("#send_qty" + index).attr("value",newQty);
						$("#send_qty" + index).val(newQty);
						$("#subtotal" + index).empty();
						$("#subtotal" + index).append((price * newQty).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "元");
						location.reload();
						return;
					},
					"error":function(data){
						Lobibox.notify("error", {
							size: 'mini',
							title: '修改失敗！',
							delay: 1500,
							delayIndicator: false,
							sound: false,
							position: "center top"
							});
						$("#send_qty" + index).val(quantity);
						$("#subtotal" + index).empty();
						$("#subtotal" + index).append((price * quantity).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "元");
						return;
					}
					
				})
		}
		
		//從購物車內把某商品刪掉
		function del(key) {
			Lobibox.confirm({
				title: "從購物車刪除商品",
				msg: "要刪除此項商品嗎？",
				callback: function ($this, type, ev) {
				    if(type == 'yes') {
				    	$.ajax({
							"type":"post",
							"url":getContextPath()+'/free/deleteOIProd',
							"data":{"pid" : key},
							"success":function(data){
								Lobibox.notify("success", {
									size: 'mini',
									title: '已刪除！',
									delay: 1000,
									delayIndicator: false,
									sound: false,
									position: "center top"
									});
								 window.setTimeout(function(){
									 window.location.reload();
									 }, 1500);
						       
							}
						})
				    } else {}
				}
				});
//			if(confirm("確定要刪除此項商品嗎？")) {
//				$.ajax({
//					"type":"post",
//					"url":getContextPath()+'/free/deleteOIProd',
//					"data":{"pid" : key},
//					"success":function(data){
//						Lobibox.notify("success", {
//							size: 'mini',
//							title: '已刪除！',
//							delay: 1000,
//							delayIndicator: false,
//							sound: false,
//							position: "center top"
//							});
//						 window.setTimeout(function(){
//							 window.location.reload();
//							 }, 1500);
//				       
//					}
//				})
//			}
		}
		
		
		$(function() {
			
			//繼續購物
			$('#continue').click(function(){
				window.location.href = getContextPath()+"/shopping/prod_list.jsp";
			})
			
			//確認無誤
			$('#confirm').click(function(){
				Lobibox.confirm({
					title: "即將前往結帳頁面",
					msg: "確認無誤？",
					callback: function ($this, type, ev) {
					    if(type == 'yes') {
					    	window.location.href = getContextPath()+'/shoppings/checkfordata';
					    } else {}
					}
				})
			})
			
			//放棄購物，請Servlet把ShoppingCart物件刪掉
			$('#abandon').click(function(){
				Lobibox.confirm({
					title: "放棄購物",
					msg: "要放棄購物嗎？",
					callback: function ($this, type, ev) {
					    if(type == 'yes') {
							$.ajax({
								"type":"post",
								"url":getContextPath()+'/free/abanShopping',
								"success":function(data){
									Lobibox.notify("success", {
										size: 'mini',
										title: '已放棄購物！',
										delay: 1500,
										delayIndicator: false,
										sound: false,
										position: "center top"
										});
//									alert("");
									window.location.href = getContextPath()+"/shopping/prod_list.jsp";
								}
							})
					    } else {}
					}
					});
//				if(confirm("要放棄購物嗎？")) {
//					$.ajax({
//						"type":"post",
//						"url":getContextPath()+'/free/abanShopping',
//						"success":function(data){
//							Lobibox.notify("success", {
//								size: 'mini',
//								title: '已放棄購物！',
//								delay: 1500,
//								delayIndicator: false,
//								sound: false,
//								position: "center top"
//								});
////							alert("");
//							window.location.href = getContextPath()+"/shopping/prod_list.jsp";
//						}
//					})
				
			})
		})