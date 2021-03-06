<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
 <head>
  <title> 常见页面操作</title>
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
      <div class="span8">
        <h2>简介</h2>
        <p>这个框架采用的是iframe方式组织主页和子页面的，所以有很多操作需要跨iframe执行，所以开放了一些接口，框架中的页面操作有以下几种：</p>
        <ol>
          <li><a href="#open">打开页面</a></li>
          <li><a href="#close">关闭页面</a></li>
          <li><a href="#refresh">刷新页面</a></li>
          <li><a href="#title">更改页面（tab)的标题</a></li>
        </ol>
        <p>本页面只做API接口的说明和实现的机制，具体的示例，在其他页面中展示。</p>
      </div>
      <div class="span16">
        <h2>API接口</h2>
        <p>在框架页上开放的接口，是跨iframe实现的，注意跨域问题。</p>
        <ol>
          <li>openPage : 打开页面，或者跳转页面，用以一个参数： <code>pageInfo</code>,是一个键值对
            <ol>
              <li>moduleId : 默认为当前模块（一般不用指定），模块id,对应一级导航的id，在配置菜单时指定</li>
              <li>id: 打开页面的id,此处id 唯一标示页面，如果已经打开过同id的页面，会跳转到页面。如果左侧有对应id的菜单，会定位到菜单。</li>
              <li>title：页面标题</li>
              <li>href : 页面的链接地址</li>
              <li>reload: 如果页面已经打开，是否重新加载，默认为false</li>
              <li>search : 搜索条件，打开页面时附加的搜索条件/li>
              <li>isClose : 打开新页面后，当前页是否关闭,默认为false</li>
            </ol>
          </li>
          <li>closePage : 关闭一个页面。参数如下：
            <ol>
              <li>id : 页面Id,打开页面时指定的id，默认为当前页面</li>
              <li>moduleId：模块id(可以为空）</li>
            </ol>
          </li>
          <li>reloadPage : 刷新页面,参数如下：
            <ol>
              <li>id : 页面Id,打开页面时指定的id，默认为当前页面</li>
              <li>moduleId：模块id(可以为空）</li>
            </ol>
          </li>
          <li>setTitle : 设置页面标题
            <ol>
              <li>title: 页面标题</li>
              <li>id : 页面Id,打开页面时指定的id，默认为当前页面</li>
              <li>moduleId：模块id，默认为当前模块</li>
            </ol>
          </li>
        </ol>
      </div>
    </div>

    <div class="row">
      <div class="span8">
        <h2>API 调用</h2>
        <p>框架页上开放了一个对象，<code>topManager</code>,注意一下几点：</p>
        <ol>
          <li>使用API前一定要判断：if(top.topManager) </li>
          <li>模块id 可以为空，默认是当前模块</li>
          <li>跨域页面内部不能使用这些接口</li>
        </ol>
      </div> 
      <div class="span16">
        <h2 id="open">示例</h2>
        <p>下面是一些打开页面的示例，都是直接调用对应的API完成的，更加方面的使用方式，在具体的页面中说明。</p>
        <h3>左侧菜单中配置过的页面</h3>
        <p>
          <a id="J_OpenMenu" href="#">打开菜单配置页面</a>
        </p>
        <pre class="prettyprint linenums">
//进行操作时，必须判断页面是否在框架页内，
//否则报错
if(top.topManager){
  //打开左侧菜单中配置过的页面
  top.topManager.openPage({
    id : 'main-menu',
    search : 'a=123&b=456'
  });
}
        </pre>
        <h3>打开未配置过的页面</h3>
        <p>
          <a id="J_OpenRelative" href="#">相对地址页面</a>
          <a id="J_OpenAbsolute" href="#">打开百度网址</a>
        </p>
        <pre class="prettyprint linenums">

  //打开相对地址，相对地址，必须以框架页面（main页面）为起始，不是相对于当前页面的位置
  top.topManager.openPage({
    id : 'test1',
    href : 'main/test.html',
    title : '相对地址页面'
  });

  //打开绝对路径，可以是同域的，也可以是外部链接
  top.topManager.openPage({
    id : 'baidu',
    href : 'http://www.baidu.com',
    title : '百度页面'
  });

      </pre>

      </div> 
    </div>
    <div class="row">
      <div class="span8">
        <h3 id="close">关闭页面</h3>
        <p>关闭页面一般用于3种情形：</p>
        <ol>
          <li>关闭本页</li>
          <li>关闭其他页面（几乎未用到过）</li>
          <li>打开指定页面，关闭本页（可以用本页跳转代替，不过要修改标题）</li>
        </ol>
      </div>
      <div class="span16">
        <h3>关闭示例</h3>
        <p>
          <a id="J_Close" href="#">关闭本页</a>
          <a id="J_CloseOther" href="#">关闭顶部导航页面</a>
          <a id="J_OpenAndClose" href="#">打开其他页面，关闭自身</a>
        </p>
        <pre class="prettyprint linenums">
    //关闭当前页
    top.topManager.closePage();

    //关闭其他页面时，如果页面未打开，不进行任何操作
    top.topManager.closePage('main-menu');

    //打开其他页面并关闭本页，常用于成功、失败页面的跳转
    top.topManager.openPage({
      id : 'main-menu',
      isClose : true
    });
        </pre>
      </div>
    </div>
    <div class="row">
      <div class="span8">
        <h3 id="refresh">刷新页面</h3>
        <p>刷新页面一般用于2种情形：</p>
        <ol>
          <li>刷新本页</li>
          <li>本页修改数据后，如果其他页面需要实时刷新页面，则刷新指定页面</li>
        </ol>
      </div>
      <div class="span16">
        <h3>刷新示例</h3>
        <p>
          <a id="J_Refresh" href="#">刷新本页</a>
          <a id="J_RefreshOther" href="#">刷新顶部导航页面</a>
        </p>
        <pre class="prettyprint linenums">
    //刷新当前页
    top.topManager.reloadPage();

    //刷新其他页面时，如果页面未打开，不进行任何操作
    top.topManager.reloadPage('main-menu');
        </pre>
      </div>
    </div>
    <div class="row">
      <div class="span8">
        <h3 id="title">修改标题</h3>
        <p>一般修改标题发生在本页跳转时，跳转到的页面跟本页面标题不一致，可以：</p>
        <ol> 
          <li>在跳转前修改标题：触发跳转时修改标题</li>
          <li>跳转后修改标题：在页面加载时修改当前页面的标题</li>
        </ol>
        <p>一般我们在项目中使用第二种方式，第一种方式限于，跳转的页面自己不能控制时</p>
      </div>
      <div class="span16">
        <h3>示例</h3>
        <div>
          <input type="text" id="txtTitle" value="新标题"/>
          <button id="btnTitle" class="button">修改标题</button>
        </div>
        <pre class="prettyprint linenums">
//修改本页面标题
top.topManager.setPageTitle("新的标题");

//修改其他页面标题
top.topManager.setPageTitle("新的标题","main-menu");
        </pre>
      </div>
    </div>
    <div class="row">
      <div class="span16">
        <h3  class="label label-info">常见问题</h3>
        <p>页面操作中常见的问题如下：</p>
        <ol>
          <li>跨域问题，这个问题是iframe框架最常见的问题，修改domain只能解决部分问题。</li>
          <li>跨模块操作页面，需要指定一级目录(模块）的id，见菜单配置页面</li>
          <li>页面编号，点击菜单打开的页面，使用的编号是在菜单配置中的，如果打开一些详情页面，需要根据一定规则动态生成编号。</li>
          <li>首页刷新问题，当切换到一个模块，打开一个页面时，会在地址栏添加模块和页面编号，当刷新时，会返回到之前的模块和页面，但是其他打开的页面丢失。</li>
          <li>跨页面刷新数据问题，从一个列表页打开编辑页面后，修改完数据提交，此时是否需要刷新列表页，需要做处理。</li>
        </ol>
        <p>还有几个未处理的问题：</p>
        <ol>
          <li>页面回退，即点击页面的回退按钮，未做处理</li>
          <li>tab页面的顺序，未做可调整顺序功能，当关闭一个tab页面时，只是简单的激活前一个页面。</li>
          <li>未对窗口改变做事件处理。</li>
          <li>and so on</li>
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
<script type="text/javascript">
  $('#J_OpenMenu').click(function(e){
    e.preventDefault();
    if(top.topManager){
      //打开左侧菜单中配置过的页面
      top.topManager.openPage({
        id : 'main-menu',
        search : 'a=123&b=456',
        reload : true
      });
    }
  });

  $('#J_OpenRelative').click(function(e){
    e.preventDefault();
    if(top.topManager){
      //打开左侧菜单中配置过的页面
      top.topManager.openPage({
        id : 'test1',
        href : 'main/test.html',
        title : '相对地址页面'
      });
    }
  });

  $('#J_OpenAbsolute').click(function(e){
    e.preventDefault();
    if(top.topManager){

       top.topManager.openPage({
        id : 'baidu',
        href : 'http://www.baidu.com',
        title : '百度页面'
      });
    }
  });

  $('#J_Refresh').click(function(e){
    e.preventDefault();
    if(top.topManager){
      top.topManager.reloadPage();
    }
  });

  $('#J_RefreshOther').click(function(e){
    e.preventDefault();
    if(top.topManager){
      top.topManager.reloadPage('main-menu');
    }
  });
  $('#J_Close').click(function(e){
    e.preventDefault();
    if(top.topManager){
      top.topManager.closePage();
    }
  });

  $('#J_CloseOther').click(function(e){
    e.preventDefault();
    if(top.topManager){
      top.topManager.closePage('main-menu');
    }
  });

  $('#J_OpenAndClose').click(function(e){
    e.preventDefault();
    if(top.topManager){
      top.topManager.openPage({
        id : 'main-menu',
        isClose : true
      });
    }
  });

  $('#btnTitle').click(function(){
    if(top.topManager){
      top.topManager.setPageTitle($('#txtTitle').val());
    }
  });
</script>

<body>
</html>  