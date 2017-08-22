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
<script type="text/javascript" src="../lib/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="../lib/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript" src="../lib/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
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
                    <label for="parentModule" class="col-sm-1 control-label">父级模块</label>
                    <div class="col-sm-9">
                        <select class="form-control" id="parentModule" name="parentModule.id">
                            <option value="">请选择</option>
                            <c:forEach items="${modules}" var="module">
                                <option value="${module.id}">${module.name}</option>
                                <c:forEach items="${module.children}" var="module">
                                    <option value="${module.id}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${module.name}</option>
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
        <div class="row">
            <form class="form-horizontal" action="modifyModule" method="post">
                <div class="form-group">
                    <ul>
                        <c:forEach items="${modules}" var="module">
                            <li value="${module.id}" data-toggle="collapse" data-target="[data-group=${module.id}]" style="list-style-type:none; cursor: pointer;">
                                <div class="label label-default"><c:if test="${module.children.size() > 0}">+ </c:if>${module.name}</div>
                                <ul data-name="innerUl">
                                    <c:forEach items="${module.children}" var="subModule">
                                        <li data-group="${module.id}" class="collapse" value="${subModule.id}">
                                            <span class="label label-default">${subModule.name}</span>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <script type="text/javascript">
                    $( "ul" ).sortable();
                    $("ul[data-name='innerUl']").bind("click", function(){return false})
                </script>
                <div class="form-group">
                    <div class="col-sm-offset-1 col-sm-9">
                        <button type="submit" class="btn btn-default">修改模块</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>