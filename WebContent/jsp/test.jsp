<%@ page language="java" contentType="text/html; charset=gbk"
	pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>搜索表单</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
<link href="assets/css/bui-min.css" rel="stylesheet" type="text/css" />
<link href="assets/css/page-min.css" rel="stylesheet" type="text/css" />
<link href="assets/css/prettify.css" rel="stylesheet" type="text/css" />
<link href="assets/css/bs3/dpl.css" rel="stylesheet" type="text/css" />
<link href="assets/css/bs3//bui.css" rel="stylesheet">


<link href="css/bs3/dpl.css" rel="stylesheet">
<link href="css/bs3/bui.css" rel="stylesheet">
<style type="text/css">
code {
	padding: 0px 4px;
	color: #d14;
	background-color: #f7f7f9;
	border: 1px solid #e1e1e8;
}
</style>
</head>
<body>
	
	<script type="text/javascript" src="assets/js/jquery-1.8.1.min.js"></script>
	<script type="text/javascript" src="assets/js/config-min.js"></script>
	<script type="text/javascript">
		BUI.use('common/page');
	</script>

	<script type="text/javascript">
		$(function() {
			prettyPrint();
		});
	</script>
	<c:if  test="${requestScope.lstBizlists==null}">
	   alert("查询内容为空");
	</c:if>
	<c:if  test="${requestScope.lstBizlists!=null}">
	
	<div class="demo-content">
		<table cellspacing="0" class="table table-bordered">
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
				<td>操作</td>

			</tr>
			<!-- 
					<td>${Bizlist.orderno }</td>
					 -->
			<c:forEach items="${requestScope.lstBizlists }" var="Bizlist"	varStatus="loop">
				<tr>
				
					 <td>运费orderno</td>
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
					<td>编辑 删除</td>

				</tr>
			</c:forEach>

		</table>
	</div>
	</c:if>
	
	
<body>
</html>
