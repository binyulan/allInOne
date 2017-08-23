<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>首页</title>
<link type="text/css" rel="stylesheet" href="/lib/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<link type="images/x-icon" rel="shortcut icon" href="/icon/person.ico" />
<script type="text/javascript" src="/lib/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/lib/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>

<body style="background-color: #fff;">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div>
                <ul class="nav navbar-nav">
                    <c:forEach items="${modules}" var="module">
                        <c:set var="isDropDown" value="${module.children.size() > 0}"></c:set>
                        <li <c:if test="${isDropDown}">class="dropdown"</c:if>>
                            <a 
                                <c:if test="${module.tableDefinitions.size() > 0}">href="/resourcemanager/viewData/${module.tableDefinitions.iterator().next().id}"</c:if>
                                <c:if test="${isDropDown}">class="dropdown-toggle" data-toggle="dropdown"</c:if>>${module.name}<c:if test="${isDropDown}"><b class="caret"></b></c:if></a>
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
    <div id="presentation" class="container-fluid">
        <div class="btn-group">
            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#addData">添加数据</button>
            <button type="button" class="btn btn-default">修改数据</button>
            <button type="button" class="btn btn-default">删除数据</button>
        </div>
        <table class="table table-striped table-hover table-bordered table-responsive">
            <caption>${tableDefinition.tableName}</caption>
            <thead>
                <tr>
                    <c:forEach items="${tableDefinition.columnDefinitions}" var="columnDefinition">
                        <th>${columnDefinition.label}</th>
                    </c:forEach>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${tableData}" var="records">
                    <tr>
                        <c:forEach items="${records}" var="record">
                            <td>${record}</td>
                        </c:forEach>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div id="addData" class="modal fade" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">添加数据</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" action="/resourcemanager/addData/${tableDefinition.id}" id="addDataForm" method="post">
                            <c:forEach items="${tableDefinition.columnDefinitions}" var="columnDefinition">
                                <div class="form-group">
                                    <label for="title" class="col-sm-2 control-label">${columnDefinition.label}</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="${columnDefinition.columnName}" placeholder="请输入值">
                                    </div>
                                </div>
                            </c:forEach>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="$('#addDataForm').submit();">提交更改</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
    </div>
</body>
</html>