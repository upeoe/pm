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

    <title>试卷管理分析系统</title>
    <!-- Bootstrap Core CSS -->
	<link href="<c:url value='/index/bower_components/bootstrap/dist/css/bootstrap.min.css'/>" rel="stylesheet">
	<!-- MetisMenu CSS -->
	<link href="<c:url value='/index/bower_components/metisMenu/dist/metisMenu.min.css '/>" rel="stylesheet">
	<!-- Timeline CSS -->
	<link href="<c:url value='/index/dist/css/timeline.css '/>" rel="stylesheet">
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
	<script src="<c:url value='/index/bower_components/jquery/dist/jquery.min.js '/>"></script>
	<link rel="stylesheet" href="<c:url value='/index/css/drop-down.css'/>" />
	<script src="<c:url value='/index/js/jquery-ui.min.js'/>"></script>
	<script src="<c:url value='/index/js/select-widget-min.js'/>"></script>
<style>
	body{
		background-color:white;
	}
	.title{
		font-size:25px;
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
		text-align:left;
	}
	.td1{
		text-align:center;
	}
	.info{
		width:900px;
		margin-left:20px;
		margin-bottom:100px;
	}
	.sec{
		
	} 	
	svg:hover{
		cursor: hand;
	}
	body{
		-webkit-touch-callout: none;  
		-webkit-user-select: none;  
		-khtml-user-select: none;  
		-moz-user-select: none;  
		-ms-user-select: none;  
		user-select: none; 
	}
	.rel{
		/*width:800px;*/
		/*height:580px;*/
		margin:0px auto;
		margin-left:-100px;
		text-align:center;
		/* border:1px solid black; */
	}
	.imgd{
		height:400px;
		/* border:3px solid black; */
		border-radius:20px;
		margin:10px 0px;
		text-align:center;
		font-size:20px;
	}
	.imgdb{
		height:400px;
		text-align:center;
		font-size:20px;
		border:1px solid black;
		border-radius:20px;
	}
	.img{
		/* display:none; */
	}
	.titlet{
		text-align:center;
		font-size:30px;
		margin-bottom:20px;
		font-family:微软雅黑;
	}
</style>
	<script src="<c:url value='/index/js/d3.js '/>" charset="utf-8"></script>
</head>

<body>
	<div class="container">
		<div class="titlet">知识关联分析</div>
		<div class="row">	
			<div class="col-sm-9"></div>
			<div class="sec col-sm-3">
				<!-- 年级下拉选择框 -->
				<form action="" method="get" class="form">
					<select name="drop1" class="ui-select" id="grade-select">
						<c:forEach items="${gradeList}" var="grade">
							<option value="${grade}"
								<c:if test="${grade eq selectedGrade}" >
		  									selected='selected'
		  						</c:if>
		  					>
								${grade}
							</option>
						</c:forEach>
					</select>
				</form>
			</div>
		</div>
		<div class="row">
			<div class="rel col-sm-12"><span style="font-size:20px">知识点关系网图</span></div>			
		</div>
		<div class="info">
			<!-- 试卷信息 -->
			<table class="table table-bordered">
				<caption class="text-center title">知识点关联表</caption>
				<thead>
					<tr>
						<th width="100px" class="text-center">知识点类型</th>
						<th width="300px" class="text-center">知识点</th>
						<th class="text-center">关系图</th>									
					</tr>
				</thead>
				<tbody>
					<tr>								
						<td class="td1">前继知识点</td>
						<td>数学广角,统计和复数</td>
						<td>
							<div id="bin" style="height:100px;width:100%;"></div>
						</td>
					</tr>
					<tr>
						<td class="td1">后续知识点</td>
						<td>位置与方向,分数除法</td>
						<td><div id="cir" style="height:100px;width:100%;"></div></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div clss="row">
			<div class="imgd col-sm-6 col-lg-6">
				高频知识点绘图<img src="<c:url value='${img_fsetsLift}'/>"
					width="100%" height="90%" class="img" />
			</div>
			<div class="imgd col-sm-6 col-lg-6">
				关联分析规则图<img src="<c:url value='${img_ScottPlot}' />" width="100%"
					height="90%" class="img" />
			</div>
			<div class="imgdb col-sm-12 col-lg-12">
				知识点频数分布图<img src="<c:url value='${img_fsetsSup}'/>"
					width="100%" height="90%" class="img" />
			</div>
			<div class="imgd col-sm-6 col-lg-6">
				知识点关联结构网图<img src="<c:url value='${img_Graph}' />" width="100%"
					height="90%" class="img" />
			</div>
			<div class="imgd col-sm-6 col-lg-6">
				支持-置信度矩阵分布图<img src="<c:url value='${img_GroupedMatrix}'/>" width="100%"
					height="90%" class="img" />
			</div>
		</div>
	</div>
	
 <script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
 <script type="text/javascript">      
			 
 	var nodes = [];
	var edges = [];
	
	<c:forEach items="${keywordArray}" var="keyword">
		var node = {name:"${keyword[0]}",imp:parseInt(${keyword[1]})};
		nodes.push(node); 
	</c:forEach>
	
	<c:forEach items="${edges}" var="edge">
		var edge2 = parseFloat(${edge[2]}) * 150;
		var jason = {
			source: ${edge[0]},
			target: ${edge[1]},
			value: edge2,
			imp: ${edge[3]}
		};
		edges.push(jason);
	</c:forEach> 
	
	var width = 1000;
	var height = 650;

	var svg = d3.select(".rel").append("svg").attr("width", width).attr(
		"height", height);

	var force = d3.layout.force().nodes(nodes) //指定节点数组
		.links(edges) //指定连线数组
		.size([width, height]) //指定范围
		.linkDistance(function(d) {
			return d.value;

		}) //指定连线长度
		.charge([-400]); //相互之间的作用力

	force.start(); //开始作用

	console.log(nodes);
	console.log(edges);

	//添加连线    
	var svg_edges = svg.selectAll("line").data(edges).enter()
		.append("line").style("stroke", "#ccc")
		.style("stroke", function(d){
			if (d.imp == 1)
			return "green";
			else 
				return "#ccc";
			})
			.style("stroke-width",function(d){
				if (d.imp == 1)	
					return 3;
				else 
					return 1;
			})
	var color = d3.scale.category20();
	//添加节点      
	var svg_nodes = svg.selectAll("circle").data(nodes).enter().append(
		"circle").attr("r", function(d){
			if(d.imp == 1){
				return 20;
			}
			else{
				return 10;
			}
		})

		.style("fill", function(d, i) {
		if(d.imp == 1){
			return "green";
		}
		else {
			return color(i);
		}
	}).call(force.drag); //使得节点能够拖动

	//添加描述节点的文字
	var svg_texts = svg.selectAll("text").data(nodes).enter()
		.append("text").style("fill", "black").attr("dx", 20).attr(
			"dy", 8).text(function(d) {
			return d.name;
		});

	force.on("tick", function() { //对于每一个时间间隔

		//更新连线坐标
		svg_edges.attr("x1", function(d) {
			return d.source.x;
		}).attr("y1", function(d) {
			return d.source.y;
		}).attr("x2", function(d) {
			return d.target.x;
		}).attr("y2", function(d) {
			return d.target.y;
		});

		//更新节点坐标
		svg_nodes.attr("cx", function(d) {
			return d.x;
		}).attr("cy", function(d) {
			return d.y;
		});

		//更新文字坐标
		svg_texts.attr("x", function(d) {
			return d.x;
		}).attr("y", function(d) {
			return d.y;
		});
	});

	svg_nodes.on("mouseover", function(d, i) {
		d3.select(this).style("fill", "red");
		d3.select(this).style("r", "20");
		var idx=d.index;
		svg_texts.style("fill",function(d){
			if (d.target.index == idx || d.source.index ==idx)
				{
				 return "red";
				}
			
		});
		var idx = d.index;
		svg_edges.each(function(d) {
			if (d.target.index == idx || d.source.index == idx) {
				d3.select(this).style("stroke", "red");
				d3.select(this).style("stroke-width", 3);

			}
		});
	})
	svg_nodes.on("mouseout", function(d, i) {
		if(d.imp == 0){
			d3.select(this).style("fill", function() {
				return color(i);
			})
		};
		if(d.imp == 0){
			d3.select(this).style("r", "10");
		}
		else	{	
			d3.select(this).style("r", "20");
			d3.select(this).style("fill", "green");
		}
		var idx = d.index;
		svg_edges.each(function(d) {
			if (d.target.index == idx || d.source.index == idx) {
				if(d.imp == 0){
					d3.select(this).style("stroke", "#ccc");
					d3.select(this).style("stroke-width", 1);
				}
				else
					{
					d3.select(this).style("stroke", "green");
					d3.select(this).style("stroke-width", 3);
				}	
				
			}
		});

	});
	//下拉选择框
	$(document).ready(
		function() {
			$("#grade-select").selectWidget({
				change: function(changes) {
				var grade = $("#grade-select").val();
				var course = "${selectedCourse}"
				location.href = "<c:url value='/RelationServlet?method=relation&grade='/>" + grade + "&course=" + course ;
			},
			effect: "slide",
			keyControl: true,
			speed: 200,
			scrollHeight: 250
		});
	});
	 // 饼图   路径配置
    require.config({
        paths: {
            echarts: 'http://echarts.baidu.com/build/dist'
        }
    });
    
    // 使用
    require(
        [
            'echarts',
            'echarts/chart/pie',
			'echarts/chart/funnel'	// 使用柱状图就加载bar模块，按需加载
        ],
        function (ec) {
            // 基于准备好的dom，初始化echarts图表
            var myChart = ec.init(document.getElementById('bin')); 
            
            var option = {
                title : {
    				text: '',
    				subtext: '',
    				x:'center'
				},
			    tooltip : {
			        trigger: 'item',
			        formatter: "{a} <br/>{b} : {c} ({d}%)"
			    },
				calculable : true,
			    series : [
			        {
			            name:'题目分布情况',
			            type:'pie',
			            radius : '55%',
			            center: ['50%', '60%'],
			            data:[
			                {value:59, name:'简单题'},
			                {value:79, name:'中等题'},
			                {value:18, name:'较难题'},
			            ]
			        }
			    ]};
			    // 为echarts对象加载数据 
			    myChart.setOption(option); 
	});

 // 环图   路径配置
    require.config({
        paths: {
            echarts: 'http://echarts.baidu.com/build/dist'
        }
    });
    
    // 使用
    require(
        [
            'echarts',
            'echarts/chart/pie',
			'echarts/chart/funnel'	// 使用柱状图就加载bar模块，按需加载
        ],
        function (ec) {
            // 基于准备好的dom，初始化echarts图表
            var myChart = ec.init(document.getElementById('cir')); 
            
            var option = {
                tooltip : {
			        trigger: 'item',
			        formatter: "{a} <br/>{b} : {c} ({d}%)"
			    },
				legend: {
			        orient : 'vertical',
			        x : 'left',
			        data:['同对概率','同错概率']
			    },
				calculable : true,
			    series : [
			    {
			     	name:'知识点相关情况',
			        type:'pie',
			        radius : ['50%', '70%'],
			        itemStyle : {
			      		normal : {
			            	label : {
			        	        show : false
			                },
			                labelLine : {
			                    show : false
	                    }
	                },
		            emphasis : {
			            label : {
		    	            show : true,
		                    position : 'right',
		                    textStyle : {
		        	            fontSize : '20',
		                        fontWeight : 'bold'
		                    }
		                }
		            }
		        },
			    data:[
			    	{value:335, name:'同对概率'},
			        {value:310, name:'同错概率'},
			    ]
			}]
		};
    
        // 为echarts对象加载数据 
        myChart.setOption(option); 
    });
    </script>  
	<!-- /#wrapper -->
	<!-- Bootstrap Core JavaScript -->
	<script	src="<c:url value='/index/bower_components/bootstrap/dist/js/bootstrap.min.js'/>"></script>
	<!-- Metis Menu Plugin JavaScript -->
	<script src="<c:url value='/index/bower_components/metisMenu/dist/metisMenu.min.js' />"></script>
	<!-- Morris Charts JavaScript -->
	<script src="<c:url value='/index/bower_components/raphael/raphael-min.js '/>"></script>
	<script src="<c:url value='/index/bower_components/morrisjs/morris.min.js'/>"></script>
	<!-- Custom Theme JavaScript -->
	<script src="<c:url value='/index/dist/js/sb-admin-2.js'/>"></script>

</body>
</html>