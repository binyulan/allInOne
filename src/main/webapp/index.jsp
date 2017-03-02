<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>首页</title>
<link type="text/css" rel="stylesheet"
    href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link type="images/x-icon" rel="shortcut icon" href="icon/person.ico" />
</head>

<body style="background-color: #fff;">
    <nav class="navbar navbar-default">
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
        <div class="row">
            <div id="recentJava" class="col-sm-6">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">Java</h3>
                    </div>
                    <div class="panel-body">
                        <a href="article">article</a>
                    </div>
                </div>
            </div>
            <div id="recentSpring" class="col-sm-6">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">Spring</h3>
                    </div>
                    <div class="panel-body">
                        <a href="article">article</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div id="recentHibernate" class="col-sm-6">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">Hibernate</h3>
                    </div>
                    <div class="panel-body">
                        <a href="article">article</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>