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
					<td>选择</td>
					<td>编号</td>
					<td>用户名</td>
					<td>密码</td>
					<td>身份证号</td>
					<td>操作</td>
					</tr>
					<%-- <% Page pa = (Page)request.getAttribute("page"); %> --%>
			<c:forEach items="${userCard }" var="userCard" varStatus="num">
				<tr class="row${num.index % 2 +1}">
					<td><input type="checkbox" name="check" value="${user.id }"></td>
					<td>${userCard.id }</td>
					<td>${userCard.username }</td>
					<td>${userCard.pwd }</td>
					<td>${userCard.card.idCard }</td>
					<td>
				<a href="${pageContext.request.contextPath }/user/UserServlet?method=getUserById&id=${user.id}">修改</a> 
				<a href="javascript:delUser(${user.id })">删除</a></td>
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