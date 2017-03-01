<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>首页</title>
<link type="text/css" rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link type="images/x-icon"rel="shortcut icon"  href="icon/person.ico" />
</head>


<body style="background-color:#f5f5f5">
<nav class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid">
        <div>
            <ul class="nav navbar-nav">
                <li data-id="JAVA" class="active"><a href="#JAVA">Java</a></li>
                <li data-id="JAVASCRIPT"><a href="#JAVASCRIPT">Javascript</a></li>
                <li data-id="SPRING"><a href="#JAVASCRIPT">Spring</a></li>
                <li data-id="BACKBONEJS"><a href="#JAVASCRIPT">Hiberante</a></li>
                <li>
                    <form class="navbar-form">
                        <div class="form-group">
                            <input id="searchText" type="text" onkeypress="if(event.keyCode == 13)return false" class="form-control" placeholder="搜索">
                        </div>
                        <button id="searchArticle" type="button" class="btn btn-default">搜索</button>
                    </form>
                </li>
            </ul>
        </div>
    </div>
</nav>
</html>