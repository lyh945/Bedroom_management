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

    <script type="text/javascript">
        function isExistBedId() {
            if(${isExistBedId?string("true","false")}){
                alert("该寝室已存在，请重新输入!")
                document.getElementById("bed_id").focus();
            }
        }

        function add_form(form){
            if(form.bed_id.value===''){
                alert("寝室号不能为空！");
                form.bed_id.focus();
                return false;
            }
            if(form.water_bill.value===''){
                form.water_bill.value=0.00;
            }
            if(form.ele_bill.value===''){
                form.ele_bill.value=0.00
            }
            if(form.bed_info.value===''){
                form.bed_info.value="";
            }
            return true;
        }
    </script>
</head>

<body onload="isExistBedId()">

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar">1</span>
                <span class="icon-bar">2</span>
                <span class="icon-bar">3</span>
            </button>
            <a class="navbar-brand" href="#">寝室管理</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">寝室列表</a></li>
                <li><a href="#about">关于</a></li>
                <li><a href="#contact">联系</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

<div class="container" style="padding-top: 50px;width: 60%">
    <div class="starter-template">
    </div>
    <div class="addDiv">
        <div class="panel panel-success">
            <div class="panel-heading" align="center">
                <h3 class="panel-title">
                    <a href="/bed/bed_List" style="float: left">
                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-left" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z"/>
                            <path fill-rule="evenodd" d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>
                        </svg>
                    </a>
                    <span>增加寝室</span>
                </h3>
            </div>
            <div class="panel-body" align="center">
                <form onsubmit="return add_form(this)" method="post" action="/bed/addBedroom" role="form">
                    <table class="editTable">
                        <tr>
                            <div class="form-group row">
                                <label for="bed_id" class="col-sm-2 col-form-label">寝室号</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="bed_id" id="bed_id" value="">
                                </div>
                            </div>
                        </tr>
                        <#--<tr>
                            <div class="form-group row" hidden>
                                <label for="stu_num" class="col-sm-2 col-form-label">寝室人数</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="stu_name" id="stu_name" value="0">
                                </div>
                            </div>
                        </tr>-->
                        <tr>
                            <div class="form-group row">
                                <label for="water_bill" class="col-sm-2 col-form-label">寝室水费</label>
                                <div class="col-sm-10">
                                    <input class="form-control" id="water_bill" name="water_bill" type="text" value="">
                                </div>
                            </div>
                        </tr>
                        <tr>
                            <div class="form-group row">
                                <label for="ele_bill" class="col-sm-2 col-form-label">寝室电费</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="ele_bill" id="ele_bill" value="">
                                </div>
                            </div>
                        </tr>
                        <tr>
                            <div class="form-group">
                                <label for="bed_info">寝室信息</label>
                                <textarea class="form-control" id="bed_info" name="bed_info" rows="3" cols="10" value=""></textarea>
                            </div>
                        </tr>
                        <tr class="submitTR">
                            <div class="form-group row" align="center">
                                <div class="col-sm-12" align="center">
                                    <button type="submit" class="btn btn-primary">提交</button>
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
