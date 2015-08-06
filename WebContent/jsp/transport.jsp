<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>资源文件结构</title>
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
       <form id="J_Form"  name="form" method="post" action="transport_add" namespace="/">
	<div class="container">
		<div class="row">
			<form id="J_Form" class="form-horizontal span24" >
				<div class="row">
					<div class="control-group span8">
						<label class="control-label">专线单号：</label>
						<div class="controls">
							<input id="tno" name="tno" type="text" 							class="input-normal control-text"/>
						</div>
					</div>
					<!--companyname-->
					<div class="control-group span8">
						<label class="control-label">专线名称：</label>
						<div class="controls">
							<input id="tname" name="tname" type="text" 
								class="input-normal control-text"/>
						</div>
					</div>					
					
				</div>
				<div class="row">
					<div class="control-group span8">
						<label class="control-label">专线地址：</label>
						<div class="controls">
							<input id="taddr" name="taddr" type="text"
								class="input-normal control-text"/>
						</div>
					</div>
					<div class="control-group span8">
						<label class="control-label">联系人</label>
						<div id="range" class="controls bui-form-group"	>	
							<input id="tlxt" name="tlxt" class="input-normal control-text" type="text">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="control-group span8">
						<label class="control-label">联系电话：</label>
						<div class="controls">
							<input id="tlxdh" name="tlxdh" type="text"
								class="input-normal control-text">
						</div>
					</div>
					<div class="control-group span8">
						<label class="control-label">查货电话：</label>
						<div class="controls">
							<input id="tchdh" name="tchdh" type="text"
								class="input-normal control-text">
						</div>
					</div>

				</div>
				<div class="row">

					<div class="control-group span8">
						<label class="control-label">单价：</label>
						<div class="controls">
							<input id="tprice"  name="tprice" type="text" class="input-normal control-text"  data-rules="{number:true}">
						</div>
					</div>
					<div class="control-group span8">
						<label class="control-label">专线费：</label>
						<div class="controls">
							<input id="tzxf" name="tzxf" type="text"
								class="input-normal control-text"  data-rules="{number:true}">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="control-group span8">
						<label class="control-label">送货费：</label>
						<div class="controls">
							<input id="tshf" name="tshf" type="text"
								class="input-normal control-text"  data-rules="{number:true}">
						</div>
					</div>
					<div class="control-group span8">
						<label class="control-label">提货费：</label>
						<div class="controls">
							<input id="tthf" name="tthf" type="text"
								class="input-normal control-text"  data-rules="{number:true}">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="control-group span8">
						<label class="control-label">提货车号：</label>
						<div class="controls">
							<input id="tthch"  name="tthch" type="text"
								class="input-normal control-text">
						</div>
					</div>
					<div class="control-group span8">
						<label class="control-label">提货人：</label>
						<div class="controls">
							<input id="tthr" name="tthr" type="text"
								class="input-normal control-text">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="control-group span8">
						<label class="control-label">司机电话：</label>
						<div class="controls">
							<input  id="tsjdh" name="tsjdh" type="text"
								class="input-normal control-text">
						</div>
					</div>
					<div class="control-group span8">
						<label class="control-label">提货成本</label>
						<div class="controls">
							<input id="tthcb" name="tthcb" type="text"
								class="input-normal control-text"  data-rules="{number:true}">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="control-group span8">
						<label class="control-label">公司单号：</label>
						<div class="controls">
							<input  id="tgsdh" name="tgsdh" type="text"
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
			</form>
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
