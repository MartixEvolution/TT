<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>货物跟踪信息录入</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
<link href="assets/css/bui-min.css" rel="stylesheet" type="text/css" />
<link href="assets/css/page-min.css" rel="stylesheet" type="text/css" />
<link href="assets/css/prettify.css" rel="stylesheet" type="text/css" />
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
	<form id="J_Form" class="form-horizontal span24" method="post"
		action="track_add" namespace="/">
		<div class="container">
			<div class="row">
				<div class="control-group span8">
					<label class="control-label"><s>*</s>公司单号：</label>
					<div class="controls">
						<select data-rules="{required:true}" class="input-normal"
							id="orderno" name="orderno">
							<option value="">请选择</option>
							<c:forEach items="${requestScope.lstOrders }" var="Order">
								<option value="${Order.orderno}" name="orderno">${Order.orderno}</option>
							</c:forEach>

						</select>
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label"><s>*</s>日期：</label>
					<div id="range" class="controls bui-form-group"
						data-rules="{dateRange:true}">
						<input id="gdate" name="gdate" class="calendar calendar-time"
							data-rules="{required:true}" type="text">
					</div>
				</div>
			</div>


			<div class="row">
				<div class="control-group span8">
					<label class="control-label">货物所处位置：</label>
					<div class="controls">
						<input id="glocation" name="glocation" type="text"
							class="input-normal control-text" />
					</div>
				</div>

				<div class="control-group span8">
					<label class="control-label"><s>*</s>运送状态：</label>
					<div class="controls">
						<select data-rules="{required:true}" name="gno"
							class="input-normal" id="gno">
							<option value="">请选择</option>
							<option value="已发货">已发货</option>
							<option value="在途中">在途中</option>
							<option value="配送中">配送中</option>
							<option value="配送中">已签收</option>
						</select>
					</div>
				</div>
			</div>
			<div class="row form-actions actions-bar">
				<div class="span13 offset3 ">
					<button type="submit" class="button button-primary">保存</button>
					<button type="reset" class="button">重置</button>
				</div>
			</div>



		</div>
	</form>
	<script type="text/javascript" src="assets/js/jquery-1.8.1.min.js"></script>
	<script type="text/javascript" src="assets/js/bui-min.js"></script>

	<script type="text/javascript" src="assets/js/config-min.js"></script>
	<script type="text/javascript">
		BUI.use('common/page');
	</script>
	<script type="text/javascript">
		$(function() {
			prettyPrint();
		});
	</script>
	<script type="text/javascript">
		BUI.use('bui/form', function(Form) {
			var form = new Form.HForm({
				srcNode : '#J_Form'
			});

			form.render();
		});
	</script>
<body>
</html>
