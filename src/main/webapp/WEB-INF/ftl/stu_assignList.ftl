
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
    <script src="https://cdn.staticfile.org/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link href="/res/css/bed_list.css" type="text/css">
    <script src="/res/js/stu_assignList.js"></script>
</head>

<body>
<script type="text/javascript">
    function change_Bed(stu_id,oldBed_id){
        document.getElementById("modal_stuId").value=stu_id;
        document.getElementById("modal_oldBedId").value=oldBed_id;
    }
    function assign_Bed(stu_id){
        document.getElementById("modal_stuId").value=stu_id;
        document.getElementById("modal_oldBedId").value=null;
    }
</script>

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
                <li><a href="/bed/bed_List">寝室列表</a></li>
                <li class="active"><a href="/stuInfo/stuInfoList">寝室人员列表</a></li>
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
                <#if isAllStuInfo>
                <span>寝室列表-共#{stuInfoPageInfo.pages}页，当前为第#{stuInfoPageInfo.pageNum}页</span>
                </#if>
                <input id="search_input" style="margin: 10px 20px 0 400px;" type="text" placeholder="输入学号查找">
                <a onclick="getStuInputKey(this)" href="" style="display: inline-block;margin-right: 20px;" ><span class="glyphicon glyphicon-search"></span></a>
                <a href="/stuInfo/stuInfoList"><button  class="btn btn-primary">显示全部</button></a>
            </caption>
            <thead>
            <tr class="success">
                <th>学号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>入学日期</th>
                <th>专业</th>
                <th>所属寝室</th>

                <th>编辑</th>
                <th>删除</th>
                <th>分配寝室</th>
            </tr>
            </thead>
            <tbody>
                <#list stuInfos as stuInfo>
                    <#if stuInfo??>
                    <tr>
                        <td>${stuInfo.stu_id}</td>
                        <td>${stuInfo.stu_name}</td>
                        <td>${stuInfo.stu_gender}</td>
                        <td>${stuInfo.stu_admDate?string("yyyy-MM-dd")}</td>
                        <td>${stuInfo.stu_major}</td>
                        <td>
                            <#if stuInfo.bed_id??>
                            ${stuInfo.bed_id}
                            </#if>
                        </td>
                        <td><a href="/stuInfo/editTemp?stu_id=${stuInfo.stu_id}"><span class="glyphicon glyphicon-edit">编辑</span> </a></td>
                        <td><a href="/stuAcc/deleteStuAcc?stu_id=${stuInfo.stu_id}" onclick="return delStu()"><span class="glyphicon glyphicon-trash">删除</span> </a></td>
                        <#if stuInfo.bed_id??>
                        <td>
                            <a href="" data-toggle="modal" data-target="#exampleModal" onclick="change_Bed(${stuInfo.stu_id},${stuInfo.bed_id})">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-repeat" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M11.534 7h3.932a.25.25 0 0 1 .192.41l-1.966 2.36a.25.25 0 0 1-.384 0l-1.966-2.36a.25.25 0 0 1 .192-.41zm-11 2h3.932a.25.25 0 0 0 .192-.41L2.692 6.23a.25.25 0 0 0-.384 0L.342 8.59A.25.25 0 0 0 .534 9z"/>
                                    <path fill-rule="evenodd" d="M8 3c-1.552 0-2.94.707-3.857 1.818a.5.5 0 1 1-.771-.636A6.002 6.002 0 0 1 13.917 7H12.9A5.002 5.002 0 0 0 8 3zM3.1 9a5.002 5.002 0 0 0 8.757 2.182.5.5 0 1 1 .771.636A6.002 6.002 0 0 1 2.083 9H3.1z"/>
                                </svg>
                                变更寝室
                            </a>
                        </td>
                        <#else>
                            <td>
                                <a href="#" data-toggle="modal" data-target="#exampleModal" onclick="assign_Bed(${stuInfo.stu_id})">
                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-wrench" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M.102 2.223A3.004 3.004 0 0 0 3.78 5.897l6.341 6.252A3.003 3.003 0 0 0 13 16a3 3 0 1 0-.851-5.878L5.897 3.781A3.004 3.004 0 0 0 2.223.1l2.141 2.142L4 4l-1.757.364L.102 2.223zm13.37 9.019L13 11l-.471.242-.529.026-.287.445-.445.287-.026.529L11 13l.242.471.026.529.445.287.287.445.529.026L13 15l.471-.242.529-.026.287-.445.445-.287.026-.529L15 13l-.242-.471-.026-.529-.445-.287-.287-.445-.529-.026z"/>
                                    </svg>
                                    分配寝室
                                </a>
                            </td>
                        </#if>
                    </tr>
                    <#else>
                        <tr>
                            <td colspan="9" align="center"><h1>学号输入有误，没有这个学生!</h1></td>
                        </tr>
                    </#if>

                <#--模态框部分-->
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">变更寝室</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="/stuInfo/assignBed">
                                    <div class="form-group">
                                        <label for="message-text" class="col-form-label">寝室号:</label>
                                        <input type="hidden" value="" name="stu_id" id="modal_stuId">
                                        <input type="text" class="form-control" id="recipient-name" name="newBed_id">
                                        <input type="hidden" value="" name="oldBed_id" id="modal_oldBedId">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                                        <button type="submit" class="btn btn-primary">确定变更</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                </#list>
            </tbody>
        </table>
    </div>
    <#if isAllStuInfo>
    <nav class="pageDiv">
        <div align="center">
            <ul  class="pagination">
                <li ><#--<#if !page.hasPreviouse></#if>-->
                    <a href="/stuInfo/stuInfoList?pageNo=1" ><span>首页</span></a>
                </li>
                <#if stuInfoPageInfo.hasPreviousPage>
                <li >
                    &nbsp;&nbsp; <a href="/stuInfo/stuInfoList?pageNo=#{stuInfoPageInfo.pageNum-1}"><span>上一页</span></a>
                </li>
                </#if>
                <#if stuInfoPageInfo.hasNextPage>
                <li >
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="/stuInfo/stuInfoList?pageNo=#{stuInfoPageInfo.pageNum+1}"><span> 下一页</span></a>
                </li>
                </#if>
                <li >
                    &nbsp;&nbsp; <a href="/stuInfo/stuInfoList?pageNo=#{stuInfoPageInfo.navigateLastPage}"><span>尾页</span></a>
                </li>
            </ul>
        </div>
    </nav>
    </#if>
    <a href="/stuInfo/toAddStuInfo"><button type="button" class="btn btn-info btn-block">添加学生</button></a>

</div><!-- /.container -->



</body>
</html>
