<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>添加表定义</title>
<link type="text/css" rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link type="images/x-icon" rel="shortcut icon" href="../../icon/person.ico" />
<script type="text/javascript" src="../../lib/jquery-3.1.1.min.js"></script>
</head>

<body style="background-color: #fff;">
    <div id="presentation" class="container-fluid">
        <div class="row">
            <form class="form-horizontal" action="defineTable" method="post">
                <div class="form-group">
                    <label for="title" class="col-sm-1 control-label">表描述</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="description" name="description" placeholder="描述信息">
                    </div>
                </div>
                <div class="form-group" id="columnDef">
                    <label for="title" class="col-sm-1 control-label">列名称</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="columnDefinitions[0].label" placeholder="请输入列名称">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-1 col-sm-9">
                        <button type="button" id="addColumn" class="btn btn-default">添加列</button>
                    </div>
                </div>
                <script type="text/javascript">
                    $("#addColumn").click(function(){
                        var cloned = $("#columnDef div:last").clone();
                        var name = cloned.find("input").attr("name");
                        var index = name.substring(18, 19);
                        cloned.find("input").attr("name", "columnDefinitions[" + (parseInt(index) + 1) + "].label")
                        cloned.find("input").val("");
                        cloned.addClass("col-sm-offset-1");
                        cloned.css("margin-top", "10px");
                        $("#columnDef div:last").after(cloned);
                    });
                </script>
                <div class="form-group">
                    <label for="modules" class="col-sm-1 control-label">所属模块</label>
                    <div class="col-sm-9">
                        <select multiple class="form-control" id="modules" name="moduleIds">
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
                        <button type="submit" class="btn btn-default">添加表定义</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>