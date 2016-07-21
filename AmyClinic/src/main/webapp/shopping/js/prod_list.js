var ResultSet;
var PAGESIZE = 5;

function getContextPath() { //obtains context path. EL doesn't work with separated .js
	 	return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
 }

function queryProdById(index) {
	$('#body').empty();  $('#Pagination').empty();
	$('#description').html('當前類別：').append(event.path[0].innerText||'美容');
	$.getJSON(getContextPath()+'/free/queryprodbycata', {"cid" : index}, function(datas) {callback(datas);})
}
function queryProdByName() {
	$('#body').empty();  $('#Pagination').empty();
	if($('#query').val()!='') {
		$('#description').html('您查詢的是：' +$('#query').val());
	}	
	$.getJSON(getContextPath()+'/free/queryprodbyname',{"prodname" : $('#query').val()},function(datas) {callback(datas);});
}
function addToCart(pid,pname,price,discount){
	$.ajax({
		"type":"post",
		"url":getContextPath()+'/free/jointocart',
		"data":{"pid" : pid, "pname" : pname, "price" : price, "discount" : discount, "qty" : 1},
		"success":function(data){
			Lobibox.notify("success", {
				size: 'mini',
				title: '成功加入購物車！',
				delay: 1500,
				delayIndicator: false,
				sound: false,
				position: "center top"
				});
		},
		"error":function(data){
			Lobibox.notify("error", {
				size: 'mini',
				title: '加入購物車失敗！',
				delay: 1500,
				delayIndicator: false,
				sound: false,
				position: "center top"
				});
		},
	});
}		
function callback(datas) {
	if(datas.length==0) {
		Lobibox.notify("error", {
			size: 'mini',
			title: '查無資料',
			delay: 1500,
			delayIndicator: false,
			sound: false,
			position: "center top"
			});
		window.setTimeout(function(){
			 window.location.reload();
			 }, 1500);					
	}
	var page = 1;
	for(var i=0;i<datas.length;i+=PAGESIZE) {			
		$('#Pagination').append('<a href="#" onclick=paginated()>'+page++ +'</a>&nbsp;');
	}
	ResultSet = datas;
	$.each(datas, function(i, data) {
		
		var tt = Math.round(data.price * (1 - (data.discount/100.0)));
		var maxPos = 30;
		if (data.descrip.length > maxPos)
		{
			data.descrip = data.descrip.substring(0, maxPos).concat('...');
		}
		var li = $('<li></li>');
			li.append('<a class="cbp-vm-image"><img src="'+getContextPath()+'/free/getprodpic?num='+data.pid+'"/></a>') 
		      .append('<h3 class="cbp-vm-title"><a href="'+getContextPath()+'/free/showprod?pid=' + data.pid + '">' + data.name + '</a></h3>')
		      .append('<div class="cbp-vm-details">'+data.descrip+'</div>')
		if (data.discount != 0) {
			li.append('<div class="cbp-vm-price"><strong style="color:red;">優惠價: </strong>'+ tt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + '元</div>');
		} else {
			li.append('<div class="cbp-vm-price">'+data.price.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + '元</div>');
		}
		if (data.amount != 0) {
		   	  li.append('<span class="cbp-vm-icon cbp-vm-add" onclick="addToCart('+data.pid+',\''+data.name+'\','+data.price+','+data.discount+')">加入購物車</span>');
		} else {
			li.append('<b>存貨不足</b>');
		}
		$('#body').append(li);
		if(i == PAGESIZE-1){						
			return !1;
		}
	})
}
function paginated() {
	$('#body').empty();
	var index = PAGESIZE*(event.target.text-1);
	for(var i=index, max=ResultSet.length; i<max && i<index+PAGESIZE ;i++){
		var tt = Math.round(ResultSet[i].price * (1 - (ResultSet[i].discount/100.0)));
		var li = $('<li></li>');
		var maxPos = 30;
		if (ResultSet[i].descrip.length > maxPos)
		{
			ResultSet[i].descrip = ResultSet[i].descrip.substring(0, maxPos).concat('...');
		}
		li.append('<a class="cbp-vm-image"><img src="'+getContextPath()+'/free/getprodpic?num='+ResultSet[i].pid+'"/></a>') 
		  .append('<h3 class="cbp-vm-title"><a href="'+getContextPath()+'/free/showprod?pid=' + ResultSet[i].pid + '">' + ResultSet[i].name + '</a></h3>')
	      .append('<div class="cbp-vm-details">'+ResultSet[i].descrip+'</div>')
	    if (ResultSet[i].discount != 0) {
	    	li.append('<div class="cbp-vm-price"><strong style="color:red;">優惠價: </strong>'+ tt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + '元</div>');
	    } else {
	    	li.append('<div class="cbp-vm-price">'+ResultSet[i].price.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + '元</div>');
	    }
		if (ResultSet[i].amount != 0) {
			li.append('<span class="cbp-vm-icon cbp-vm-add" onclick="addToCart('+ResultSet[i].pid+',\''+ResultSet[i].name+'\','+ResultSet[i].price+','+ResultSet[i].discount+')">加入購物車</span>');
		} else {
			li.append('<b>存貨不足</b>');
		}
		$('#body').append(li);
	}
}