<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>现金账表录入</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
<link href="../assets/css/bui-min.css" rel="stylesheet" type="text/css" />
<link href="../assets/css/page-min.css" rel="stylesheet" type="text/css" />
<link href="../assets/css/prettify.css" rel="stylesheet" type="text/css" />
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
	<form  id="J_Form" class="form-horizontal span24" method="post" action="dailybill_add" namespace="/">
		<div class="container">
			<div class="row">
					<div class="row">
						<div class="control-group span8">
							<label class="control-label"><s>*</s>日期：</label>
							<div id="range" class="controls bui-form-group"
								data-rules="{dateRange:true}">
								<input id="ddate" name="ddate" class="calendar"
									data-rules="{required:true}" type="text">
							</div>
						</div>
						<div class="control-group span8">
							<label class="control-label">收支情况：</label>
							<div class="controls">
								<input id="dszqk" name="dszqk" type="text"
									class="input-normal control-text" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="control-group span8">
							<label class="control-label">付款单位：</label>
							<div class="controls">
								<input id="dfkzw" name="dfkzw" type="text"
									class="input-normal control-text">
							</div>
						</div>
						<div class="control-group span8">
							<label class="control-label">单号：</label>
							<div class="controls">
								<input id="dorder" name="dorder" type="text"
									class="input-normal control-text">
							</div>
						</div>

					</div>
					<div class="row">
						<div class="control-group span15">
							<label class="control-label">事由：</label>
							<div class="controls control-row4">
								<input name="dreason" class="input-large" id="dreason"
									data-tip="{text:'请填写事由信息！'}" type="text"></textarea>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="control-group span8">
							<label class="control-label">金额：</label>
							<div class="controls">
								<input id="damount" name="damount" type="text"
									class="input-normal control-text">
							</div>
						</div>
						<div class="control-group span8">
							<label class="control-label">油卡：</label>
							<div class="controls">
								<input id="dcard" name="dcard" type="text"
									class="input-normal control-text">
							</div>
						</div>
					</div>

					<div class="row">						
						<div class="control-group span8">
							<label class="control-label">付款方式：</label>
							<div class="controls">
								<input id="dpayment" name="dpayment" type="text"
									class="input-normal control-text">
							</div>
						</div>
						<div class="control-group span8">
							<label class="control-label">经手人：</label>
							<div class="controls">
								<input id="dbroker" name="dbroker" type="text"
									class="input-normal control-text">
							</div>
						</div>
					</div>					
					<div class="row">
						<div class="control-group span15">
							<label class="control-label">备注：</label>
							<div class="controls control-row4">
								<input name="dremarks" class="input-large" id="dremarks"
									data-tip="{text:'请填写备注信息！'}" type="text"></textarea>
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
		</div>
	</form>
	<script type="text/javascript" src="../assets/js/jquery-1.8.1.min.js"></script>
	<script type="text/javascript" src="../assets/js/bui-min.js"></script>

	<script type="text/javascript" src="../assets/js/config-min.js"></script>
	<script type="text/javascript">
		BUI.use('common/page');
	</script>
	<!-- 仅仅为了显示代码使用，不要在项目中引入使用-->
	<script type="text/javascript" src="../assets/js/prettify.js"></script>
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
