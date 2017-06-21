<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="Java, Javascript, Maven"/>
<meta name="description" content="Java 全栈" />
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
                    <li class="active"><a href="index">首页</a></li>
                    <c:forEach items="${indexDto.articleTypes}" var="articleType">
                        <li ><a href="index">${articleType}</a></li>
                    </c:forEach>
                   
                </ul>
            </div>
        </div>
    </nav>
    <div id="presentation" class="container-fluid">
        <div class="row">
            <c:forEach items="${indexDto.articleTypes}" var="articleType">
                <div id="recentLinux" class="col-sm-6">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">${articleType }</h3>
                        </div>
                        <ul class="list-group">
                            <c:forEach items="${indexDto.articles}" var="article">
                                <c:if test="${article.articleType==articleType}">
                                    <li class="list-group-item"><a
                                        href="article/${article.id}">${article.title}</a>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>