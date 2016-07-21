<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>

  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/highcharts.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/exporting.js"></script>
  
  
  <script>
  $(function () {
	  var year=[];	var month=[];	var name=[];//科
		var row=' '; 	var counts=[];//次
	    $.getJSON("${pageContext.request.contextPath}/Backstage/SpaToSalesServlet",{'action':'hotPorc'},function(data){		
	    	$.each(data, function(i, a){
	    		
	    			if($.inArray(a.year, year) === -1) year.push(a.year);
	     			if($.inArray(a.month, month) === -1) month.push(a.month);
	     			if($.inArray(a.name, name) === -1) name.push(a.name);
	     			counts.push(a.counts);
	    	});
	    	
	    	var newHTML = [];
	    	newHTML.push('<table border="1"  class="table table-hover"  ><tr><th>療程/月</th><th>'+month[0]+'月</th><th>'+month[1]+'月</th><th>'+month[2]+'月</th><th>'+month[3]+'月</th><th>'+month[4]+'月</th><th>'+month[5]+'月</th><th>'+month[6]+'月</th><th>'+month[7]+'月</th><th>'+month[8]+'月</th><th>'+month[9]+'月</th><th>'+month[10]+'月</th><th>'+month[11]+'月</th></tr>');
	    	newHTML.push('<tr><td>'+name[0]+'</td><td>'+counts[0]+'</td><td>'+counts[1]+'</td><td>'+counts[2]+'</td><td>'+counts[3]+'</td><td>'+counts[4]+'</td><td>'+counts[5]+'</td><td>'+counts[6]+'</td><td>'+counts[7]+'</td><td>'+counts[8]+'</td><td>'+counts[9]+'</td><td>'+counts[10]+'</td><td>'+counts[11]+'</td></tr>');
	    	newHTML.push('<tr><td>'+name[1]+'</td><td>'+counts[23]+'</td><td>'+counts[22]+'</td><td>'+counts[21]+'</td><td>'+counts[20]+'</td><td>'+counts[19]+'</td><td>'+counts[18]+'</td><td>'+counts[17]+'</td><td>'+counts[16]+'</td><td>'+counts[15]+'</td><td>'+counts[14]+'</td><td>'+counts[13]+'</td><td>'+counts[12]+'</td></tr>');
	    	newHTML.push('<tr><td>'+name[2]+'</td><td>'+counts[24]+'</td><td>'+counts[25]+'</td><td>'+counts[26]+'</td><td>'+counts[27]+'</td><td>'+counts[28]+'</td><td>'+counts[29]+'</td><td>'+counts[30]+'</td><td>'+counts[31]+'</td><td>'+counts[32]+'</td><td>'+counts[33]+'</td><td>'+counts[34]+'</td><td>'+counts[35]+'</td></tr>');
	    	newHTML.push('<tr><td>'+name[3]+'</td><td>'+counts[47]+'</td><td>'+counts[46]+'</td><td>'+counts[45]+'</td><td>'+counts[44]+'</td><td>'+counts[43]+'</td><td>'+counts[42]+'</td><td>'+counts[41]+'</td><td>'+counts[40]+'</td><td>'+counts[39]+'</td><td>'+counts[38]+'</td><td>'+counts[37]+'</td><td>'+counts[36]+'</td></tr></table>');
	    	$(".element").html(newHTML.join(""));
		
		//-----------來源: 雲端資料庫JSON-------------------------年度熱門療程預約比較圖---------------------------<font color="red" style="text-align: center;">熱銷產品</font>
	    $('#container').highcharts({
	        chart: {  type: 'column'  },
	        title: {  text: '熱門療程預約比較圖'  },
	        subtitle: {  text: '來源: 雲端資料庫JSON'  },
	        xAxis: {
	            categories: 
 	            	[ '1月', '2月', '3月', '4月', '5月', '6月', '7月',  '8月', '9月', '10月', '11月', '12月'  ]
	            	//month
	        },
	        yAxis: {
	            min: 0,
	            title: {  text: '銷量 ($)'  }
	        },
	        tooltip: {
	            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
	            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
	                '<td style="padding:0"><b>{point.y:.0f} 次</b></td></tr>',
	            footerFormat: '</table>',
	            shared: true,
	            useHTML: true
	        },
	        plotOptions: {
	            column: {  pointPadding: 0.2,  borderWidth: 0  }
	        },
	        series: [{
	            name: name[0],
	            data: 
// 	            	[49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]
	            	counts.slice(0,12)
	        }, {
	            name: name[1],
	            data: 
// 	            	[83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3]
	            	counts.slice(12,24).reverse()
	        }, {
	            name: name[2],
	            data: 
// 	            	[48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2]
	            	counts.slice(24,36)
	        }, {
	            name: name[3],
	            data: 
// 	            	[42.4, 33.2, 34.5, 39.7, 52.6, 75.5, 57.4, 60.4, 47.6, 39.1, 46.8, 51.1]
	            	counts.slice(36,48).reverse()
	        }]
	    });
	    })// $.getJSON line:13
	});//$(function () line:10
  </script>
</head>
<body>

  <div id="container" style="min-width:700px;height:400px"></div>
  
</body>
</html>