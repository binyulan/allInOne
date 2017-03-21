<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                    <li sclass="active"><a href="index">Linux</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div id="presentation" class="container-fluid">
        <div class="row">
            <div id="recentLinux" class="col-sm-6">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">Linux</h3>
                    </div>
                    <div class="panel-body">
                        <c:forEach items="${articles}" var="article">
                            <a href="article/${article.id}">${article.title}</a>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>