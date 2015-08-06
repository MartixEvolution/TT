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
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/jqwidgets/jqxcore.js"></script>
<script type="text/javascript" src="js/jqwidgets/jqxdata.js"></script>
<script type="text/javascript" src="js/jqwidgets/jqxbuttons.js"></script>
<script type="text/javascript" src="js/jqwidgets/jqxscrollbar.js"></script>
<script type="text/javascript" src="js/jqwidgets/jqxlistbox.js"></script>
<script type="text/javascript" src="js/jqwidgets/jqxdropdownlist.js"></script>
<script type="text/javascript" src="js/jqwidgets/jqxdatatable.js"></script>
<script type="text/javascript" src="js/jqwidgets/jqxpanel.js"></script>
<script type="text/javascript" src="js/jqwidgets/jqxradiobutton.js"></script>
<script type="text/javascript" src="js/jqwidgets/jqxinput.js"></script>
<script type="text/javascript" src="js/jqwidgets/jqxnotification.js"></script>
<script type="text/javascript" src="js/generatedata.js"></script>
<script type="text/javascript" src="js/demos.js"></script>


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
	<form id="searchForm" class="form-horizontal span24" name="form"
		method="post" action="bizlist_search" namespace="/">
		<div class="container">
			<div class="row">
				<div class="control-group span8">
					<label class="control-label">公司单号：</label>
					<div class="controls">
						<input id="orderno" name="orderno" type="text"
							class="input-normal control-text" />
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label">客户单号：</label>
					<div class="controls">
						<input id="clientno" name="clientno" type="text"
							class="input-normal control-text" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="control-group span8">
					<label class="control-label">发货日期：</label>
					<div id="range" class="controls bui-form-group"
						data-rules="{dateRange:true}">
						<input id="startdate" name="startdate" class="calendar"
							data-rules="{date:true}" type="text">
					</div>
				</div>
				<div class="span3 offset2">
					<button type="submit" id="btnSearch" class="button button-primary">搜索</button>
				</div>
			</div>
			<div class="search-grid-container">
				<div id="grid"></div>
			</div>
		</div>
	</form>
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
			<c:forEach items="${requestScope.lstBizlists }" var="Bizlist"
				varStatus="loop">
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
					<td><a href="bizlist_edit.action?bid=${Bizlist.bid}">编辑</a>
						<a href="bizlist_delete.action?bid=${Bizlist.bid}">删除</a>
					</td>

				</tr>
			</c:forEach>

		</table>
	</div>
	<!--  
	<script type="text/javascript">
            $("#myEditButton").bind('click',function(){
                var selection = $("#dataTable").jqxDataTable('getSelection');
                if(selection.length==0)
                {
                    alert("请先选择需要操作的行!");
                }else{
                   console.log(selection[0]);
                   window.location.href='admin/showAdminUserInfo?userName='+selection[0]['username'];
                }
            });
            $("#myDeleteButton").bind('click',function(){
                var selection = $("#dataTable").jqxDataTable('getSelection');
                if(selection.length==0)
                {
                    alert("请先选择需要操作的行!");
                }else{
                   var choice=confirm("您确定要删除此业务员吗?");
                   if(choice==true)
                   {
                  /*   window.location.href='deleteAdminUser?userName='+selection[0]['username'];*/
                     $.ajax({
                        url:"admin/deleteAdminUser",
                        data:{
                            userName:selection[0]['username']
                        },
                        dataType:'json',
                        success:function(data){
                            if(data.result=="success"){
                                alert("删除成功")
                                window.location.href='admin/adminUserList';
                            }
                            else{
                                alert("删除失败"); 
                            }
                        },
                        error:function(){
                            alert("加载失败！");
                        }
                     });
                   }
                }
            });
        });
    </script>    
    -->
<body>
</html>
