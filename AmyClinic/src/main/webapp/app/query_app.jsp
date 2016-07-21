<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="group3.carrie.app.model.*"%>
<%@ page import="group3.henry.login.model.*"%>

<%
	MemberVO mb = (MemberVO)session.getAttribute("memberVO");
	AppService appServ = new AppService();
	List<AppVO> appVOs = appServ.findByMid_AF(mb.getMid());
	pageContext.setAttribute("appVOs",appVOs);
%>
<%
	String today =String.format("%tF%n",new java.util.Date());
	pageContext.setAttribute("currentTime", today);
%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/lobibox.min.css">

    <table>
		<tr id="t1t2-wrapper">
			<td id="t1">
			    <a id="a1" href="#">預約查詢/取消</a>
				<input type="hidden" id="action1" value="after">
			</td>
			<td id="t2">
			   <a id="a2" href="#">歷史預約紀錄</a> 
			   <input type="hidden" id="action2" value="before">
			</td>
		</tr>
	</table>
	<div>
	   <table id="app">
	      <tr>
		     <th>日期</th>
		     <th>時段</th>
	      	 <th>預約目的</th>
             <th>療程項目</th>
		     <th>醫師</th>
		     <th>取消預約</th>
		  </tr>
    	  <c:forEach var="appVO" varStatus="sta" items="${appVOs}">
		  <c:if test="${appVO.apt_status == 1}">
		  <tr>
		  <td>${appVO.apt_date}(<span class='adate'><fmt:formatDate pattern="E" type="date" value="${appVO.apt_date}"/></span>)</td>
							<td>${appVO.apt_time}</td>
							<c:if test="${appVO.purpose == 0}">
								<td>開始新療程</td>
								<td>
								<c:forEach var="proc" varStatus="status" items="${appVO.appDetails}">
									<c:if test="${!status.last}">
										${proc.procVO.name}、
									</c:if>
										<c:if test="${status.last}">
										${proc.procVO.name}
									</c:if>
									</c:forEach></td>
							</c:if>
							<c:if test="${appVO.purpose == 1}">
								<td>回診</td>
								<td width="150px"></td>
							</c:if>
                            <td>${ appVO.employeeVO.name }</td>
							<td><input type="button" id="cancelApp" value="取消預約" onclick="cancel(${appVO.aid})">
							<input type="hidden" id="action3" value="cancel"></td>						
						</tr>
						<tr class="app-rq">
						  <td>需求描述</td>
						  <td colspan="5">${appVO.descrip}</td>
						</tr>
					</c:if>
			 </c:forEach>
		    </table>
			</div>
	
	<script src="${pageContext.request.contextPath}/js/lobibox.min.js"></script>
	<script>
	function getContextPath() { //obtains context path. EL doesn't work with separated .js
   	 	return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
	 }

	function cancel(id) {
		Lobibox.confirm({
			title: "取消預約",
			msg: "確定取消預約？",
			callback: function ($this, type, ev) {
			    if(type == 'yes') {
					var tb = $('#app');
					var tr2;
					var tr3;
					$.ajax({
						"type":"get",
						"url":getContextPath()+"/apps/cancelapp",
						"dataType":"JSON",
						"data":{"id" : id},
						"success" : function (datas) {
							tb.empty();
							var th1 = $('<th></th>').append('日期');
							var th2 = $('<th></th>').append('時段');
							var th3 = $('<th></th>').append('預約目的');
							var th4 = $('<th></th>').append('療程項目');
							var th5 = $('<th></th>').append('醫師');
							var th6 = $('<th></th>').append('取消預約');
							var tr1 = $('<tr></tr>').append([th1,th2,th3,th4,th5,th6]);
// 							var tr1 = $('<tr></tr>').append([th1,th2,th3,th4,th6]);
							tb.append(tr1);
							$.each(datas,function(i,data){
								if(data.apt_status == 1) {
									var td1 = $('<td></td>').append(data.apt_date);
									var td2 = $('<td></td>').append(data.apt_time);
									if (data.purpose == 0) {
										var td3 = $('<td></td>').append('開始新療程');
										//用Array.join("分隔符號")可在陣列的每個元素中間加分隔符號，預設為逗點
										var td4 = $('<td width="150px"></td>').append(data.procName.join("、"));
									}
									if (data.purpose == 1) {
										var td3 = $('<td></td>').append('回診');
										var td4 = $('<td width="150px"></td>').append();
									}
									
									var td5 = $('<td></td>').append(data.ename);
									var td6 = $('<td></td>').append('<input type="button" id="cancelApp" value="取消預約" onclick="cancel('+data.aid+')">');
// 									tr2 = $('<tr></tr>').append([td1,td2,td3,td4,td6])
									tr2 = $('<tr></tr>').append([td1,td2,td3,td4,td5,td6])
                                    var td01 = $('<td></td>').append('需求描述')
									var td02 = $(' <td colspan="5"></td>').append(data.descrip)
                                    tr3 = $('<tr class="app-rq"></tr>').append([td01,td02])
									tb.append(tr2);
									tb.append(tr3);
								}
							})
						},
						"error" : function (datas) {
							Lobibox.notify("error", {
								size: 'mini',
								title: '無法取消預約！',
								delay: 1500,
								delayIndicator: false,
								sound: false,
								position: "center top"
								});
						}
					})
			    }
			}
			});
}
	$(function() {
		var t1 = $('#t1');
		var t2 = $('#t2');
		var tb = $('#app');
		t2.addClass("class1");
		$('#a1').click(function(){
			tb.empty();
			var tr2;
			var tr3;
			t1.removeClass();
			t2.addClass("class1");
			$.ajax({
				"type":"get",
				"url":getContextPath()+"/apps/queryafter",
				"dataType":"JSON",
				"success" : function (datas) {
					var th1 = $('<th></th>').append('日期');
					var th2 = $('<th></th>').append('時段');
					var th3 = $('<th></th>').append('預約目的');
					var th4 = $('<th></th>').append('療程項目');
					var th5 = $('<th></th>').append('醫師');
					var th6 = $('<th></th>').append('取消預約');
					var tr1 = $('<tr></tr>').append([th1,th2,th3,th4,th5,th6]);
// 					var tr1 = $('<tr></tr>').append([th1,th2,th3,th4,th6]);
					tb.append(tr1);
					$.each(datas,function(i,data){
						if(data.apt_status == 1) {
							var weekdays = "日,一,二,三,四,五,六".split(",");
							var td1 = $('<td></td>').append(data.apt_date+'('+ weekdays[new Date(data.apt_date).getDay()]+')');
							var td2 = $('<td></td>').append(data.apt_time);
							if (data.purpose == 0) {
								var td3 = $('<td width="100px"></td>').append('開始新療程');
								//用Array.join("分隔符號")可在陣列的每個元素中間加分隔符號，預設為逗點
								var td4 = $('<td width="150px"></td>').append(data.procName.join("、"));
							}
							if (data.purpose == 1) {
								var td3 = $('<td width="100px"></td>').append('回診');
								var td4 = $('<td width="150px"></td>').append();
							}
							var td5 = $('<td></td>').append(data.ename);
							var td6 = $('<td></td>').append('<input type="button" id="cancelApp" value="取消預約" onclick="cancel('+data.aid+')">');
							tr2 = $('<tr></tr>').append([td1,td2,td3,td4,td5,td6])
// 							tr2 = $('<tr></tr>').append([td1,td2,td3,td4,td6])
							var td01 = $('<td></td>').append('需求描述')
                            var td02 = $(' <td colspan="5"></td>').append(data.descrip)
                            tr3 = $('<tr class="app-rq"></tr>').append([td01,td02])
							tb.append(tr2);
							tb.append(tr3);
						}
					})
					
				}
			})
		})
			

			
			$('#a2').click(function(){
				var action = $('#action2').val();
				var tr2;
				var tr3;
				tb.empty();
				t2.removeClass();
				t1.addClass("class1");
				$.ajax({
					"type":"get",
					"url":getContextPath()+"/apps/querybefore",
					"dataType":"JSON",
					"success" : function (datas) {
							var th1 = $('<th></th>').append('日期');
							var th2 = $('<th></th>').append('時段');
							var th3 = $('<th></th>').append('預約目的');
							var th4 = $('<th></th>').append('療程項目');
// 							var th5 = $('<th></th>').append('需求描述');
							var th6 = $('<th></th>').append('醫師');
							var th7 = $('<th></th>').append('參予評分');
// 							var tr1 = $('<tr></tr>').append([th1,th2,th3,th4,th5,th6,th7]);
							var tr1 = $('<tr></tr>').append([th1,th2,th3,th4,th6,th7]);
							tb.append(tr1);
							$.each(datas,function(i,data){
								if(data.apt_status == 1) {
									var weekdays = "日,一,二,三,四,五,六".split(",");
									var td1 = $('<td></td>').append(data.apt_date+'('+ weekdays[new Date(data.apt_date).getDay()]+')');
									var td2 = $('<td></td>').append(data.apt_time);
									if (data.purpose == 0) {
										var td3 = $('<td width="100px"></td>').append('開始新療程');
										var td4 = $('<td width="150px"></td>').append(data.procName.join("、"));
									}
									if (data.purpose == 1) {
										var td3 = $('<td width="100px"></td>').append('回診');
										var td4 = $('<td width="150px"></td>').append();
									}
// 									var td5 = $('<td width="300px"></td>').append(data.descrip);
									var td6 = $('<td></td>').append(data.ename);
// 									tr2 = $('<tr id='+i+'>< /tr>').append([td1,td2,td3,td4,td5,td6])
									tr2 = $('<tr id='+i+'>< /tr>').append([td1,td2,td3,td4,td6])
									var td01 = $('<td></td>').append('需求描述')
		                            var td02 = $(' <td colspan="5"></td>').append(data.descrip)
		                            tr3 = $('<tr class="app-rq"></tr>').append([td01,td02])
		                            tb.append(tr2);
		                            tb.append(tr3);
								}
							})
					}
				}).done(function(){
					$.getJSON('../Score/ScoreServlet',{'action':'add_score'},function(data){
						
						$.each(data,function(i,emp){
							if(emp.ok==true){
								var cell1 = $("<td ></td>").html("<form action='../Score/ScoreServlet' method='post'><input type='submit' value='撰寫評論'><input type='hidden' name='action' value='gotoAddScore'><input type='hidden' name='aid' value='"+emp.aid+"'><input type='hidden' name='eid' value='"+emp.eid+"'></form>")
							} else {
								var cell1 = $("<td ></td>").html("<form action='../Score/ScoreServlet' method='post'><input type='submit' value='修改評論'><input type='hidden' name='action' value='gotoAdjustScore'><input type='hidden' name='aid' value='"+emp.aid+"'></form>")
							}
							$('#'+i+'').append(cell1);
						})
					})
				   })
			})
			//把fmt標籤產生的"星期"兩個字去掉
			$('.adate').each(function() {
				$(this).text($(this).text().substring(2));
			})
		})
	</script>
