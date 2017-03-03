<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>首页</title>
<link
    href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css"
    rel="stylesheet">
<link type="text/css" rel="stylesheet"
    href="lib/syntaxhighlighter/styles/shCoreDefault.css" />
<link rel="shortcut icon" type="images/x-icon" href="../icon/person.ico" />
<script type="text/javascript"
    src="http://cdn.bootcss.com/jquery/2.2.4/jquery.js"></script>
<script type="text/javascript"
    src="lib/syntaxhighlighter/scripts/shCore.js"></script>
<script type="text/javascript"
    src="lib/syntaxhighlighter/scripts/shBrushXml.js"></script>
<script type="text/javascript"
    src="lib/syntaxhighlighter/scripts/shBrushJava.js"></script>
<script type="text/javascript">
	SyntaxHighlighter.all();
</script>
</head>
<body style="background-color: #fff">
    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <div>
                <ul class="nav navbar-nav">
                    <li data-id="java" class="active"><a
                        href="java">Java</a></li>
                    <li data-id="spring"><a href="spring">Spring</a></li>
                    <li data-id="hiberante"><a href="hiberante">Hiberante</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div id="presentation" class="container-fluid">
        <div id="article">${message}</div>
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
            <button type="button" class="btn btn-default">添加回复</button>
        </form>
    </div>
</body>
</html>