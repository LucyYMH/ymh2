<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
	<title>登入系统</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
</head>
<body>
	<div id="wrap">
		<div id="top_content">
			<div id="topheader">
				<h1 id="title">
					<a href="#">我爱登陆HPE</a>
				</h1>
			</div>
		<div id="navigation"></div>
		<div id="content">
				<p id="whereami"></p>
				<h1>登入系统</h1>
				<p>&nbsp;</p>
					<form action="${pageContext.request.contextPath }/user/login" method="post">
					<table  class="form_table">
						<tr>
							<td>用户名:</td>
							<td>
								<input type="text" name="username" class="inputgri" value="" />
							</td>
						</tr>
						<tr>
							<td>密码:</td>
							<td>
								<input type="password" name="pwd" class="inputgri" />
							</td>
						</tr>

					</table>

					<p>
						<input type="submit" class="button" value="提交 &raquo;" /> <a
							href="${pageContext.request.contextPath}/register.jsp">注册新用户</a>
					</p>
					<p>
					</p>
					</form>

			</div>
		</div>
		<div id="footer">
			<div id="footer_bg">whatisJavaWeb@hope-pact.com</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	// 获取url中参数
	var flag = ${param.flag};
	if(flag == 1){
		alert("登录失败,请重新登录！");
	}
	if(flag == 2){
		alert("注册成功，请点击登录。");
	}
</script>
</html>