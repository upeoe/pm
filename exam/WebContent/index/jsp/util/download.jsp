<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>试卷管理分析系统(学生端)</title>

<!-- Bootstrap Core CSS -->
<link
	href="<c:url value='/index/bower_components/bootstrap/dist/css/bootstrap.min.css'/>"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link
	href="<c:url value='/index/bower_components/metisMenu/dist/metisMenu.min.css '/>"
	rel="stylesheet">

<!-- Timeline CSS -->
<link href="<c:url value='/index/dist/css/timeline.css '/>"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="<c:url value='/index/dist/css/sb-admin-2.css'/>"
	rel="stylesheet">

<!-- Morris Charts CSS -->
<link
	href="<c:url value='/index/bower_components/morrisjs/morris.css'/>"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="<c:url value='/index/bower_components/font-awesome/css/font-awesome.min.css'/>"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<!-- jQuery -->
	<script src="<c:url value='/index/bower_components/jquery/dist/jquery.min.js '/>"></script>
	<link rel="stylesheet" href="<c:url value='/index/css/drop-down.css'/>" />
	<script src="<c:url value='/index/js/jquery-ui.min.js'/>"></script>
	<script src="<c:url value='/index/js/select-widget-min.js'/>"></script>

	<style type="text/css">
		.form{
			width:200px;
			margin:50px auto;
		}
		.but{
			margin:0 auto;
		}
	</style>
</head>

<body>
		<div class="sec">
			<!-- 下拉选择框 -->
			<form action="" method="get" class="form">
				<select name="drop1" class="ui-select">
					<option value="1">一年级</option>
					<option value="2">二年级</option>
					<option value="3">三年级</option>
					<option selected value="4">四年级</option>
					<option value="5">五年级</option>
					<option value="6">六年级</option>
				</select>
			</form>
		</div>
		<div class="but text-center">
			<button type="button" class="btn btn-info">导出</button>
		</div>
	<script type="text/javascript">
		//下拉选择框
		$(document).ready(function(){		
			$(".ui-select").selectWidget({
				change       : function (changes) {
					return changes;
				},
				effect       : "slide",
				keyControl   : true,
				speed        : 200,
				scrollHeight : 250
			});
			
		});
	</script>
	<!-- /#wrapper -->

	<!-- Bootstrap Core JavaScript -->
	<script
		src="<c:url value='/index/bower_components/bootstrap/dist/js/bootstrap.min.js'/>"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script
		src="<c:url value='/index/bower_components/metisMenu/dist/metisMenu.min.js' />"></script>

	<!-- Morris Charts JavaScript -->
	<script
		src="<c:url value='/index/bower_components/raphael/raphael-min.js '/>"></script>
	<script
		src="<c:url value='/index/bower_components/morrisjs/morris.min.js'/>"></script>

	<!-- Custom Theme JavaScript -->
	<script src="<c:url value='/index/dist/js/sb-admin-2.js'/>"></script>

</body>

</html>