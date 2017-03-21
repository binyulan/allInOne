<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>首页</title>
<link href="../lib/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="../lib/syntaxhighlighter/styles/shCoreDefault.css" />
<link rel="shortcut icon" type="images/x-icon" href="../icon/person.ico" />
<script type="text/javascript" src="../lib/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="../lib/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../lib/syntaxhighlighter/scripts/shCore.js"></script>
<script type="text/javascript" src="../lib/syntaxhighlighter/scripts/shBrushXml.js"></script>
<script type="text/javascript" src="../lib/syntaxhighlighter/scripts/shBrushJava.js"></script>
<script type="text/javascript">
	SyntaxHighlighter.all();
</script>
</head>
<body style="background-color: #fff">
    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <div>
                <ul class="nav navbar-nav">
                    <li data-id="java" class="active"><a href="../index">Java</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div id="presentation" class="container-fluid">
        <div id="article">
            <div class="page-header">
                <h1>${article.title}</h1>
            </div>
            ${article.content}
        </div>
        <div id="comments">
            <div class="panel panel-default">
                <div class="panel-heading">发表于2017-01-01 hh:MM:ss</div>
                <div class="panel-body">Panel content</div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">发表于2017-01-01 hh:MM:ss</div>
                <div class="panel-body">Panel content</div>
            </div>
        </div>
        <form>
            <div class="form-group">
                <label for="comment" class="control-label">回复</label>
                <textarea class="form-control" id="comment"
                    name="comment" placeholder="请输入回复内容" rows="10"></textarea>
            </div>
            <button type="button" id="addComment" class="btn btn-default">添加回复</button>
        </form>
    </div>
    <script type="text/javascript">
        $("#addComment").bind("click", function() {
            $(".modal").modal('show');
            $.post("article", {comment: $("#comment").val()}, function(data) {
                $("#comments").prepend(
                    '<div class="panel panel-default">'
                   +    '<div class="panel-heading">DATA FROM BACKEND</div>'
                   +    '<div class="panel-body">' + $("#comment").val() + '</div></div>'
                );
                $(".progress").hide();
                $(".alert-success").show();
                setTimeout(function(){
                    $(".modal").modal('hide');
                    $(".progress").show(1000);
                    $(".alert-success").hide(1000);
                }, 1000);
               
            });
        });
    </script>
    <div class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
        <div class="modal-dialog" role="document">
            <div class="progress">
                <div class="progress-bar progress-bar-striped active"
                    role="progressbar" aria-valuenow="10"
                    aria-valuemin="0" aria-valuemax="100"
                    style="width: 100%"></div>
            </div>
            <div class="alert alert-success" role="alert" style="display: none;">添加成功</div>
        </div>
    </div>
</body>
</html>