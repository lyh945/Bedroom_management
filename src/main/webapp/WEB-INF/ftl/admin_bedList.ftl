
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Starter Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link href="/res/css/bed_list.css" type="text/css">
    <script src="/res/js/admin_bedList.js"></script>
</head>

<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/bed/bed_List">寝室管理</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/bed/bed_List">寝室列表</a></li>
                <li><a href="/stuInfo/toStuInfoList">寝室人员列表</a></li>
                <li><a href="#contact">联系</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

<div class="container" style="padding-top: 50px;">

    <div class="starter-template">
    </div>
    <div class="listDiv" style="height: 300px;">
        <table class="table table-striped table-bordered table-hover table-condensed">
            <caption>
                <#if isAllBedroom>
                <span>寝室列表-共${totalPageNum}页，当前为第${nowPageNum}页</span>
                </#if>
                <input id="search_input" style="margin: 10px 20px 0 400px;" type="text" placeholder="输入寝室号查找">
                <a onclick="getBedInputKey(this)" href="" style="display: inline-block;margin-right: 20px;" ><span class="glyphicon glyphicon-search"></span></a>
                <a href="/bed/bed_List"><button  class="btn btn-primary">显示全部</button></a>
            </caption>
            <thead>
            <tr class="success">
                <th>寝室号</th>
                <th>寝室人数</th>
                <th>寝室水费</th>
                <th>寝室电费</th>
                <th>寝室信息</th>

                <th>编辑</th>
                <th>删除</th>
                <th>查看寝室人员</th>
            </tr>
            </thead>
            <tbody>
            <#if bedrooms??>
                <#list bedrooms as bedroom>
                    <#if bedroom??>
                    <tr>
                        <td>${bedroom.bed_id}</td>
                        <td>${bedroom.stu_num}</td>
                        <td>${bedroom.water_bill?string('0.00')}</td>
                        <td>${bedroom.ele_bill?string('0.00')}</td>
                        <td>${bedroom.bed_info}</td>
                        <td><a href="/bed/editTemp?bed_id=${bedroom.bed_id}"><span class="glyphicon glyphicon-edit">编辑</span> </a></td>
                        <td><a href="/bed/deleteBedroom?bed_id=${bedroom.bed_id}" onclick="return delBedroom()"><span class="glyphicon glyphicon-trash">删除</span> </a></td>
                        <td>
                            <a href="/stuInfo/bedIdToStuList?bed_id=${bedroom.bed_id}">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-eye-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
                                    <path fill-rule="evenodd" d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
                                </svg>
                                查看寝室所有学生
                            </a>
                        </td>
                    </tr>
                    <#else>
                        <tr>
                            <td colspan="8" align="center"><h1>寝室号输入有误，没有这个寝室!</h1></td>
                        </tr>
                    </#if>
                </#list>
            <#else>
                <tr>
                    <td colspan="4"><h1>没有数据</h1></td>
                </tr>
            </#if>
            </tbody>
        </table>
    </div>
    <#if isAllBedroom>
    <nav class="pageDiv">
        <div align="center">
            <ul  class="pagination">
                <li ><#--<#if !page.hasPreviouse></#if>-->
                    <a href="/bed/bed_List?start=0" ><span>首页</span></a>
                </li>
                <li >
                    &nbsp;&nbsp; <a href="/bed/bed_List?start=${page.start-page.count}"><span>上一页</span></a>
                </li>
                <li >
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="/bed/bed_List?start=${page.start+page.count}"><span> 下一页</span></a>
                </li>
                <li >
                    &nbsp;&nbsp; <a href="/bed/bed_List?start=${page.total}"><span>尾页</span></a>
                </li>
            </ul>
        </div>
    </nav>
    </#if>
    <a href="/bed/toAdd"><button type="button" class="btn btn-info btn-block">添加寝室</button></a>

</div><!-- /.container -->


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
