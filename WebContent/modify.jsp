<%@page contentType="text/html;charset=utf-8"%>
<% 
	String path = request.getContextPath(); 
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
	// http :// localhost:8080/v1_LoginDemo_servlet
%> 
<!DOCTYPE html>
<html lang="en">
<head>
	<title>修改用户</title>
    <meta charset="UTF-8">
    <base href="<%=basePath %>">
	<link rel="stylesheet" type="text/css" href="css/style.css" />
	<script type="text/javascript" src="js/jquery-3.1.1.js"></script>
	<script type="text/javascript" src="js/calendar.js"></script>
	<link type="text/css" rel="stylesheet" href="css/calendar-blue.css"></link>
	<script type="text/javascript">
	
		$(function(){
			/* 回填性别 */
			//拿到性别的标签
			var sexInput=$("input[name='sex']");
			//拿到选中的值，从request域中拿
			var sexValues="${user.sex}";
				$.each(sexInput,function(){
					//判断选中的值是否和标签中的值一致，一致则选中
					if(sexValues=$(this).val()){
						$(this).prop("checked",true);
					}
			});
			/* 回填爱好 */
			//拿到所有的爱好的标签
			var hobbys=$("input[name='love']");
			//拿到所选中的值，从request中
			var hobby="${user.love}";
			//alert(hobby);
			//将拿到的值切割
			var h=hobby.split(",");
			//var check=$("input[name='love']:checked");
			//然后遍历所有的爱好的标签，判断值是否和选中的值一样，一样的话则选中
			$.each(h,function(i,n){
				//alert(n);
				$.each(hobbys,function(){
					if($(this).val()==n){
						$(this).prop("checked",true);
					}
				});
			});
		});
	</script>
</head>
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
						修改用户
					</h1>
					<p>
						&nbsp;
					</p>

			<form action="${pageContext.request.contextPath }/update" method="post" >
				<table>
					<!-- 提供隐藏字段 -->
					<tr>
						<td><input type="hidden" name="id" value="${user.id}"></td>
					</tr>
					<tr>
						<td><input type="hidden" name="createDate" value="${user.createDate}"></td>
					</tr>
					<tr>
						<td>用户名：</td>
						<td><input type="text" name="username" value="${user.username}"></td>
					</tr>
					<tr>
						<td>密码：</td>
						<td><input type="password" name="pwd" value="${user.pwd}"></td>
					</tr>
					<tr>
						<td>确认密码：</td>
						<td><input type="password" name="pwd1"></td>
					</tr>
					<tr>
						<td>性别：</td>
						<td>
							<input type="radio" name="sex" value="1"/>男
							<input type="radio" name="sex" value="0" />女
							<span id="sex_span"></span>
						</td>
					</tr>
					<tr>
						<td>个人爱好：</td>
						<td id="hobby">
							<input type="checkbox" name="love" value="文学" />文学
							<input type="checkbox" name="love" value="影视" />影视
							<input type="checkbox" name="love" value="音乐" />音乐
							<input type="checkbox" name="love" value="体育" />体育
						</td>
					</tr>
					<tr>
						<td>出生日期：</td>
						<td>
							 <input type="text" id="birthday" name="birthday" value="${user.birthday }"/>
						</td>
					</tr>
					<tr>
						<td>地址：</td>
						<td><input type="text" name="address" value="${user.address }" /></td>
					</tr>
					<tr>
						<td>邮箱：</td>
						<td><input type="text" name="email" value="${user.email}" /></td>
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
<script type="text/javascript" src='js/jquery-1.8.3.min.js'></script>

<script type="text/javascript">

Calendar.setup({
inputField : "birthday",
ifFormat : "%Y-%m-%d",
showsTime : true,
timeFormat : "24"
});

// jquery实现 性别和爱好的回显。


</script>
</html>
