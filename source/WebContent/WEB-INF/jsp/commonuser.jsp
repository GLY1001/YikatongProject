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
<title>普通用户</title>
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
<link href="${pageContext.request.contextPath}/css/index1.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/echarts.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/laydate/laydate.js"></script>

</head>
<body class="bg01">
<div class="big_body">
	<header class="header">
		<h3>一卡通交易数据分析</h3>
		<li>
			<a href="login.action" class="a0">退出登录</a>
		</li>
	</header>
	
	<!--下面的大div-->
	<!-- 客户列表查询部分  start-->
	<div id="page-wrapper" class="main_bottom">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">消费记录</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="get" action="${pageContext.request.contextPath }/getCommonuserByJyrq.action">
					<div class="form-group">
						<label for="customerName">交易日期：</label> 
						<input type="text" value="${first}" required  placeholder="请选择日期" name="first" id="first" style="background:none;padding-left: 10px; height: 38px; min-width: 262px; line-height: 38px; border: 1px solid #e6e6e6;color:#fff; border-radius: 2px;">
						<script>
							lay('#version').html('-v'+ laydate.v);
							//执行一个laydate实例
							laydate.render({
							  elem: '#first' //指定元素
							});
						</script>
						<label for="customerName">--</label> 
						<input type="text" value="${second}" required placeholder="请选择日期" name="second" id="second" style="background:none; padding-left: 10px; height: 38px; min-width: 262px; line-height: 38px; border: 1px solid #e6e6e6;color:#fff; border-radius: 2px;">
						<script>
							lay('#version').html('-v'+ laydate.v);
							//执行一个laydate实例
							laydate.render({
							  elem: '#second' //指定元素
							});
						</script>
					</div>
					<button id="btn" name="btn" value="byjyrq" type="submit" class="btn btn-primary">按交易日期查询</button>
				</form>
				<form class="form-inline" method="get" action="${pageContext.request.contextPath }/getCommonuserBySfrzh.action">
					<button id="btn" name="btn" value="all" type="submit" class="btn btn-primary">查询全部</button>
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
						<itheima:page url="${pageContext.request.contextPath }/getCommonuserByJyrq.action" />
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</div>
	<!-- 列表查询部分  end-->
	
	<div class="wrapper2">
		<div class="container-fluid">
			<div class="row fill-h2">
				
				<div class="col-lg-3 fill-h2">
					<div class="xpanel-wrapper2 xpanel-wrapper-3">
						<div class="xpanel">
							<!--在各个消费类别的消费金额  -->
							<div class="fill-h2" id="xflb_div"></div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-6 fill-h2">
					<div class="xpanel-wrapper2 xpanel-wrapper-3">
						<div class="xpanel">
							<!-- 在各个消费地点的消费金额 -->
							<div class="fill-h2" id="shmc_div"></div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 fill-h2">
					<div class="xpanel-wrapper2 xpanel-wrapper-3">
						<div class="xpanel">
							<!-- 最近七天消费金额 -->
							<div class="fill-h2" id="seven_div"></div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
</div>

<script>
$(function(){
    var xflbChart = echarts.init(document.getElementById('xflb_div'));
    var xflb=[];
    var cost=[];
    $.ajax({
        type:"POST",
        url:"${pageContext.request.contextPath}/getCommonuserByXflb.action",
        data:{},
        cache:false,
        async: false,
        dataType:"json",
        success : function (result) {
            for(var i in result){
                xflb.push(result[i].xflb);
                cost.push(result[i].jyje);
            };
            var data = cost;
            var titlename = xflb;
            var myColor = ['#1089E7', '#F57474', '#56D0E3', '#F8B448', '#8B78F6'];
            xflbChart.setOption({ //加载数据图表
            	//backgroundColor: '#0e2147',
            	title: {
                    text: "${USER_SESSION.username}在各个消费类别的消费金额", 
                    x: "left",
                    textStyle:{
                    	color: "#ffffff",
                    	fontSize: 16
                    }
                }, 
                toolbox: {
                    show: true,
                    feature: {
                        dataView: {readOnly: false},
                        restore: {},
                        saveAsImage: {}
                    }
                },
            	grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '1%',
                    top: '10%',
                    containLabel: true
                },
                xAxis: {
                    show: false
                },
                yAxis: [{
                    show: true,
                    data: titlename,
                    inverse: true,
                    axisLine: {
                        show: false
                    },
                    splitLine: {
                        show: false
                    },
                    axisTick: {
                        show: false
                    },
                    axisLabel: {
                        textStyle: {
                            color: function(value, index) {
                                var num = myColor.length;
                                return myColor[index % num]
                            }
                        },
                        formatter: function(value, index) {
                            return [
                                '{title|' + value + '} '
                            ].join('\n')
                        },
                        rich: {}
                    },

                }, {
                    show: true,
                    inverse: true,
                    data: data,
                    axisLabel: {
                        textStyle: {
                            color: function(value, index) {
                                var num = myColor.length;
                                return myColor[index % num]
                            }
                        }
                    },
                    axisLine: {
                        show: false
                    },
                    splitLine: {
                        show: false
                    },
                    axisTick: {
                        show: false
                    },

                }],
                series: [{
                    name: '条',
                    type: 'bar',
                    yAxisIndex: 0,
                    data: data,
                    barWidth: 10,
                    itemStyle: {
                        normal: {
                            barBorderRadius: 30,
                            color: function(params) {
                                var num = myColor.length;
                                return myColor[params.dataIndex % num]
                            },
                        }
                    },
                    
                }]
            });
        },
    });
})
</script>
<script>
$(function(){
    var shmcChart = echarts.init(document.getElementById('shmc_div'));
    var shmc=[];
    var cost=[];
    $.ajax({
        type:"POST",
        url:"${pageContext.request.contextPath}/getCommonuserByShmc.action",
        data:{},
        cache:false,
        async: false,
        dataType:"json",
        success : function (result) {
            for(var i in result){
                shmc.push(result[i].shmc);
                cost.push(result[i].jyje);
            };
            var xdata = shmc;
            var ydata = cost;
            var xcol = function(){
               var color = [
                      '#eb4848','#eb6449','#eb7f49','#eb9a49','#ebb549',
                       '#ebd049','#ebeb49','#d0eb49','#b5eb49','#9aeb49',
                       '#49eb9a','#49ebb5','#49ebd0','#49ebeb','#49d0eb',
                       '#49b5eb','#499aeb','#497feb','#4964eb','#4949eb',
                       '#6449eb','#7f49eb','#9a49eb','#b549eb','#d049eb',
                ];
               var c = [];
               for(var x =0;x<47;x++)
               {
                   for(var y =0;y<32;y++){
                       c.push(color[y])
                   }
               }
               console.log(c)
               return c
            }()
            shmcChart.setOption({ //加载数据图表
            	title: {
                    text: "${USER_SESSION.username}在各个消费地点的消费金额", 
                    x: "left",
                    textStyle:{
                    	fontSize:16,
                    	color: '#ffffff'
                    }
                }, 
                toolbox: {
                    show: true,
                    feature: {
                        dataView: {readOnly: false},
                        restore: {},
                        saveAsImage: {}
                    }
                },
                tooltip: {
                    trigger: "axis", 
                    axisPointer: {
                        type: "shadow"
                    },
                }, 
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '1%',
                    top: '10%',
                    containLabel: true
                },
                calculable: true, 
                xAxis: [
                    {
                        type: "category", 
                        axisTick: {
                            alignWithLabel: true
                        },
                        axisLabel: {
                            show: true,
                            splitNumber: 20,
                            textStyle: {
                                fontFamily: "微软雅黑",
                                fontSize: 12,
                                color: "#ffffff",
                                fontWeight: 'normal',
                            },
                            formatter: function(val) {
                                return val.split("").join("\n")
                            },
                        },
                        data:xdata
                    }
                ], 
                yAxis: [
                    {
                        type: "value", 
                        axisLabel: {
                            show: true,
                            splitNumber: 20,
                            textStyle: {
                                fontFamily: "微软雅黑",
                                fontSize: 12,
                                color: "#ffffff",
                                fontWeight: 'normal',
                            }
                        },
                        splitLine: {
                            show: false
                        }, 
                        axisLine: {
                            show: true
                        }, 
                        axisTick: {
                            show: false
                        }, 
                        splitArea: {
                            show: false
                        }
                    }
                ], 
                dataZoom: [{
                	"show": true,
                    "height": 12,
                    "xAxisIndex": [
                      0
                    ],
                    bottom:'3',
                    "start": 10,
                    "end": 95,
                    handleSize: '110%',
                    handleStyle:{
                      color:"#d3dee5",

                    },
                    textStyle:{
                      color:"#fff"},
                    borderColor:"#90979c"
                  }, {
                    "type": "inside",
                    "show": true,
                    "height": 15,
                    "start": 1,
                    "end": 35
                  }],
                series: [
                    {
                        name: "1", 
                        type: "bar", 
                        barGap: "10%", 
                        itemStyle: {
                            normal: {
                                color: function(params) {
                                    // build a color map as your need.
                                    var colorList = xcol
                                    return colorList[params.dataIndex]
                                },
                                
                            }
                        },
                        data: ydata 
                    },
                    
                ]
            });
        },
    });
})
</script>
<script>
$(function(){
    var sevenChart = echarts.init(document.getElementById('seven_div'));
    var day=[];
    var num=[];
    $.ajax({
        type:"POST",
        url:"${pageContext.request.contextPath}/getCommonuserBySeven.action",
        data:{},
        cache:false,
        async: false,
        dataType:"json",
        success : function (result) {
            for(var i in result){
                day.push(result[i].jyrq);
                num.push(result[i].jyje);
            };
            var lineColor = '#2F5384';
            var labelColor = '#74BFE7';
            sevenChart.setOption({ //加载数据图表
            	//backgroundColor:'#000',
            	title: {
                    text: "${USER_SESSION.username}最近七天的消费金额", 
                    x: "left",
                    textStyle:{
                    	fontSize:16,
                    	color: '#ffffff'
                    }
                }, 
                toolbox: {
                    show: true,
                    feature: {
                        dataView: {readOnly: false},
                        restore: {},
                        saveAsImage: {}
                    }
                },
                grid: {
                    left: '5%',
                    right: '5%',
                    top: '15%',
                    bottom: '3%',
                    containLabel: true
                },
                tooltip: {
                    show: true,
                    trigger: 'item',
                    textStyle:{
                    	fontSize:14
                    }
                },
                legend: {
                    show: true,
                    x: 'center',
                    y: '35',
                    itemWidth: 45,
                    itemHeight: 18,
                    textStyle: {
                        color: '#ffffff',
                        fontSize: 14
                    },
                    data: ['消费金额']
                },
                xAxis: [
                    {
                        type: 'category',
                        axisLabel: {
                            color: labelColor,
                            fontSize: 14,
                            interval:0,  
                            rotate:45,
                        },
                        axisLine: {
                            show: true,
                            lineStyle: {
                                color: lineColor,
                                width: 2
                            }
                        },
                        axisTick: {
                            show: false
                        },
                        splitLine: {
                            show: false,
                            lineStyle: {
                                color: '#195384'
                            }
                        },
                        data: day
                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        name: '(元)',
                        nameTextStyle: {
                            fontSize: 14,
                            color:'#ffffff'
                        },
                        axisLabel: {
                            formatter: '{value}',
                            textStyle: {
                                color: labelColor,
                                fontSize: 14
                            }
                        },
                        axisLine: {
                            lineStyle: {
                                color:lineColor,
                                width: 2
                            }
                        },
                        axisTick: {
                            show: false
                        },
                        splitLine: {
                            show: false,
                            lineStyle: {
                                color: '#142B57'
                            }
                        }
                    }
                ],
                series: [
                    {
                        name: '消费金额',
                        type: 'line',
                        stack: '总量',
                        symbol: 'circle',
                        symbolSize: 10,
                        smooth: true,
                        itemStyle: {
                            normal: {
                                color: 'rgba(3,240,254,1)',
                                lineStyle: {
                                    color: "rgba(3,240,254,1)",
                                    width: 2
                                },
                                areaStyle: {
                                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                        offset: 0,
                                        color: 'rgba(3,240,254,.7)'
                                    }, {
                                        offset: 1,
                                        color: 'rgba(3,240,254,0)'
                                    }])
                                },
                                shadowColor:'rgba(3,240,254,1)',
                                shadowBlur:20,
                            }
                        },
                        markPoint: {
                            itemStyle: {
                                normal: {
                                    color: 'red'
                                }
                            }
                        },
                        data: num
                    }
                ]
            });
        },
    });
})
</script>
<!-- 引入js文件 -->
<!-- jQuery -->
<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>js/bootstrap.min.js"></script> 
<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>js/metisMenu.min.js"></script> 
<!-- DataTables JavaScript -->
<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>%>
<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>js/sb-admin-2.js"></script>
<script type="text/javascript">
	$(function() {
		
		/********** 浏览器窗口改变时，重置报表大小 ****************/
		window.onresize = function() {
			xflb_div.resize();
			shmc_div.resize();
			seven_div.resize();
		}
	});
</script>
</body>
</html>