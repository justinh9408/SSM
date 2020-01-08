<%@ page language="java"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<title>员工列表</title>
</head>
<body>

    <div class='container'>
        <div class='row'>
            <div class='col-md-12'>
                <h1>SSM-CRUD</h1>
            </div>
        </div>
        <div class='row'>
            <div class="col-md-4 offset-md-8">
                <button type="button" class="btn btn-primary">新增</button>
                <button type="button" class="btn btn-danger">删除</button>
            </div>
        </div>
        <div class='row'>
            <div class='col-md-12'>
                <table class='table table-hover'>
                    <tr>
                        <th>ID</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>department</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${pageInfo.list}" var="emp">
                        <tr>
                            <th>${emp.getId()}</th>
                            <th>${emp.empName}</th>
                            <th>${emp.gender=='M'? "男":"女"}</th>
                            <th>${emp.email}</th>
                            <th>${emp.department.dptName}</th>
                            <th>
                                <button class="btn btn-primary btn-sm">
                                    更改
                                </button>
                                <button class="btn btn-danger btn-sm">
                                    删除
                                </button>
                            </th>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>

        <div class='row'>
            <div class='col-md-6'>
                当前第${pageInfo.pageNum}页，共${pageInfo.pages}页，总共${pageInfo.total}条记录
            </div>


            <div class='col-md-6'>
                <nav aria-label="...">
                      <ul class="pagination">
                        <c:if test="${!pageInfo.isFirstPage}">
                            <li class="page-item"><a class="page-link" href='emps?pn=1'>首页</a></li>
                        </c:if>
                        <c:if test="${pageInfo.hasPreviousPage}">
                             <li class="page-item">
                                <a class="page-link" href="emps?pn=${pageInfo.pageNum-1}" tabindex="-1" aria-disabled="true">Previous</a>
                             </li>
                        </c:if>

                        <c:forEach items="${pageInfo.navigatepageNums}" var="pn">
                            <c:if test="${pn == pageInfo.pageNum}">
                               <li class="page-item active" aria-current="page"><a class="page-link" href="#">${pn}</a></li>
                            </c:if>
                            <c:if test="${pn != pageInfo.pageNum}">
                               <li class="page-item"><a class="page-link" href="emps?pn=${pn}">${pn}</a></li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${pageInfo.hasNextPage}">
                            <li class="page-item">
                                <a class="page-link" href="emps?pn=${pageInfo.pageNum+1}">Next</a>
                            </li>
                        </c:if>
                        <c:if test="${!pageInfo.isLastPage}">
                            <li class="page-item"><a class="page-link" href='emps?pn=${pageInfo.pages}'>末页</a></li>
                        </c:if>
                      </ul>
                </nav>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>
