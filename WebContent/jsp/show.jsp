<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>colResizable demo</title>  

  <link rel="stylesheet" type="text/css" href="../css/main_show.css" />  
  <script  src="../js/jquery.js"></script>
  <script  src="../js/colResizable-1.3.min.js"></script>
  <script type="text/javascript">
	$(function(){	

		var onSampleResized = function(e){
			var columns = $(e.currentTarget).find("th");
			var msg = "columns widths: ";
			columns.each(function(){ msg += $(this).width() + "px; "; })
			$("#sample2Txt").html(msg);
			
		};	
	
		$("#sample2").colResizable({
			liveDrag:true, 
			gripInnerHtml:"<div class='grip'></div>", 
			draggingClass:"dragging", 
			onResize:onSampleResized});
		
	});	
  </script>
  
</head>
<body>


	<div class="center" >
	
		 <br/><br/>
						
		 <table id="sample2" width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<th>header</th><th>header</th><th>header</th><th>header</th><th>header</th><th>header</th><th>header</th><th>header</th><th>header</th><th>header</th><th>header</th><th>header</th><th>header</th><th>header</th>
			</tr>
			<tr>
				<td class="controls">公司单号</td>
			<td>客户公司名称</td>
			<td>客户单号</td>
			<td>发货日期</td>			
			<td>件数</td>
			<td>数量</td>
			<td>单位</td>
			<td>渠道</td>
			<td>始发地</td>
			<td>收货单位</td>
			<td>收货人</td>
			<td>收货地址</td>
			<td>收货电话</td>
			<td>运费总额</td>
			</tr>
				<c:forEach items="${requestScope.lstBizlists }" var="Bizlist" varStatus="loop">     
		<tr>
			<td>${Bizlist.orderno }</td>
			<td>${Bizlist.companyname}</td>
			<td>${Bizlist.clientno }</td>			
			<td>${Bizlist.startdate}</td>
			<td>${Bizlist.number}</td>
			<td>${Bizlist.quantity }</td>
			<td>${Bizlist.unit }</td>
			<td>${Bizlist.channel}</td>			
			<td>${Bizlist.startlocation }</td>
			<td>${Bizlist.endcompany }</td>
			<td>${Bizlist.receiver }</td>
			<td>${Bizlist.endlocation }</td>
			<td>${Bizlist.telephone }</td>
			<td>${Bizlist.totalfee }</td>
		</tr>
		</c:forEach>
																				
		</table>
		
		<br/>
		
		<div class="sampleText">
			<label id="sample2Txt">Drag the columns to start</label>				
		</div>
		
		<br/><br/>

	</div>	
		

	
		
 </body>
 </html>
