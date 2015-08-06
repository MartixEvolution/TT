<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>资源文件结构</title>
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
    <form id="J_Form"  class="form-horizontal span24"  name="form" method="post" action="bizlist_add" namespace="/">
	<div class="container">
		<div class="row">
		
				<div class="row">
					<div class="control-group span8">
						<label class="control-label"><s>*</s>公司单号：</label>
						<div class="controls">
							<input id="orderno" name="orderno" type="text" data-rules="{required:true}"
								class="input-normal control-text"/>
						</div>
					</div>
				
					<div class="control-group span8">					
						<label class="control-label"><s>*</s>客户公司名称：</label>
						<div class="controls">
							<select data-rules="{required:true}" name="type"
								class="input-normal" id="companyname">
								<option value="">请选择</option>
								  <option value="saler">淘宝卖家</option>
								  <option value="large">大厂直供</option>
							</select>
						</div>
					</div>	
					<!--  				
					<label class="control-label"><s>*</s>客户公司名称：</label>
						<div class="controls">
						<!--  
							<input id="companyname" name="companyname" type="text" data-rules="{required:true}"
								class="input-normal control-text"/>
								
						<select data-rules="{required:true}" name="type"
								class="input-normal"  id="companyname" name="companyname" list="#request.lstCompanys" listKey="cid" listValue="cname"></select>	
						</div>
						-->
				</div>
				<div class="row">
					<div class="control-group span8">
						<label class="control-label">客户单号：</label>
						<div class="controls">
							<input id="clientno" name="clientno" type="text"
								class="input-normal control-text"/>
						</div>
					</div>
					<div class="control-group span8">
						<label class="control-label"><s>*</s>发货日期：</label>
						<div id="range" class="controls bui-form-group"
							data-rules="{dateRange:true}">
							<input id="startdate" name="startdate" class="calendar"
								data-rules="{required:true}" type="text">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="control-group span8">
						<label class="control-label">件数：</label>
						<div class="controls">
							<input id="number" name="number" type="text"
								class="input-normal control-text">
						</div>
					</div>
					<div class="control-group span8">
						<label class="control-label">数量：</label>
						<div class="controls">
							<input id="quantity" name="quantity" type="text"
								class="input-normal control-text">
						</div>
					</div>

				</div>
				<div class="row">

					<div class="control-group span8">
						<label class="control-label">单位：</label>
						<div class="controls">
							<input id="unit"  name="unit" type="text" class="input-normal control-text">
						</div>
					</div>
					<div class="control-group span8">
						<label class="control-label">渠道：</label>
						<div class="controls">
							<input id="channel" name="channel" type="text"
								class="input-normal control-text">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="control-group span8">
						<label class="control-label">始发地：</label>
						<div class="controls">
							<input id="startlocation" name="startlocation" type="text"
								class="input-normal control-text">
						</div>
					</div>
					<div class="control-group span8">
						<label class="control-label">收货单位：</label>
						<div class="controls">
							<input id="endcompany" name="endcompany" type="text"
								class="input-normal control-text">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="control-group span8">
						<label class="control-label">收货人：</label>
						<div class="controls">
							<input id="receiver"  name="receiver" type="text"
								class="input-normal control-text">
						</div>
					</div>
					<div class="control-group span8">
						<label class="control-label">收货地址：</label>
						<div class="controls">
							<input id="endlocation" name="endlocation" type="text"
								class="input-normal control-text">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="control-group span8">
						<label class="control-label">收货电话：</label>
						<div class="controls">
							<input  id="telephone" name="telephone" type="text"
								class="input-normal control-text">
						</div>
					</div>
					<div class="control-group span8">
						<label class="control-label">运费总额</label>
						<div class="controls">
							<input id="totalfee" name="totalfee" type="text"
								class="input-normal control-text">
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
