<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
 <head>
  <title> 搜索表单</title>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
       <link href="../assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/bui-min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/page-min.css" rel="stylesheet" type="text/css" />   <!-- 下面的样式，仅是为了显示代码，而不应该在项目中使用-->
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
  
  <div class="container">
    <div class="row">
      <div class="span24">
        <h2>简介</h2>
        <p>搜索页包含以下元素：</p>
        <ol>
          <li>表单：简单的表单请<a class="page-action" data-id="valid" data-mid="form" href="#">参看表单模块</a>，<a href="http://http://www.builive.com//form/index.php" target="_blank">更多内容</a></li>
          <li>Grid表格：Grid表格功能非常多，详细内容请参看<a href="http://http://www.builive.com//demo/index.php" target="_blank">控件Demo中</a>的，<a href="http://http://www.builive.com//demo/grid-local.php" target="_blank">表格</a>、<a href="http://http://www.builive.com//demo/grid-remote.php" target="_blank">表格分页</a>和<a href="http://http://www.builive.com//demo/grid-plugin.php" target="_blank">表格扩展</a></li>
        </ol>
      </div>
    </div>
    <div class="row">
      <div class="span16">
        <h2>表单</h2>
        <p>在搜索页中的表单一般比较简单，使用的功能包括：</p>
        <ol>
          <li>验证信息</li>
          <li>提示信息</li>
          <li>展开收缩查询项</li>
          <li>导出文件</li>
        </ol>
      </div>
    </div>
    <div class="row">
      <div class="span16">
        <h2>表格</h2>
        <p>在搜索页中需要的表格功能比较多：</p>
        <ol>
          <li>表格分页</li>
          <li>表格宽度自适应</li>
          <li>表格高度自适应</li>
          <li>表头跟随页面滚动</li>
          <li>表格命令栏</li>
          <li>自定义显示列，本地存储列信息</li>
          <li>跟标签联动</li>
          <li>表格内部打开页面</li>
          <li>操作表格数据，增删改</li>
        </ol>
      </div>
    </div>
  </div>
  <script type="text/javascript" src="../assets/js/jquery-1.8.1.min.js"></script>
  <script type="text/javascript" src="../assets/js/bui-min.js"></script>

  <script type="text/javascript" src="../assets/js/config-min.js"></script>
  <script type="text/javascript">
    BUI.use('common/page');
  </script>
  <!-- 仅仅为了显示代码使用，不要在项目中引入使用-->
  <script type="text/javascript" src="../assets/js/prettify.js"></script>
  <script type="text/javascript">
    $(function () {
      prettyPrint();
    });
  </script> 

<body>
</html>  