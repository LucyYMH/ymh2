<%@page contentType="text/html;charset=utf-8"%>
<% 
	String path = request.getContextPath(); 
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
	// http :// localhost:8080/v1_LoginDemo_servlet
%> 
<!DOCTYPE html>
<html lang="en">
<head>
	<title>注册用户</title>
    <meta charset="UTF-8">
    <base href="<%=basePath %>">
   <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="css/style.css" />
	<script type="text/javascript" src="js/calendar.js"></script>
	<link type="text/css" rel="stylesheet" href="css/calendar-blue.css"></link>
</head>
<script type="text/javascript">
//验证用户名是否存在
$(function(){
	$("input[name='username']").blur(function(){
		//请求的路径
		var url="${pageContext.request.contextPath}/checkUsername";
		//请求的参数
		var params={"username":$(this).val()}
		//以post的方式请求
		$.post(url,params,function(data){
			//如果返回的是true，存在
			//alert(data.exit);
			if(data.exit){
				//则显示用户名已经存在
				$("#error").html("用户名已经存在");
				//并且将注册按钮设为不可用
				$("input[name='update']").prop("disabled","disabled");
			}else{
				//如果不存在，则不提示
				//alert("1");
				$("#error").html("");
				//将按钮的禁用解除
				$("input[name='update']").prop("disabled",false);
				
			}
		},"json");
	});
});
</script>
<body>
	<div id="wrap">
		<div id="top_content">

			<div id="header">
				<div id="rightheader">
					<p>
						2018年8月 <br />
					</p>
				</div>

				<div id="topheader">
					<h1 id="title">
						<a href="#">我爱登陆</a>
					</h1>
				</div>
				<div id="navigation"></div>
			</div>

					<div id="content">
					<p id="whereami">
					</p>
					<h1>
						注册新用户
					</h1>
					<p>
						&nbsp;
					</p>

			<form action="register" method="post" >
			<div> <font color="red" id="error"></font></div>
				<table>
					<tr>
						<td>用户名：</td>
						<td><input type="text" name="username" value=""></td>
					</tr>
					<tr>
						<td>密码：</td>
						<td><input type="password" name="pwd"></td>
					</tr>
					<tr>
						<td>确认密码：</td>
						<td><input type="password" name="pwd1"></td>
					</tr>
					<tr>
						<td>性别：</td>
						<td>
							<input type="radio" name="sex" value="1">男
							<input type="radio" name="sex" value="0">女
							<span id="sex_span"></span>
						</td>
					</tr>
					<tr>
						<td>个人爱好：</td>
						<td>
							<input type="checkbox" name="love" value="文学">文学
							<input type="checkbox" name="love" value="影视">影视
							<input type="checkbox" name="love" value="音乐">音乐
							<input type="checkbox" name="love" value="体育">体育
						</td>
					</tr>
					<tr>
						<td>出生日期：</td>
						<td>
							 <input type="text" id="birthday" name="birthday" >
						</td>
					</tr>
					<tr>
						<td>地址：</td>
						<td><input type="text" name="address" value=""></td>
					</tr>
					<tr>
						<td>邮箱：</td>
						<td><input type="text" name="email" value=""></td>
					</tr>
					<tr>
						<td colspan="2">
						<input type="submit" name="update" value="提交" class="button">
						<input type="reset" name="reset" value="重置" class="button">
						</td>
					</tr>
				</table>
			</form>
				</div>
			</div>

		<div id="footer">
			<div id="footer_bg">whatisJavaWeb@hope-pact.com</div>
		</div>
	</div>
</body>

<script type="text/javascript">

Calendar.setup({
inputField : "birthday",
ifFormat : "%Y-%m-%d",
showsTime : true,
timeFormat : "24"
});
</script>
</html>
