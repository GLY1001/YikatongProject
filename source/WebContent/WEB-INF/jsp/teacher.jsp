<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <title>教职工页</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/echarts.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/echarts-wordcloud.min.js"></script>
    <link href="${pageContext.request.contextPath}/css/index.css" rel=stylesheet>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel=stylesheet>
</head>
<body class="bg01">
		
	<header class="header">
		<h3>一卡通交易数据分析</h3>
		<li>
			<a href="index.action" class="a0">总体分析</a>
			<a href="teacher.action" class="a1">教职工分析</a>
			<a href="student.action" class="a0">学生分析</a>
			<a href="manager.action" class="a0">查询学生消费信息</a>
			<a href="login.action" class="a0">退出登录</a>
		</li>
	</header>
	
	<div class="wrapper">
		<div class="container-fluid">
			<div class="row fill-h">
				
				<div class="col-lg-3 fill-h">
					<div class="xpanel-wrapper xpanel-wrapper-2">
						<div class="xpanel">
							<!--1、消费类别XFLB占比）teachertype -->
							<div class="fill-h" id="type_div"></div>
						</div>
					</div>
					<div class="xpanel-wrapper xpanel-wrapper-2">
						<div class="xpanel">
							<!--5 .近几年老师在交通消费类型方面的趋势  -->
							<div class="fill-h" id="traffic_div"></div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-6 fill-h">
					<div class="xpanel-wrapper xpanel-wrapper-1">
						<div class="xpanel">
							<!--3. 2019年所有教职工的月均消费 teachercost  -->
							<div class="fill-h" id="cost_div"></div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 fill-h">
					<div class="xpanel-wrapper xpanel-wrapper-2">
						<div class="xpanel">
							<!-- 2、最受教职工欢迎的场所，SHMC（top8）teacherplace -->
							<h5 style="color:#ffffff; font-weight:bold;">最受教职工欢迎的场所Top8</h5>
							<div class="fill-h" id="place_div"></div>
						</div>
					</div>
					<div class="xpanel-wrapper xpanel-wrapper-2">
						<div class="xpanel">
							<!--4. 老师年消费总额、年均消费  -->
							<div class="fill-h" id="yearcost_div"></div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
<!--1、消费类别XFLB占比）teachertype -->
<script>
    $(function(){
        var typeChart = echarts.init(document.getElementById('type_div'));
        var xflbs=[];
        var xflb_nums=[];
        var typedata=[];
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/getTeachertype.action",
            data:{},
            cache:false,
            async: false,
            dataType:"json",
            success : function (result) {
                for(var i in result){
                    xflbs.push(result[i].xflb);
                    xflb_nums.push(result[i].number);
                    var map={};
                    map.name=result[i].xflb;
                    map.value=result[i].number;
                    typedata[i]=map;
                };
                var plantCap = typedata;
                var datalist = [{
                    offset: [50, 50],
                    symbolSize: 100,
                    opacity: .95,
                    color: '#f467ce'
                }, {//交通
                    offset: [30, 80],
                    symbolSize: 75,
                    opacity: .88,
                    color: '#7aabe2'
                }, {//其他
                    offset: [25, 33],
                    symbolSize: 70,
                    opacity: .84,
                    color: '#ff7123'
                }, {//网络
                    offset: [70, 85],
                    symbolSize: 70,
                    opacity: .8,
                    color: '#ffc400'
                }, {//用水
                    offset: [55, 10],
                    symbolSize: 45,
                    opacity: .75,
                    color: '#72caa9'
                }, {//用电
                    offset: [75, 40],
                    symbolSize: 50,
                    opacity: .7,
                    color: '#6b3442'
                }];
                var datas = [];
                for (var i = 0; i < plantCap.length; i++) {
                    var item = plantCap[i];
                    var itemToStyle = datalist[i];
                    datas.push({
                        name: item.value + '\n' + item.name,
                        value: itemToStyle.offset,
                        symbolSize: itemToStyle.symbolSize,
                        label: {
                            normal: {
                                textStyle: {
                                    fontSize: 11
                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: itemToStyle.color,
                                opacity: itemToStyle.opacity
                            }
                        },
                    })
                }
                typeChart.setOption({ //加载数据图表
                    title : {
                        text: '消费类别占比',
                        x:'left',
                        textStyle: {
                        	color: '#ffffff',
                        	fontSize: '16'
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
                    grid:{
                        left:'5%',
                        top:'10%',
                        bottom:'10%',
                        right:'15%',
                        containLabel:true
                    },
                    xAxis: [{
                        gridIndex: 0,
                        type: 'value',
                        show: false,
                        min: 0,
                        max: 100,
                        nameLocation: 'middle',
                        nameGap: 5
                    }],
                    yAxis: [{
                        gridIndex: 0,
                        min: 0,
                        show: false,
                        max: 100,
                        nameLocation: 'middle',
                        nameGap: 30
                    }],
                    series: [{
                        type: 'scatter',
                        symbol: 'circle',
                        symbolSize: 120,
                        label: {
                            normal: {
                                show: true,
                                formatter: '{b}',
                                color: '#fff',
                                textStyle: {
                                    fontSize: '20'
                                }
                            },
                        },
                        itemStyle: {
                            normal: {
                                color: '#00acea'
                            }
                        },
                        data: datas
                    }]
                });
            },
        });
    });
</script>
<!--5 .近几年老师在交通消费类型方面的趋势  -->
<script>
$(function(){
    var trafficChart = echarts.init(document.getElementById('traffic_div'));
    var years=[];
    var costs=[];
    $.ajax({
        type:"POST",
        url:"${pageContext.request.contextPath}/getTeachertraffic.action",
        data:{},
        cache:false,
        async: false,
        dataType:"json",
        success : function (result) {
            for(var i in result){
                years.push(result[i].year);
                costs.push(result[i].cost);
            };
            trafficChart.setOption({ //加载数据图表
            	title: {
                    text: '近几年在交通消费类型方面的趋势',
                    x: 'left',
                    textStyle:{
                        color:'#ffffff',
                        fontSize:16,
                    },
                    
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
                    trigger: 'axis',
                    axisPointer: {
                        lineStyle: {
                            color: {
                                type: 'linear',
                                x: 0,
                                y: 0,
                                x2: 0,
                                y2: 1,
                                colorStops: [{
                                    offset: 0,
                                    color: 'rgba(255,255,255,0)' // 0% 处的颜色
                                }, {
                                    offset: 0.5,
                                    color: 'rgba(255,255,255,1)' // 100% 处的颜色
                                }, {
                                    offset: 1,
                                    color: 'rgba(255,255,255,0)' // 100% 处的颜色
                                }],
                                global: false // 缺省为 false
                            }
                        },
                    },

                },
                grid: {
                    top: '18%',
                    left: '3%',
                    right: '3%',
                    bottom: '10%',
                    containLabel: true
                },
                xAxis: [{
                    type: 'category',
                    boundaryGap: true,
                    axisLine: { //坐标轴轴线相关设置。数学上的x轴
                        show: true,
                        lineStyle: {
                            color: 'rgba(255,255,255,0.4)'
                        },
                    },
                    axisLabel: { //坐标轴刻度标签的相关设置
                        textStyle: {
                            color: '#d1e6eb',
                            margin: 15,
                        },
                    },
                    axisTick: {
                        show: false,
                    },
                    data: years,
                }],
                yAxis: [{
                    type: 'value',
                    min: 0,
                    splitNumber: 4,
                    splitLine: {
                        show: true,
                        lineStyle: {
                            color: 'rgba(255,255,255,0.1)'
                        }
                    },
                    axisLine: {
                        show: false,
                    },
                    axisLabel: {
                        show: false,
                        margin: 20,
                        textStyle: {
                            color: '#d1e6eb',

                        },
                    },
                    axisTick: {
                        show: false,
                    },
                }],
                series: [{
                    name: '注册总量',
                    type: 'line',
                    showAllSymbol: true,
                    symbolSize: 8,
                    lineStyle: {
                        normal: {
                            color: "#53fdfe", // 线条颜色
                        },
                        borderColor: '#f0f'
                    },
                    label: {
                        show: true,
                        position: 'top',
                        textStyle: {
                            color: '#fff',
                        }
                    },
                    itemStyle: {
                        normal: {
                            color: "rgba(255,255,255,1)",
                        }
                    },
                    tooltip: {
                        show: false
                    },
                    areaStyle: { //区域填充样式
                        normal: {
                            //线性渐变，前4个参数分别是x0,y0,x2,y2(范围0~1);相当于图形包围盒中的百分比。如果最后一个参数是‘true’，则该四个值是绝对像素位置。
                            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                    offset: 0,
                                    color: 'rgba(0,150,239,0.3)'
                                },
                                {
                                    offset: 1,
                                    color: 'rgba(0,253,252,0)'
                                }
                            ], false),
                            shadowColor: 'rgba(53,142,215, 0.9)', //阴影颜色
                            shadowBlur: 20 //shadowBlur设图形阴影的模糊大小。配合shadowColor,shadowOffsetX/Y, 设置图形的阴影效果。
                        }
                    },
                    data: costs
                }]
            });
        },
    });
})
</script>
<!--3. 2019年所有教职工的月均消费 teachercost  -->
<script>
$(function(){
    var costChart = echarts.init(document.getElementById('cost_div'));
    var months=[];
    var cost_nums=[];
    $.ajax({
        type:"POST",
        url:"${pageContext.request.contextPath}/getTeachercost.action",
        data:{},
        cache:false,
        async: false,
        dataType:"json",
        success : function (result) {
            for(var i in result){
                months.push(result[i].month);
                cost_nums.push(result[i].cost);
            };
            costChart.setOption({ //加载数据图表
            	title : {
                    text: '2019年所有教职工的月均消费',
                    x: 'left',
                    textStyle: {
                    	color: '#ffffff',
                    	fontSize: '16'
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
                tooltip : {},
                grid: {
                    top: '15%',
                    right: '8%',
                    left: '8%',
                    bottom: '10%'
                },
                xAxis: [{
                    type: 'category',
                    color: '#ffffff',
                    data: months,
                    axisPointer: {
                        type: 'line'
                    },
                    axisLine: {
                        lineStyle: {
                            color: '#ffffff'
                        }
                    },
                    axisLabel: {
                        margin: 20,
                        color: '#ffffff',
                        textStyle: {
                            fontSize: 12
                        },
                    },
                }],
                yAxis: [{
                    axisLabel: {
                        formatter: '{value}',
                        color: '#ffffff',
                    },
                    axisLine: {
                    	lineStyle: {
                            color: '#ffffff'
                        }
                    },
                    splitLine: {
                        show: false
                    }
                }],
                series: [{
                    type: 'bar',
                    data: cost_nums,
                    barWidth: '20px',
                    itemStyle: {
                        normal: {
                            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                offset: 0,
                                color: '#41E1D4' // 0% 处的颜色
                            }, {
                                offset: 1,
                                color: '#10A7DB' // 100% 处的颜色
                            }], false),
                            barBorderRadius: [30, 30, 0, 0],
                            shadowColor: 'rgba(0,255,225,1)',
                            shadowBlur: 4,
                        }
                    },
                    label: {
                        normal: {
                            show: true,
                            lineHeight: 30,
                            width: 80,
                            height: 30,
                            backgroundColor: '#252453',
                            borderRadius: 200,
                            position: ['-8', '-60'],
                            distance: 1,
                            formatter: [
                                '    {d|●}',
                                ' {a|{c}}     \n',
                                '    {b|}'
                            ].join(','),
                            rich: {
                                d: {
                                    color: '#3CDDCF',
                                },
                                a: {
                                    color: '#fff',
                                    align: 'center',
                                },
                                b: {
                                    width: 1,
                                    height: 30,
                                    borderWidth: 1,
                                    borderColor: '#234e6c',
                                    align: 'left'
                                },
                            }
                        }
                    }
                }]
            });
        },
    });
})
</script>
<!-- 2、最受教职工欢迎的场所，SHMC（top8）teacherplace -->
<script>
    $(function(){
        var placeChart = echarts.init(document.getElementById('place_div'));
        var shmcs=[];
        var shmc_nums=[];
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/getTeacherplace.action",
            data:{},
            cache:false,
            async: false,
            dataType:"json",
            success : function (result) {
                for(var i in result){
                    shmcs.push(result[i].shmc);
                    shmc_nums.push(result[i].number);
                };
				var myColor = ['#eb2100', '#eb3600', '#d0570e', '#d0a00e', '#34da62', '#00e9db', '#00c0e9', '#0096f3'];
                placeChart.setOption({ //加载数据图表
                	tooltip: {},
                    grid: {
                        left: '8%',
                        top: '5%',
                        right: '8%',
                        bottom: '5%',
                        containLabel: true
                    },
                    toolbox: {
                        show: true,
                        feature: {
                            dataView: {readOnly: false},
                            restore: {},
                            saveAsImage: {}
                        }
                    },
                    xAxis: [{
                        show: false,
                    }],
                    yAxis: [{
                        axisTick: 'none',
                        axisLine: 'none',
                        offset: '27',
                        axisLabel: {
                            textStyle: {
                                color: '#ffffff',//字体颜色
                                fontSize: '12',
                            }
                        },
                        data: shmcs
                    }, {
                        axisTick: 'none',
                        axisLine: 'none',
                        axisLabel: {
                            textStyle: {
                                color: '#ffffff',//字体颜色
                                fontSize: '12',
                            }
                        },
                        data: [ ]
                    }, {
                        name: '',
                        nameGap: '50',
                        nameTextStyle: {
                            color: '#ffffff',
                            fontSize: '12',
                        },
                        axisLine: {
                            lineStyle: {
                                color: 'rgba(0,0,0,0)'
                            }
                        },
                        data: [],
                    }],
                    series: [{
                            type: 'bar',
                            yAxisIndex: 0,
                            data: shmc_nums,//value
                            label: {
                                normal: {
                                    show: true,
                                    position: 'right',
                                    textStyle: {
                                        color: '#ffffff',//字体颜色
                                        fontSize: '12',
                                    }
                                }
                            },
                            barWidth: 8,
                            itemStyle: {
                                normal: {
                                    color: function(params) {
                                        var num = myColor.length;
                                        return myColor[params.dataIndex % num]
                                    },
                                }
                            },
                            z: 2
                        },
                        {
                            type: 'scatter',
                            hoverAnimation: false,
                            data: [ 0, 0, 0, 0, 0, 0, 0, 0],
                            yAxisIndex: 2,
                            symbolSize: 20,
                            itemStyle: {
                                normal: {
                                    color: function(params) {
                                        var num = myColor.length;
                                        return myColor[params.dataIndex % num]
                                    },
                                    opacity: 1,
                                }
                            },
                            z: 2
                        }
                    ]
                });
            },
        });
    });
</script>
<!--4. 老师年消费总额、年均消费  -->
<script>
$(function(){
    var yearcostChart = echarts.init(document.getElementById('yearcost_div'));
    var years=[];
    var sums=[];
    var avgs=[];
    $.ajax({
        type:"POST",
        url:"${pageContext.request.contextPath}/getTeacheryearcost.action",
        data:{},
        cache:false,
        async: false,
        dataType:"json",
        success : function (result) {
            for(var i in result){
                years.push(result[i].year);
                sums.push(result[i].sum_cost);
                avgs.push(result[i].avg_cost);
            };
            var category = years;
            var dottedBase = [];
            var lineData =avgs;
            var barData = sums;
            yearcostChart.setOption({ //加载数据图表
            	title: {
                    text: '年消费总额、年均消费额',
                    x: 'left',
                    textStyle:{
                        color:'#ffffff',
                        fontSize:16,
                        
                    },
                    
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
                    trigger: 'axis',
                    backgroundColor:'rgba(255,255,255,0.1)',
                    axisPointer: {
                        type: 'shadow',
                        label: {
                            show: true,
                            backgroundColor: '#7B7DDC'
                        }
                    }
                },
                legend: {
                    data: ['年消费总额','年均消费额',],
                    textStyle: {
                        color: '#ffffff',
                        
                    },
                    top:'10%',
                },
                grid:{
                    top:'15%',
                    left:'22%',
                    right:'11%',
                    bottom:'12%',
                },
                xAxis: {
                    data: category,
                    axisLine: {
                        lineStyle: {
                            color: '#ffffff'
                        }
                    },
                    axisTick:{
                        show:false,
                    },
                },
                yAxis: [{

                    splitLine: {show: false},
                    axisLine: {
                        lineStyle: {
                            color: '#ffffff',
                        }
                    },
                    
                    axisLabel:{
                        formatter:'{value} ',
                    }
                },
                    {

                    splitLine: {show: false},
                    axisLine: {
                        lineStyle: {
                            color: '#ffffff',
                        }
                    },
                    axisLabel:{
                        formatter:'{value} ',
                    }
                }],
                
                series: [{
                    name: '年均消费额',
                    type: 'line',
                    smooth: true,
                    showAllSymbol: true,
                    symbol: 'emptyCircle',
                    symbolSize: 8,
                    yAxisIndex: 1,
                    itemStyle: {
                            normal: {
                            color:'#F02FC2'},
                    },
                    data: lineData
                }, 
                
                {
                    name: '年消费总额',
                    type: 'bar',
                    barWidth: 10,
                    itemStyle: {
                        normal: {
                            barBorderRadius: 5,
                            color: new echarts.graphic.LinearGradient(
                                0, 0, 0, 1,
                                [
                                    {offset: 0, color: '#956FD4'},
                                    {offset: 1, color: '#3EACE5'}
                                ]
                            )
                        }
                    },
                    data: barData
                }
               ]
            });
        },
    });
})
</script>
<script>
	$(function() {
		
		/********** 浏览器窗口改变时，重置报表大小 ****************/
		window.onresize = function() {
			type_div.resize();
			traffic_div.resize();
			cost_div.resize();
			place_div.resize();
			yearcost_div.resize();
		}
	});
</script>
</body>
</html>