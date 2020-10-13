
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
    <script src="/res/js/admin_stuInfoList.js"></script>
</head>

<body>
<script>
    function change_Bed(stu_id,oldBed_id){
        document.getElementById("modal_stuId").value=stu_id;
        document.getElementById("modal_oldBedId").value=oldBed_id;
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
                <li class="active"><a href="/bed/toAdd">寝室人员列表</a></li>
                <li><a href="#contact">联系</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

<div class="container" style="padding-top: 50px;">
    <div class="starter-template">
    </div>
    <div class="panel panel-success">
        <div class="panel-heading" align="center">
            <h3 class="panel-title">
                <a href="/bed/bed_List" style="float: left">
                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-left" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z"/>
                        <path fill-rule="evenodd" d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>
                    </svg>
                </a>
                <span>寝室学生列表</span>
            </h3>
        </div>
    </div>
    <div class="listDiv" style="height: 200px;">
        <table class="table table-striped table-bordered table-hover table-condensed">
            <thead>
            <tr class="success">
                <th>学号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>入学日期</th>
                <th>专业</th>
                <th>所属寝室</th>

                <th>变更寝室</th>
            </tr>
            </thead>
            <tbody>
                <#list bedToStuInfos as stuInfo>
                    <#if stuInfo??>
                    <tr>
                        <td>${stuInfo.bed_id}</td>
                        <td>${stuInfo.stu_name}</td>
                        <td>${stuInfo.stu_gender}</td>
                        <td>${stuInfo.stu_admDate?string("yyyy-MM-dd")}</td>
                        <td>${stuInfo.stu_major}</td>
                        <td>${stuInfo.bed_id}</td>
                        <td>
                            <a href="" data-toggle="modal" data-target="#exampleModal" onclick="change_Bed(${stuInfo.stu_id},${stuInfo.bed_id})">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-repeat" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M11.534 7h3.932a.25.25 0 0 1 .192.41l-1.966 2.36a.25.25 0 0 1-.384 0l-1.966-2.36a.25.25 0 0 1 .192-.41zm-11 2h3.932a.25.25 0 0 0 .192-.41L2.692 6.23a.25.25 0 0 0-.384 0L.342 8.59A.25.25 0 0 0 .534 9z"/>
                                    <path fill-rule="evenodd" d="M8 3c-1.552 0-2.94.707-3.857 1.818a.5.5 0 1 1-.771-.636A6.002 6.002 0 0 1 13.917 7H12.9A5.002 5.002 0 0 0 8 3zM3.1 9a5.002 5.002 0 0 0 8.757 2.182.5.5 0 1 1 .771.636A6.002 6.002 0 0 1 2.083 9H3.1z"/>
                                </svg>
                                变更寝室
                            </a>
                        </td>
                    </tr>
                    <#else>
                        <tr>
                            <td colspan="8" align="center"><h1>寝室暂无学生</h1></td>
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
                                            <input type="hidden" value="${stuInfo.stu_id}" name="stu_id" id="modal_stuId">
                                            <input type="text" class="form-control" id="recipient-name" name="newBed_id">
                                            <input type="hidden" value="<#if stuInfo.bed_id??>${stuInfo.bed_id}</#if>" name="oldBed_id" id="modal_oldBedId">
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

</div><!-- /.container -->
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
