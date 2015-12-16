<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="<c:url value='/index/bower_components/bootstrap/dist/css/bootstrap.min.css'/>" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<c:url value='/index/bower_components/metisMenu/dist/metisMenu.min.css'/>" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="<c:url value='/index/dist/css/timeline.css'/>" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value='/index/dist/css/sb-admin-2.css'/>" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="<c:url value='/index/bower_components/morrisjs/morris.css'/>" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<c:url value='/index/bower_components/font-awesome/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	<!-- jQuery -->
    <script src="<c:url value='/index/bower_components/jquery/dist/jquery.min.js'/>"></script>
	<link rel="stylesheet" href="<c:url value='/index/css/drop-down.css'/>" />
	<script src="<c:url value='/index/js/jquery-ui.min.js'/>"></script>
	<script src="<c:url value='/index/js/select-widget-min.js'/>"></script>
	<script src="<c:url value='/index/js/highcharts.js'/> "></script>
	<style>
		#page-wrapper{
			//border:1px solid #e7e7e7;
		}
		.diff{
			background-color:#337ab7;
			width:240px;
			height:150px;
			border-radius:10px;
			margin-left:50px;
			margin-top:50px;
			margin-bottom:50px;
			opacity:0.5;
			float:left;
		}
		.vali{
			background-color:#5cb85c;
			width:240px;
			height:150px;
			border-radius:10px;
			margin-left:10px;
			margin-top:50px;
			margin-bottom:50px;
			opacity:0.5;
			float:left;
		}
		.reli{
			background-color:#f0ad4e;
			width:240px;
			height:150px;
			border-radius:10px;
			margin-left:10px;
			margin-top:50px;
			margin-bottom:50px;
			opacity:0.5;
			float:left;
		}
		.dist{
			background-color:#d9534f;
			width:240px;
			height:150px;
			border-radius:10px;
			margin-left:10px;
			margin-top:50px;
			margin-bottom:50px;
			opacity:0.5;
			float:left;
		}
		.div:hover{
			opacity:1;
		}
		.p{
			color:white;
		}
		.pp{
			margin-top:30px;
			font-size:80px;
		}
		.title{
			font-size:30px;
			color:black;
		}
		tr:hover{
			background-color:#eeeeee;
		}
		.table{
			word-break:break-all; 
			word-wrap:break-all;
		}
		td{
			text-align:center;
		}
		.info{
			width:900px;
			margin-left:100px;
			margin-top:40px;
			margin-bottom:250px;
		}
		.sec{
			position:absolute;
			left:820px;
			top:280px;
		}
		.dropdown-menu{
			width:730px;
			//text-align:center;
			
		}
		.d{
			word-break:break-all; 
			word-wrap:break-all;
		}
		.uli:hover{
			background-color:#eeeeee
		}
		#container{
			width: 750px; 
		}
	</style>
	</style>
</head>

<body style="background-color:white">
			<div class="wai">
				<div class="div diff">
					<div class="col-xs-3">
						<i class="glyphicon glyphicon-edit p pp"></i>
                    </div>
					<div class="col-xs-9 text-right">
						<div class="huge p">难度：<p>0.65</p></div>
						<div class="p">难度中等</div>
					</div>
				</div>
				<div class="div vali">
					<div class="col-xs-3">
						<i class="glyphicon glyphicon-tags p pp"></i>
                    </div>
					<div class="col-xs-9 text-right">
						<div class="huge p">效度：<p>0.65</p></div>
						<div class="p">试卷质量高</div>
					</div>			
				</div>
				<div class="div reli">
					<div class="col-xs-3">
						<i class="glyphicon glyphicon-eye-open p pp"></i>
                    </div>
					<div class="col-xs-9 text-right">
						<div class="huge p">信度：<p>0.65</p></div>
						<div class="p">试卷可靠程度一般</div>
					</div>			
				</div>
				<div class="div dist">
					<div class="col-xs-3">
						<i class="glyphicon glyphicon-send p pp"></i>
                    </div>
					<div class="col-xs-9 text-right">
						<div class="huge p">区分：<p>0.65</p></div>
						<div class="p">区分程度优秀</div>
					</div>			
				</div>
			</div>
			<div id="container"></div>
			<div class="info">
				<!-- 试卷信息 -->
				<table class="table table-bordered">
					<caption class="text-center title">易错知识点与题目</caption>
					<thead>
						<tr>
							<th class="text-center">编号</th>
							<th width="490px" class="text-center">试卷题目</th>
							<th class="text-center">做题人数</th>
							<th class="text-center">正确人数</th>
							<th class="text-center">错误率</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>001</td>
							<td>题目1</td>
							<td>100</td>
							<td>32</td>
							<td>68%</td>
						</tr>
						<tr>							
							<td>002</td>
							<td>题目2</td>
							<td>100</td>
							<td>14</td>
							<td>86%</td>
						</tr>
						<tr>
							<td>003</td>
							<td>题目3</td>
							<td>100</td>
							<td>50</td>
							<td>50%</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="sec">
			<!-- 下拉选择框 -->
				<form action="" method="get" class="form">
					<select name="drop1" class="ui-select">
						<option value="1">试卷1</option>
						<option value="2">试卷2</option>
						<option value="3">试卷3</option>
						<option value="4">试卷4</option>
						<option value="5">试卷5</option>
						<option value="6">试卷6</option>
						<option value="7">试卷7</option>
						<option value="8">试卷8</option>
						<option value="9">试卷9</option>
						<option value="10">试卷10</option>
					</select>
				</form>
			</div>
        
	<script>
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
	//错误率图
	$(document).ready(function() {  
   var chart = {
      type: 'bar'
   };
   var title = {
      text: '知识点错误率'   
   };
   var xAxis = {
      categories: ['知识点A', '知识点B', '知识点C', '知识点D', '知识点E'],
      title: {
         text: null
      }
   };
   var yAxis = {
      min: 0,
      title: {
         text: '',
         align: 'high'
      },
      labels: {
         overflow: 'justify'
      }
   };
   var tooltip = {
      valueSuffix: '%'
   };
   var plotOptions = {
      bar: {
         dataLabels: {
            enabled: true
         }
      }
   };
   var legend = {
      layout: 'vertical',
      align: 'right',
      verticalAlign: 'top',
      x: -40,
      y: 0,
      floating: true,
      borderWidth: 1,
      backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
      shadow: true
   };
   var credits = {
      enabled: false
   };
   
   var series= [{
         name: '错误率',
            data: [89, 81, 70, 68, 63]
        }
   ];     
      
   var json = {};   
   json.chart = chart; 
   json.title = title;    
   json.tooltip = tooltip;
   json.xAxis = xAxis;
   json.yAxis = yAxis;  
   json.series = series;
   json.plotOptions = plotOptions;
   json.legend = legend;
   json.credits = credits;
   $('#container').highcharts(json);
  
});
	</script>


    <!-- /#wrapper -->

    <!-- Bootstrap Core JavaScript -->
    <script src="<c:url value='/index/bower_components/bootstrap/dist/js/bootstrap.min.js'/>"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="<c:url value='/index/bower_components/metisMenu/dist/metisMenu.min.js'/>"></script>

    <!-- Morris Charts JavaScript -->
    <script src="<c:url value='/index/bower_components/raphael/raphael-min.js'/>"></script>
    <script src="<c:url value='/index/bower_components/morrisjs/morris.min.js'/>"></script>

    <!-- Custom Theme JavaScript -->
    <script src="<c:url value='/index/dist/js/sb-admin-2.js'/>"></script>

</body>

</html>
