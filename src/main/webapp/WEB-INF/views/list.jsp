<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
    pageContext.setAttribute("ctx", request.getContextPath());
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工列表</title>
<script type="text/javascript" src="${ctx}/static/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${ctx}/static/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" href="${ctx }/static/bootstrap/css/bootstrap.css" >
</head>
<body>
<div class="container">
    <!-- 标题 -->
    <div class="row">
        <div class="col-md-12">
            <h1>员工列表</h1>
        </div>
    </div>
    <!-- 按钮 -->
    <div class="row">
          <div class="col-md-4">
                <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
                <button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
           </div>
     </div>
     <br>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-bordered table-hover">
                <thead>
	                <tr>
	                    <th><input type="checkbox" id="check_all"/></th>
	                    <th>姓名</th>
	                    <th>性别</th>
	                    <th>邮箱</th>
	                    <th>部门</th>
	                    <th>操作</th>
	                </tr>
                </thead>
                <c:forEach items="${pageInfo.list}" var="emp">
	                <tr>
	                    <td><input type="checkbox" id="${emp.empId}"/></td>
	                    <td>${emp.empName}</td>
	                    <td>${emp.gender=="M"?"男":"女" }</td>
	                    <td>${emp.email}</td>
	                    <td>${emp.department.deptName}</td>
	                    <td width="150px">
	                       <button class="btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑
                           </button>
                            <button class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除
                            </button>
                        </td>
	                </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 text-left" style="height:79px;padding: 20px;">当前第 <strong>${pageInfo.pageNum }</strong> 页,总共 <strong>${pageInfo.pages } </strong>页,总 <strong>${pageInfo.total } </strong>条记录</div>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination" style="margin-left: 45%;">
                    <li><a href="${ctx }/emps?cp=1">首页</a></li>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li><a href="${ctx }/emps?cp=${page_Num-1}" aria-label="Previous"><span aria-hidden="true">&laquo;</a></li>
                    </c:if>
                    <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                        <c:if test="${page_Num == pageInfo.pageNum }">
                            <li class="active"><a href="#">${page_Num}</a></li>
                        </c:if>
                        <c:if test="${page_Num != pageInfo.pageNum }">
                            <li ><a href="${ctx }/emps?cp=${page_Num}">${page_Num}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage}">
                        <li><a href="${ctx }/emps?cp=${page_Num}+1" aria-label="Next"> <span aria-hidden="true">&raquo;</a></li>
                    </c:if>
                    <li><a href="${ctx }/emps?cp=${pageInfo.pages }">尾页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>