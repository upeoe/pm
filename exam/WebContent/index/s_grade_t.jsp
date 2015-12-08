<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>试卷管理分析系统(教师端)</title>

    <!-- Bootstrap Core CSS -->
    <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="dist/css/timeline.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="bower_components/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="css/drop-down.css" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	    <!-- jQuery -->
    <script src="bower_components/jquery/dist/jquery.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/select-widget-min.js"></script>
	<style>
		#page-wrapper{
			//border:1px solid #e7e7e7;
		}
		.pass{
			border:1px solid #aaa;
			width:200px;
			height:100px;
			border-radius:10px;
			margin-left:100px;
			margin-top:50px;
			margin-bottom:50px;
			opacity:0.5;
			float:left;
		}
		.pass:hover{
			opacity:1;
		}
		.best{
			border:1px solid #aaa;
			width:200px;
			height:100px;
			border-radius:10px;
			margin-left:100px;
			margin-top:50px;
			margin-bottom:50px;
			opacity:0.5;
			float:left;
		}
		.best:hover{
			opacity:1;
		}
		.glyphicon{
			margin-top:30px;
			margin-left:30px;
			font-size:30px;
			float:left;
		}
		.p{
			font-size:20px;
			margin-left:120px;
			margin-top:13px;
		}
		.img{
			 width:100px;
			 height:100px;
			 float:left;
		}
		.lab{
			width:10px;
			height:10px;
			background-color:blue;
			left:340px;
			top:5px;
			position:absolute;
		}
		.span{
			left:340px;
			position:relative;
		}
		.lab1{
			width:10px;
			height:10px;
			background-color:rgba(255,30,30,1);
			left:80px;		
			top:5px;
			position:absolute;
		}
		.stu{
			left:80px;
			position:relative;
		}
		.lab2{
			width:10px;
			height:10px;
			background-color:rgba(70,161,248,1);
			left:273px;		
			top:5px;
			position:absolute;
		}
		.max{
			left:240px;
			position:relative;
		}
		.lab3{
			width:10px;
			height:10px;
			background-color:rgba(251,223,30,1);
			left:463px;		
			top:5px;
			position:absolute;
		}
		.min{
			left:385px;
			position:relative;
		}
		.lab4{
			width:10px;
			height:10px;
			background-color:rgba(128,255,0,1);
			left:643px;		
			top:5px;
			position:absolute;
		}
		.avg{
			left:518px;
			position:relative;
		}
		.form{
			margin-top:100px;
			margin-left:50px;
		}
	</style>
</head>

<body  onload="fun1(),fun2();">

    <div id="wrapper">

        <!-- 导航 -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">试卷管理分析系统</a>
            </div>

            <!-- /.退出 -->
            <ul class="nav navbar-top-links navbar-right">                
                <li class="">                  
                        <a href="login.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                </li>
            </ul>
            <!-- /.左边导航 -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
						<!-- 个人信息 -->
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <p class="text-center">老师信息：</p>
								<p class="text-center">姓名：</p>
								<p class="text-center">年级：</p>
                            </div>
                            <!-- /功能 -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-dashboard fa-fw"></i> 成绩分析<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
                                <li>
                                    <a href="s_grade_t.jsp">综合</a>
                                </li>
                                <li>
                                    <a href="s_chinese_t.jsp">语文</a>
                                </li>
								<li>
                                    <a href="s_math_t.jsp">数学</a>
                                </li>
                                <li>
                                    <a href="s_english_t.jsp">英语</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 试卷分析<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="p_chinese_t.html">语文</a>
                                </li>
								<li>
                                    <a href="p_math_t.html">数学</a>
                                </li>
                                <li>
                                    <a href="p_english_t.html">英语</a>
                                </li>
                            </ul>
                        </li>                                                
                        <li>
                            <a href="#"><i class="fa fa-sitemap fa-fw"></i> 知识点分析</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> 聚类分析</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

		<div id="page-wrapper">
			<div class="col-lg-9">				
				<div class="col-lg-12">
					<div class="lab"></div>
					<span class="span">分段人数</span>
					<canvas id="canvas" height="250" width="600"></canvas>
				</div>
				<div class="col-lg-12 div2">
					<div>
						<div class="lab1"></div>
						<span class="stu">学生</span>
						<div class="lab2"></div>
						<span class="max">最高分</span>
						<div class="lab3"></div>
						<span class="min">最低分</span>
						<div class="lab4"></div>
						<span class="avg">平均分</span>
					</div>	
					<canvas id="canvas2" height="250" width="600"></canvas>				
				</div>
				
			</div>
			<div class="col-lg-3">
				<!-- 下拉选择框 -->
				<form action="" method="get" class="form">
					<select name="drop1" class="ui-select">
						<option value="1">张智勇</option>
						<option value="2">杨晨曦</option>
						<option value="3">周琪伟</option>
						<option selected value="4">黄徐震</option>
						<option value="5">黄海波</option>
						<option value="6">黎芷研</option>
						<option value="7">陈江东</option>
						<option value="8">林灵凡</option>
						<option value="9">沈丽标</option>
					</select>
				</form>
			</div>
		</div>     
    </div>	
	<script src="js/Chart.js"></script>
	<script>
	var barChartData = {
		labels : ["300~270","270~240","240~210","210~180","< 180"],
		datasets : [
			{
				fillColor : "rgba(151,187,205,0.5)",
				strokeColor : "rgba(151,187,205,0.8)",
				highlightFill : "rgba(151,187,205,0.75)",
				highlightStroke : "rgba(151,187,205,1)",
				data : [5,8,14,13,6]
			}
		]

	}
	var lineChartData = {
			labels : ["2015-10-15","2015-10-21","2015-10-27","2015-11-2","2015-11-8","2015-11-14","2015-11-20"],
			datasets : [				
				{
					label: "Max",
					fillColor : "rgba(70,161,248,0)",
					strokeColor : "rgba(70,161,248,1)",
					pointColor : "rgba(70,161,248,1)",
					pointStrokeColor : "#fff",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(70,161,248,1)",
					data : [289,291,280,285,288,291,294]
				},
				{
					label: "Min",
					fillColor : "rgba(251,223,30,0)",
					strokeColor : "rgba(251,223,30,1)",
					pointColor : "rgba(251,223,30,1)",
					pointStrokeColor : "#fff",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(251,223,30,1)",
					data : [138,147,153,136,148,156,142]
				},
				{
					label: "Avg",
					fillColor : "rgba(128,255,0,0)",
					strokeColor : "rgba(128,255,0,1)",
					pointColor : "rgba(128,255,0,1)",
					pointStrokeColor : "#fff",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(128,255,0,1)",
					data : [206,213,201,203,209,210,215]
				},
				{
					label: "Stu",
					fillColor : "rgba(255,30,30,0)",
					strokeColor : "rgba(255,0,30,1)",
					pointColor : "rgba(255,30,30,1)",
					pointStrokeColor : "#fff",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(255,30,30,1)",
					data : [212,226,218,211,221,224,220]
				}
			]

		}
	function fun1(){
		var ctx = document.getElementById("canvas").getContext("2d");
		window.myBar = new Chart(ctx).Bar(barChartData, {
			responsive : true
		});
	}
	function fun2(){
		var ctx = document.getElementById("canvas2").getContext("2d");
		window.myLine = new Chart(ctx).Line(lineChartData, {
			responsive: true
		});
	}
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
    <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="bower_components/raphael/raphael-min.js"></script>
    <script src="bower_components/morrisjs/morris.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>

</body>

</html>