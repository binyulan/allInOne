<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                    <li class="active"><a href="addArticleView">添加模块</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div id="presentation" class="container-fluid">
        <div class="row">
            <form class="form-horizontal" action="addModule" method="post">
                <div class="form-group">
                    <label for="title" class="col-sm-1 control-label">模块名称</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="name" name="name" placeholder="请输入模块名称">
                    </div>
                </div>
                <div class="form-group">
                    <label for="articleType" class="col-sm-1 control-label">父级模块</label>
                    <div class="col-sm-9">
                        <select class="form-control" id="parentModule" name="parentModule.id">
                            <option value="">请选择</option>
                            <c:forEach items="${modules}" var="module">
                                <option value="${module.id}">${module.name}</option>
                                <c:forEach items="${module.children}" var="module1">
                                    <option value="${module1.id}">${module1.name}</option>
                                 </c:forEach>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-1 col-sm-9">
                        <button type="submit" class="btn btn-default">添加模块</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>