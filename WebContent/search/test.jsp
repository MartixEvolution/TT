<%@ page language="java" contentType="text/html; charset=gbk"
	pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>简单表单页</title>
<!-- 此文件为了显示Demo样式，项目中不需要引入 -->
<link href="../../assets/code/demo.css" rel="stylesheet">
 
  <link href="http://g.alicdn.com/bui/bui/1.1.19/css/bs3/dpl.css" rel="stylesheet">
  <link href="http://g.alicdn.com/bui/bui/1.1.19/css/bs3/bui.css" rel="stylesheet">
 
</head>
<body>
  <div class="demo-content">
  <table cellspacing="0" class="table table-bordered">
		<tr>
			<td class="controls">客户id</td>
			<td>客户名称</td>
		
			
		</tr>
		<s:iterator value="#request.lstCompanys" status="company" id="item">     
		<tr>
			<td><s:property value="cid" /></td>
			<td><s:property value="cname" /></td>
			
		</tr>
		</s:iterator> 
	</table>
  </div>
</body>
</html>       
