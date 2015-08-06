<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>BUI交互 - ASP.NET</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="http://a.tbcdn.cn/s/bui/css/dpl-min.css" rel="stylesheet">
    <link href="http://a.tbcdn.cn/s/bui/css/bui-min.css" rel="stylesheet">
    <link href="assets/css/page-min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/prettify.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        code
        {
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
                <h2>
                    测评活动首页表格说明</h2>
                <p>
                    表格说明</p>
                <ol>
                    <li>表格的常用操作</li>
                </ol>
            </div>
            <div class="span16">
                <img src="assets/images/table.jpg" />
                <br />
                <h2>
                    参数说明</h2>
                <p>
                    前台数据交互</p>
                <ol>
                    <li><code>表单查询面板</code>: 参照：<a href="http://www.builive.com/form/form-layout.php#form-layout/form-panel.php"
                        target="_blank">表单面板</a></li>
                    <li><code>日期格式化</code> :<br />
                        { title: '出生日期', dataIndex: 'Birthday', width: 150, elCls: 'center',<span class="atv">renderer:BUI.Grid.Format.dateRenderer</span>}
                    </li>
                    <li><code>枚举</code> :<br />
                        var enumObj = { "1": "男", "0": "女" };<br />
                        { title: '性别', dataIndex:'Sex', width: 150, elCls: 'center',<span class="atv">renderer:
                            BUI.Grid.Format.enumRenderer(enumObj)</span>}</li>
                    <li><code>编辑</code>: 使用renderer:function(){} 函数,我们可以自己定义样式并使用快捷操作方式直接跳转打开页面 </li>
                    <li><code>底部快捷操作</code>:<br />
                        定义grid的时候：<br />
                        <pre class="prettyprint linenums">
        grid = new Grid.Grid({
            render:'#grid',
            columns : columns,
            loadMask: true,
            store: store,
            // 底部工具栏
            bbar: {
                pagingBar: true,
                items: [
                    { text: '测评过程', btnCls: 'button button-small button-danger' },
                    { text: '设置标准', btnCls: 'button button-small button-info' },
                    { text: '测评报告', btnCls: 'button button-small button-success'},
                    { text: '批量生成帐号', btnCls: 'button button-small button-warning', handler: createFunction }//调用JS函数
          
                ]
            }
        });
                        </pre>
                    </li>
                    <li><code>截断字符串</code>:{ title: '出生日期', dataIndex: 'Birthday', width: 150, elCls: 'center',<span
                        class="atv">renderer:BUI.Grid.Format.cutTextRenderer(9), showTip: true</span>}</li>
                </ol>
            </div>
        </div>
        <div class="row">
            <div class="span8">
                <h2>
                    分页数据</h2>
                <p>
                    分页使用JSON跟后台的交互</p>
                <ol>
                    <li>其它处理页面返回JSON</li>
                    <li>当前页面返回JSON</li>
                </ol>
            </div>
            <div class="span16">
                <h3>
                    请求参数</h3>
                <p>
                    常见形式：</p>
                <pre class="prettyprint linenums">
        var store = new Store({
          url : 'pdindex.aspx?data=json',
          autoLoad:true, 
          pageSize:10,     // 配置分页数目
          params:{dept:10} //自定义传递参数
        })
        </pre>
                <p>
                    我们可以向后台提供以下常用的参数</p>
                <ol>
                    <li><code>url</code>: 提供数据源的处理页面，返回JSON。可以是单独的数据处理页面a.aspx，也可以是当前页面。一般我们都是用当前页面，但是需要加一个标识，例如:b.aspx?data=json，我们后台通过
                        Request["data"]标识 </li>
                    <li><code>autoLoad</code> : 创建对象时是否自动加载（如果传递了参数或者查询时有默认值，则自动查询返回对应结果）</li>
                    <li><code>pageSize</code> : 当前页显示的行数</li>
                    <li><code>params</code>：自定义传递的参数集合{dept:10}</li>
                </ol>
                <h3>
                    传回的数据集合</h3>
                <p>
                    常见形式：</p>
                <pre class="prettyprint linenums">
        if (!string.IsNullOrEmpty(Request["data"])) //标识是否正常操作
        {
            int pageSize = 10;
            int pageIndex = 0;

            <span class="atv">//分页条件 if (!string.IsNullOrEmpty(Request.Params["start"])) { //第几页
                //此处 也可以取pageIndex，pageIndex和start重复使用，选一个 pageIndex = Convert.ToInt32(Request.Params["start"]);
                } if (!string.IsNullOrEmpty(Request.Params["limit"])) { //显示的行数 pageSize = Convert.ToInt32(Request.Params["limit"]);
                } </span>
            //查询条件
            if (!string.IsNullOrEmpty(Request.Params["dept"]))
            {
                DeptID = Request.Params["dept"];
            }
            <span class="atv">//获取数据集并返回数据结果 string strResult = Bind(pageSize, pageIndex); Response.Write(strResult);
                Response.End(); </span>
        }

        #region 绑定页面数据
        protected string Bind(int Size, int Index)
        {
            //拼接查询条件
            string sqlwhere = string.Empty;
            string strResult = string.Empty;

            try
            {
                if (!DeptID.Equals("-1"))
                {
                    sqlwhere += " and b.DeptID=@DeptID ";
                }

                DbCommandData dbcom = new DbCommandData("");
                dbcom.AddParameter("@CoID", COAdminInfo.GetLoggedOnCoid());
                dbcom.AddParameter("@DeptID", DeptID);

                //取得数据集              
                DataSet mySet = zyxCommon.GetEmployeeByDeptID(Size, Index, sqlwhere, dbcom);
                if (mySet != null && mySet.Tables.Count > 0)
                {
                    //总数
                    int PageCount = int.Parse(mySet.Tables[0].Rows[0][0].ToString());
                    //转为JSON字符结果
                    string strJson = zyxCommon.DataTableToJson(mySet.Tables[1]);

                    strResult = "{\"results\":" + PageCount + ",\"rows\":" + strJson + "}";
                }
                else
                {
                    //防止DataSet为空时一直处于加载中
                    strResult = "{\"results\":0,\"rows\":[]}";
                }
            }
            catch (Exception ex)
            {
                //捕捉错误并返回
                strResult = "{\"results\":0,\"rows\":[],\"hasError\":\"true\",\"error\" : \"" + ex.Message + "\"}";
            }
            return strResult;
        }
        #endregion
        </pre>
                <ol>
                    <li><code>rows</code>: 传回的数据集合</li>
                    <li><code>results</code> : 记录总数，如果使用双引号可能导致计算出错，所以不需要使用双引号</li>
                    <li><code>hasError</code> : 只有出错的时候提供此字段</li>
                    <li><code>error</code>:出错信息，仅在 hasError : true 时使用</li>
                </ol>
            </div>
        </div>
        <div class="row">
            <div class="span8">
                <h2>
                    表格列的显示隐藏</h2>
                <p>
                    根据某些权限或要求显示和隐藏某些列</p>
                <ol>
                    <li>某些权限看到的列</li>
                </ol>
            </div>
            <div class="span16">
                <p>
                    我们可以通过store的beforeProcessLoad方法在数据准备完成但是还没显示的时候处理</p>
                <pre class="prettyprint linenums">
        //表格列：
        { title: '密码', dataIndex: 'PWD',id:'ipwd', width: 150, elCls: 'center' },

        //监听事件,数据准备完成后控制表数据的隐藏和显示
        store.on('beforeProcessLoad', function (ev) {
            if (ev.results > 0) {//结果不为空
                if (ev.base != null) {//后台数据输出时可以自己添加权限，然后输出判断
                    //设置隐藏的两种形式，有时候有些列可能dataIndex一样，我们可以通过加id的形式设置
                    <span class="atv">grid.findColumn('ipwd').set('visible', false);//通过表格列：id 设置 grid.findColumnByField('PWD').set('visible',
                        false);//通过表格列：dataIndex 设置 </span>
                }
            }
        });
        </pre>
                <h3>
                    传回的数据集合</h3>
                <p>
                    常见形式：</p>
                <pre class="prettyprint linenums">
                if (权限.Equals("0"))
                {
                    strmsg += "\"base\":true,";
                }
                string strResult = "{\"results\":" + PageCount + ",\"rows\":" + strJson + "," + strmsg + "}";
                Response.Write(strResult);
                Response.End();
                </pre>
                <ol>
                    <li><code>rows</code>: 传回的数据集合</li>
                    <li><code>results</code> : 记录总数，如果使用双引号可能导致计算出错，所以不需要使用双引号</li>
                    <li><code>hasError</code> : 只有出错的时候提供此字段</li>
                    <li><code>error</code>:出错信息，仅在 hasError : true 时使用</li>
                    <li><code>base</code>:自定义权限信息</li>
                </ol>
            </div>
        </div>
        <div class="row">
            <div class="span8">
                <h2>
                    表格的常用操作</h2>
                <p>
                    自定义表头样式，不排序，默认排序，截断字符，快捷跳转,枚举的使用...</p>
                <ol>
                    <li>表格的常用操作</li>
                </ol>
            </div>
            <div class="span16">
                <p>
                    我们在处理表格的时候，可以通过表格列的设置做一些很方便的操作</p>
                <pre class="prettyprint linenums">
        columns：
            //最常见的 此处elCls可以自己定义一些css引用 例如：elCls:'center bold',我们自己定义一个bold样式为加粗
            { title: '姓名', dataIndex: 'Name', width: 150, elCls: 'center <span class="atv">bold</span>' }

            //有些列我们可以不用排序，这时候加上
            { title: '姓名', dataIndex: 'Name', width: 150, elCls: 'center',<span class="atv">sortable:false</span>}

            //默认排序：sortState ： <span class="atv">ASC</span> or <span class="atv">DESC</span>
            { title: '姓名', dataIndex: 'Name', width: 150, elCls: 'center',<span class="atv">sortState:"DESC"</span>}

            //截断字符，鼠标移上去可以显示全部  cutTextRenderer(保留的位数)
            { title: '姓名', dataIndex: 'Name', width: 150, elCls: 'center',<span class="atv">renderer:
                BUI.Grid.Format.cutTextRenderer(9), showTip: true</span>}
            
            //枚举
            //var enumObj = { "1": "男", "0": "女" }
            { title: '性别', dataIndex: 'Sex', width: 150, elCls: 'center',<span class="atv">renderer:
                BUI.Grid.Format.enumRenderer(enumObj)</span>}
           
           //日期格式的直接处理
           { title: '出生日期', dataIndex: 'Birthday', width: 150, elCls: 'center',<span class="atv">renderer:BUI.Grid.Format.dateRenderer</span>}
           

            <span class="atv">注： 1.当定义函数时，renderer:function(value,obj),这里两个参数，第一个为定义：dataIndex项的值，
                obj为当前对象，有时候，我们在一列中需要用到表格的其它数据，就可以这样：obj.sex,obj.name 2.在这个函数我们可以做多个处理，例如：添加其它自定义的快捷操作，修改的快捷操作...只要函数中用
                return 返回 </span>
        </pre>
                <h3>
                    传回的数据集合</h3>
                <p>
                    常见形式：</p>
                <pre class="prettyprint linenums">
                if (权限.Equals("0"))
                {
                    strmsg += "\"base\":true,";
                }
                string strResult = "{\"results\":" + PageCount + ",\"rows\":" + strJson + "," + strmsg + "}";
                Response.Write(strResult);
                Response.End();
                </pre>
                <ol>
                    <li><code>rows</code>: 传回的数据集合</li>
                    <li><code>results</code> : 记录总数，如果使用双引号可能导致计算出错，所以不需要使用双引号</li>
                    <li><code>hasError</code> : 只有出错的时候提供此字段</li>
                    <li><code>error</code>:出错信息，仅在 hasError : true 时使用</li>
                    <li><code>base</code>:自定义权限信息</li>
                </ol>
            </div>
        </div>
        <div class="row">
            <div class="span8">
                <h2>
                    其它操作</h2>
                <p>
                    session失效或未登录直接url请求...</p>
                <ol>
                    <li>session失效或未登录</li>
                </ol>
            </div>
            <div class="span16">
                <p>
                    我们在Session失效或未登录时直接url访问时，可以加一个公共的处理页面，我的做法是，验证session不通过则跳转到login.aspx中。然后在login.aspx页面中加判断，
                    是否是在框架中。形式：
                    </p>
                <pre class="prettyprint linenums">
            if (location.href != top.location.href) {
                //提示
                alert('您未登录或者用户名已失效！');//如果使用BUI自带的提示只影响当前页面，关闭还能继续操作
                //退出处理页面，清空session并跳转到登录页面
                top.location.href = "LoginOut.aspx";
            }
        </pre>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="assets/js/jquery-1.8.1.min.js"></script>
    <script type="text/javascript" src="assets/js/bui-min.js"></script>
    <script type="text/javascript" src="assets/js/config-min.js"></script>
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
