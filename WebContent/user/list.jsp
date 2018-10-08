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
					<h3>在线人数 ：${applicationScope.number}</h3>
		<!-- 模糊查询表单 -->
		<form name="form1" method="post">
			<table class="form_table">
				<tr><td>用户名</td>
					<td><input type="text" name="username" value="${formUser.username }"/></td>
					<td>性别</td>
				    <td><select name="sex">
				    		<option value="">请选择</option>
				    		<c:choose>
				    			<c:when test="${formUser.sex == '1' }">
				    				<option value="1" selected="selected">男</option>
				    			</c:when>
				    			<c:otherwise>
				    				<option value="1">男</option>
				    			</c:otherwise>
				    		</c:choose>
				    		
				    		<c:choose>
				    			<c:when test="${formUser.sex == '0' }">
				    				<option value="0" selected="selected">女</option>
				    			</c:when>
				    			<c:otherwise>
				    				<option value="0">女</option>
				    			</c:otherwise>
				    		</c:choose>
				    		
				    	</select></td>
				    <td><a href="${pageContext.request.contextPath }/add.jsp"><input type="button" value="添加" ></a></td>
				    <!-- <td><input type="button" value="用户的车" onclick="UserCar()"></td> -->
				    <td><input type="button" value="用户的身份证" onclick="UserCard()"></td>
				</tr>
				<tr>
					<td>地址</td><td><input type="text" name="address" value="${formUser.address }"/></td>
					<td>创建时间</td><td><input type="text" name="createDate" id="createDate" value="${formUser.createDate }" /> </td>					
					<td><input type="reset" value="重置" class="button"/>
						<input type="button" value="查询" onclick="javascript:jump()" class="button"/></td>
						<td><input type="button" value="删除选中的记录" onclick="javascript:delAll()" ></td>
				</tr>
			</table>
		</form>	
					
					
		<table class="table">
				<tr class="table_header">
					<td>选择</td>
					<td>编号</td>
					<td>用户名</td>
					<td>密码</td>
					<td>性别</td>
					<td>爱好</td>
					<td>地址</td>
					<td>邮编</td>
					<td>创建时间</td>
					<td>操作</td>
					</tr>
					<%-- <% Page pa = (Page)request.getAttribute("page"); %> --%>
			<c:forEach items="${list}" var="user" varStatus="num">
				<tr class="row${num.index % 2 +1}">
					<td><input type="checkbox" name="ids" value="${user.id }"></td>
					<td>${user.id }</td>
					<td>${user.username }</td>
					<td>${user.pwd }</td>
					<td><c:if test="${user.sex == '1'}">男</c:if>
						<c:if test="${user.sex == '0'}">女</c:if></td>
					<td>${user.love }</td>
					<td>${user.address }</td>
					<td>${user.email }</td>
					<td>${user.createDate }</td>
					<td>
				<a href="${pageContext.request.contextPath }/user/UserServlet?method=getUserById&id=${user.id}">修改</a> 
				<a href="javascript:delUser(${user.id })">删除</a></td>
				</tr>
			</c:forEach>		
			</table>
		<%-- <p>
			<c:if test="${page.curPage==1 }">首页</c:if>
			<c:if test="${page.curPage > 1 }"><a href="javascript:jump(1)">首页</a></c:if>
			
			<c:if test="${page.curPage==1 }">上一页</c:if>
			<c:if test="${page.curPage > 1 }"><a href="javascript:jump(${page.curPage-1 })">上一页</a></c:if>
			
			
			<c:if test="${page.curPage==page.totalPage }">下一页</c:if>
			<c:if test="${page.curPage<page.totalPage }"><a href="javascript:jump(${page.curPage+1 })">下一页</a></c:if>
			
			
			<c:if test="${page.curPage==page.totalPage }">尾页</c:if>
			<c:if test="${page.curPage<page.totalPage }"><a href="javascript:jump(${page.totalPage })">尾页</a></c:if>
			
			   共${page.totalPage }页   当前页${page.curPage }  总共${page.rows }条数据
			   
		</p> --%>
			
			
				</div>
			</div>

			<div id="footer">
				<div id="footer_bg">whatisJavaWeb@hope-pact.com</div>
			</div>
		</div>
	</body>

<script type="text/javascript" src='<c:url value="/js/jquery-1.11.3.min.js" />'></script>

<script type="text/javascript">
//分页查询事件
function jump(){
	// 通过url链路的方式传递。（！！！！！！ 不建议使用的方式）
	// 我们要使用下面的方式：
	//alert(curpage);
	document.form1.action = "<%=request.getContextPath()%>/user/select";
	document.form1.submit();
}
// 删除方法
function delUser(userId){

	var flag = window.confirm("是否删除");
	if(flag ){
		// 模糊查询的数据传递到后台
		document.form1.action = "<%=request.getContextPath()%>/user/UserServlet?method=deleteUser"
				+"&userId="+userId;
		document.form1.submit();
	}
}
//批量删除
//首先拿到要删除的用户的所有的id

   
<%-- function delAll(){
	var userIds=[];
	$("input[name='check']:checked").each(function(i){
		userIds[i]=$(this).val();
	});
	//alert(userIds);
	document.form1.action = "<%=request.getContextPath()%>/user?method=deleteUsers"
		+"&userIds="+userIds;
	document.form1.submit();
} --%>
function delAll(){
	var ids=[];
		$("input[name='ids']:checked").each(function(i){
			ids[i]=$(this).val();
		});
	var jsonData={
			ids:ids
	}
	//alert(ids);
	$.ajax({
		url:"${pageContext.request.contextPath}/user/deleAll",
		data:jsonData,
		type:"post",
		dataType:"json",
		success:function(data){
			if(data.res==1){
			alert("删除成功");
			window.location.href="${pageContext.request.contextPath}/user/select";
			}
		}
	});
	
}
//查看用户和汽车
function UserCar(){
	document.form1.action = "<%=request.getContextPath()%>/user?method=getUserCars";
	document.form1.submit();
}
//查看用户身份证号
function UserCard(){
	alert("1");
	document.form1.action = "<%=request.getContextPath()%>/user?method=getUserCard";
	document.form1.submit();
}
//修改方法
function updateUser(userId){
	
	// 模糊查询的数据传递到后台
	document.form1.action = "<%=request.getContextPath()%>/user/UserServlet?method=modify"
			+"&userId="+userId;
	document.form1.submit();
}

</script>
</html>