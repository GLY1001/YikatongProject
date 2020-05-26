<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<title>管理员</title>
<!-- 引入css样式文件 -->
<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
<!-- MetisMenu CSS -->
<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet" />
<!-- DataTables CSS -->
<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet" />
<!-- Custom CSS -->
<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet" />
<!-- Custom Fonts -->
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/echarts.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>

</head>
<body class="bg01">
		
	<header class="header">
		<h3>一卡通交易数据分析</h3>
		<li>
			<a href="index.action" class="a0">总体分析</a>
			<a href="teacher.action" class="a0">教职工分析</a>
			<a href="student.action" class="a0">学生分析</a>
			<a href="manager.action" class="a1">查询学生消费信息</a>
			<a href="login.action" class="a0">退出登录</a>
		</li>
	</header>
	
	<div>
		<!-- 列表查询部分  start-->
		<div id="page-wrapper" style="width:100%;height: 100%;position: absolute;top: 10%;	right:3px;">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">消费记录</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="panel panel-default">
				<div class="panel-body">
					<form class="form-inline" method="get" action="${pageContext.request.contextPath }/getStudentByXmAndSfrzh.action">
						<div class="form-group">
							<label for="customerName">学生学号：</label> 
							<input type="text" value="${sfrzh}" class="form-control" id="sfrzh" name="sfrzh" />
						</div>
						<button type="submit" class="btn btn-primary">查询</button>
					</form>
					
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">客户信息列表</div>
						<!-- /.panel-heading -->
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>商户名称</th>
									<th>消费类别</th>
									<th>交易类型</th>
									<th>收费人账号</th>
									<th>姓名</th>
									<th>卡号</th>
									<th>交易日期</th>
									<th>交易时间</th>
									<th>交易金额</th>
									<th>卡余额</th>
									<th>系统名称</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.rows}" var="row">
									<tr>
										<td>${row.shmc}</td>
										<td>${row.xflb}</td>
										<td>${row.jylx}</td>
										<td>${row.sfrzh}</td>
										<td>${row.xm}</td>
										<td>${row.kh}</td>
									    <td>${row.jyrq}</td>
									    <td>${row.jysj}</td>
									    <td>${row.jyje}</td>
									    <td>${row.kye}</td>
									    <td>${row.xtmc}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="col-md-12 text-right">
							<itheima:page url="${pageContext.request.contextPath }/getStudentByXmAndSfrzh.action" />
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
		<!-- 列表查询部分  end-->
	</div>
</div>
</body>
</html>