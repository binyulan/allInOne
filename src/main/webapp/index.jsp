<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
    content="width=device-width, initial-scale=1.0">
<title>首页</title>
<link type="text/css" rel="stylesheet"
    href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link type="images/x-icon" rel="shortcut icon" href="icon/person.ico" />
</head>

<body style="background-color: #f5f5f5;">
    <nav class="navbar navbar-inverse" role="navigation">
        <div class="container-fluid">
            <div>
                <ul class="nav navbar-nav">
                    <li data-id="java" class="active"><a href="java">Java</a></li>
                    <li data-id="spring"><a href="spring">Spring</a></li>
                    <li data-id="hiberante"><a href="hiberante">Hiberante</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div id="presentation" class="container-fluid">
        <div id="recentJava">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Java</h3>
                </div>
                <div class="panel-body">
                    <a href="article">article</a>
                </div>
            </div>
        </div>
        <div id="recentSpring">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Spring</h3>
                </div>
                <div class="panel-body">
                    <a href="article">article</a>
                </div>
            </div>
        </div>
    </div>
    
</html>