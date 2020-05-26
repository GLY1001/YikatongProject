<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en" class="no-js">
<head>
<title>登录页面</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<link href="${pageContext.request.contextPath}/css/normalize.css" type=text/css rel=stylesheet>
<link href="${pageContext.request.contextPath}/css/demo.css" type=text/css rel=stylesheet>
<link href="${pageContext.request.contextPath}/css/component.css" type=text/css rel=stylesheet>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
</head>
<body>
<div class="container demo-1">
	<div class="content">
		<div id="large-header" class="large-header">
			<canvas id="demo-canvas"></canvas>
			<div class="logo_box">
				<h3>欢迎使用一卡通消费记录查询系统</h3>
				<font color="red">
					 <%-- 错误提示信息--%>
					 <span id="message">${msg}</span>
				</font>
				<form action="${pageContext.request.contextPath}/login.action" name="f" method="post">
					<div class="input_outer">
						<span class="u_user"></span>
						<input name="username" id="username" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入账户"  required>
					</div>
					<div class="input_outer">
						<span class="us_uer"></span>
						<input name="password" id="password" class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;"value="" type="password" placeholder="请输入密码"  required>
					</div>
					<div class"an">
					<input class="pt" type="radio" name="kind" value="普通用户" id="kind" checked>普通用户 
					<input class="gl" type="radio" name="kind" value="管理员" id="kind">管理员
					</div>
					<div class="mb2">
						<input class="act-but submit" type="submit" value="登录">
						<input class="act-but reset" type="reset" value="重置">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<div style="text-align:center;">
<script src="${pageContext.request.contextPath}/js/TweenLite.min.js"></script>
<script src="${pageContext.request.contextPath}/js/EasePack.min.js"></script>
<script src="${pageContext.request.contextPath}/js/rAF.js"></script>
<script src="${pageContext.request.contextPath}/js/demo-1.js"></script>
</div>
</body>
</html>
