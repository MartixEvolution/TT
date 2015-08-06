<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

    <html>
    <head>
    <meta http-equiv="Content-Type" content="text/html;  charset="gbk123">
    <title>内联表单</title>
    <!-- 此文件为了显示Demo样式，项目中不需要引入 -->
    <link href="../../assets/code/demo.css" rel="stylesheet">
     
      <link href="css/bs3/dpl.css" rel="stylesheet">
      <link href="css/bs3/bui.css" rel="stylesheet">
     
    </head>
    <body>
    <form id="form" name="form" method="post" action="user_add" namespace="/">
      <div class="demo-content">
        <div class="row">
          <div class="span14 doc-content">
            <form class="well form-inline">
                <input id="uid" name="uid" />
                <input id="uname" name="uname" />
                <input id="upassword" name="upassword"/>
                 <input id="rid" name="rid"/>
                <label class="checkbox">
                  <input type="checkbox"> Remember me
                </label>
                <button type="submit" class="button">Sign in</button>
            </form>
          </div>
        </div>
    <!-- script end -->
      </div>
      </form>
    </body>
    </html>