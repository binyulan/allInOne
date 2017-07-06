<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>首页</title>
<link type="text/css" rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="lib/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<link type="images/x-icon" rel="shortcut icon" href="icon/person.ico" />
<script type="text/javascript" src="lib/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="lib/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>

<body style="background-color: #fff;">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div>
                <ul class="nav navbar-nav">
                    <c:forEach items="${modules}" var="module">
                        <c:set var="isDropDown" value="${module.children.size() > 0}"></c:set>
                        <li <c:if test="${isDropDown}">class="dropdown"</c:if>>
                            <a href="#" <c:if test="${isDropDown}">class="dropdown-toggle" data-toggle="dropdown"</c:if>>${module.name}<c:if test="${isDropDown}"><b class="caret"></b></c:if></a>
                            <c:if test="${isDropDown}">
                                <ul class="dropdown-menu">
                                    <c:forEach items="${module.children}" var="module">
                                        <li><a href="#">${module.name}</a></li>
                                    </c:forEach>
                                </ul>
                            </c:if>
                                
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </nav>
    <div id="presentation" class="container-fluid"></div>
</body>
</html>