
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Starter Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link href="/res/css/bed_list.css" type="text/css">

    <script type="text/javascript">
        function isExistStuId() {
            if(${isExistStuId?string("true","false")}){
                alert("该学生已存在，请重新输入!")
                document.getElementById("stu_id").focus();
            }
        }

       /* $(function(){
            $("#init_password").addEventListener("blur",function (){
                if($("#init_password").value===null){
                    alert("密码不能为空！")
                }
            },true)
        })*/
    </script>
</head>

<body onload="isExistStuId()">
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">寝室管理</a>
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

<div class="container" style="padding-top: 50px;width: 60%">
    <div class="starter-template">
    </div>
    <div class="updateDiv">
        <div class="panel panel-success">
            <div class="panel-heading" align="center">
                <h3 class="panel-title">
                    <a href="/stuInfo/stuInfoList" style="float: left">
                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-left" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z"/>
                            <path fill-rule="evenodd" d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>
                        </svg>
                    </a>
                    <span>添加学生</span>
                </h3>
            </div>
            <div class="panel-body" align="center">
                <form method="post" action="/stuInfo/addStuInfo" role="form">
                    <table class="editTable">
                        <tr>
                            <div class="form-group row">
                                <label for="stu_id" class="col-sm-2 col-form-label">学号</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="stu_id" id="stu_id" value="" required>
                                </div>
                            </div>
                        </tr>
                        <tr>
                            <div class="form-group row">
                                <label for="init_password" class="col-sm-2 col-form-label">初始密码</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" name="init_password" id="init_password" required>
                                </div>
                            </div>
                        </tr>
                        <tr>
                            <div class="form-group row">
                                <label for="stu_name" class="col-sm-2 col-form-label">姓名</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="stu_name" id="stu_name" value="" required>
                                </div>
                            </div>
                        </tr>
                        <tr>
                            <div class="form-group row">
                                <label for="stu_admDate" class="col-sm-2 col-form-label">入学日期</label>
                                <div class="col-sm-10">
                                    <input type="date" class="form-control" name="stu_admDate" id="stu_admDate" value="" required>
                                </div>
                            </div>
                        </tr>
                        <tr>
                            <div class="form-group row">
                                <label for="stu_admDate" class="col-sm-2 col-form-label">专业</label>
                                <div class="col-sm-10">
                                    <select class="form-control" name="stu_major" id="stu_major">
                                        <option>计算机科学与技术</option>
                                        <option>电子科学与技术</option>
                                        <option>电子信息工程</option>
                                        <option>机械自动化</option>
                                        <option>商业英语</option>
                                    </select>
                                </div>
                            </div>
                        </tr>
                        <tr>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="stu_gender" id="boy" value="男" checked>
                                <label class="form-check-label" for="boy">男</label>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <input class="form-check-input" type="radio" name="stu_gender" id="girl" value="女" >
                                <label class="form-check-label" for="girl">女</label>
                            </div>
                        </tr>
                        <tr class="submitTR">
                            <div class="form-group row" align="center">
                                <div class="col-sm-12" align="center">
                                    <button type="submit" class="btn btn-primary">添加</button>
                                </div>
                            </div>
                        </tr>
                    </table>
                </form>
            </div>
        </div>

    </div>

</div><!-- /.container -->

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
