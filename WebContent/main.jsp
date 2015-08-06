<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
 <head>
  <title> 昌顺物流管理系统</title>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link href="assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
  <link href="assets/css/bui-min.css" rel="stylesheet" type="text/css" />
   <link href="assets/css/main-min.css" rel="stylesheet" type="text/css" />
 </head>
 <body>

  <div class="header">
    
      <div class="dl-title">
	  <!--
        <a href="http://www.builive.com" title="文档库地址" target="_blank"><!-- 仅仅为了提供文档的快速入口，项目中请删除链接 -->
          <span class="lp-title-port">昌顺物流</span><span class="dl-title-text">管理系统</span>
        </a>
      </div>

   <div class="dl-log">欢迎您，<span class="dl-log-user">来到昌顺物流管理系统</span>
	<!--<a href="###" title="退出系统" class="dl-log-quit">[退出]</a> -->
    </div>
  </div>
   <div class="content">
    <div class="dl-main-nav">
      <div class="dl-inform"><div class="dl-inform-title">贴心小秘书<s class="dl-inform-icon dl-up"></s></div></div>
      <ul id="J_Nav"  class="nav-list ks-clear">
        <li class="nav-item dl-selected"><div class="nav-item-inner nav-home">基本业务</div></li>
        <li class="nav-item"><div class="nav-item-inner nav-order">日常收支</div></li>
        <li class="nav-item"><div class="nav-item-inner nav-inventory">其他业务</div></li>
        <li class="nav-item"><div class="nav-item-inner nav-supplier">物流信息</div></li>
        
      </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">

    </ul>
   </div>
  <script type="text/javascript" src="assets/js/jquery-1.8.1.min.js"></script>
  <script type="text/javascript" src="./assets/js/bui.js"></script>
  <script type="text/javascript" src="./assets/js/config.js"></script>

  <script>
    BUI.use('common/main',function(){
      var config = [{
          id:'menu', 
          homePage : 'code',
          menu:[{
              text:'信息录入',
              items:[
                     <!--获取客户公司名称，展示到company.jsp中供录入使用        -->
                {id:'code',text:'公司单号信息录入',href:'company_findall.action',closeable : false},
                {id:'main-menu',text:'专线单号信息录入',href:'jsp/transport.jsp'}
               
              ]
            },{
              text:'信息查询',
              items:[
                {id:'operation',text:'公司单号查询',href:'bizlist_findall.action'},
                {id:'quick',text:'专线单号查询',href:'company_findall.action'},
                {id:'quicks',text:'公司信息展示',href:'jsp/show.jsp'}	
              ]
            },{
              text:'表格导出',
              items:[
                {id:'resource',text:'公司业务清单导出',href:'main/resource.jsp'},
                {id:'loader',text:'公司利润表导出',href:'main/loader.jsp'}  
              ]
            }]
          },{
            id:'form',
            menu:[{
                text:'日常开支',
                items:[
                  {id:'code',text:'现金账表录入',href:'jsp/dailybill.jsp'},
                  {id:'example',text:'现金账查询',href:'form/example.jsp'},
                  {id:'introduce',text:'表格导出',href:'form/introduce.jsp'}               
                ]
              }]
          },{
            id:'search',
            menu:[{
                text:'其他业务',
                items:[
                  {id:'code',text:'其他业务录入',href:'jsp/otherbill.jsp'},
                  {id:'example',text:'其他业务查询',href:'search/example.jsp'},
                  {id:'example-dialog',text:'信息导出',href:'search/example-dialog.jsp'}
                ]
              }]
          },{
            id:'detail',
            menu:[{
                text:'货物跟踪',
                items:[
                  {id:'code',text:'货物跟踪信息录入',href:'bizlist_findorder.action'},
                  {id:'example',text:'货物跟踪信息查询',href:'detail/example.jsp'},
                  {id:'search',text:'价格查询',href:'detail/example.jsp'}
                ]
              }]
          }];
      new PageUtil.MainPage({
        modulesConfig : config
      });
    });
  </script>
 </body>
</html>
