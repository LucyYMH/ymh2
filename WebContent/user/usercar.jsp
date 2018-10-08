<%@page import="java.util.ArrayList,com.hpe.pojo.*"%>
<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!--  权限判断 -->
<c:if test="${empty user }">
<c:redirect url="/error.jsp"></c:redirect>
</c:if>

<!DOCTYPE html>
<html lang="en">
   <head>
    <meta charset="UTF-8">
		<title>用户列表</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	</head>
	<body>
	
		<div id="wrap">
			<div id="top_content">
				<div id="header">
					<div id="rightheader">
						<p>
							<br />
						</p>
					</div>

					<div id="topheader">
						<h1 id="title">
							<a href="#">WhatIsJava</a>
						</h1>
					</div>
					<div id="navigation">
					</div>
				</div>
				<div id="content">
					<p id="whereami">
					</p>
					<h1>
						用户列表
					</h1>		
					
		<table class="table">
				<tr class="table_header">
					
					<td rowspan="2">编号</td>
					<td rowspan="2">用户名</td>
					<td rowspan="2">密码</td>
					<td rowspan="2">性别</td>
					<td rowspan="2">爱好</td>
					<td colspan="2">汽车</td>
					<tr class="table_header">
						<td>汽车编号</td>
						<td>汽车名称</td>
					</tr>
				</tr>
					<%-- <% Page pa = (Page)request.getAttribute("page"); %> --%>
			<c:forEach items="${userVo }" var="userVo" varStatus="num">
				<tr class="row${num.index % 2 +1}">
					<td  rowspan="3">${userVo.id }</td>
					<td  rowspan="3">${userVo.username }</td>
					<td  rowspan="3">${userVo.pwd }</td>
					<td  rowspan="3"><c:if test="${userVo.sex == '1'}">男</c:if>
						<c:if test="${userVo.sex == '0'}">女</c:if></td>
					<td  rowspan="3">${userVo.love }</td>
					<c:forEach items="${userVo.car }" var="car" varStatus="num">
						<tr class="table_header">
							<td>
							<c:if test="${car.carId!=null}">${car.carId }</c:if>
							</td>
							<td>
							<c:if test="${car.carName!=null}">${car.carName }</c:if>
							</td>
						</tr>
					</c:forEach>
				</tr>
			</c:forEach>		
			</table>
				</div>
			</div>

			<div id="footer">
				<div id="footer_bg">whatisJavaWeb@hope-pact.com</div>
			</div>
		</div>
	</body>

<script type="text/javascript" src='<c:url value="/js/jquery-1.11.3.min.js" />'></script>
</html>