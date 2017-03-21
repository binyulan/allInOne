<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>首页</title>
<link type="text/css" rel="stylesheet"
    href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link type="images/x-icon" rel="shortcut icon" href="../icon/person.ico" />
</head>

<body style="background-color: #fff;">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="addArticleView">添加文章</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div id="presentation" class="container-fluid">
        <div class="row">
            <form class="form-horizontal" action="article" method="post">
                <div class="form-group">
                    <label for="title" class="col-sm-1 control-label">标题</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="title" name="title" placeholder="请输入标题">
                    </div>
                </div>
                <div class="form-group">
                    <label for="content" class="col-sm-1 control-label">内容</label>
                    <div class="col-sm-9">
                        <textarea class="form-control" id="content" name="content" placeholder="请输入内容" rows="10"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-1 col-sm-9">
                        <button type="submit" class="btn btn-default">添加文章</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>