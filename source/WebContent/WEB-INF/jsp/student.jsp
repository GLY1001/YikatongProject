<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <title>学生页</title>
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
			<a href="teacher.action" class="a0">教职工分析</a>
			<a href="student.action" class="a1">学生分析</a>
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
							<!-- 5、南海实训饭堂，不同年级的消费占比 studentst -->
							<div class="fill-h" id="two_div"></div>
						</div>
					</div>
					<div class="xpanel-wrapper xpanel-wrapper-2">
						<div class="xpanel">
							<!-- 4、南海一饭饭堂，不同年级的消费占比  studentst -->
							<div class="fill-h" id="one_div"></div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-6 fill-h">
					<div class="xpanel-wrapper xpanel-wrapper-1">
						<div class="xpanel">
							<!-- 7、学生近几年的消费情况 -->
							<div class="fill-h" id="yearcost_div"></div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 fill-h">
					<div class="xpanel-wrapper xpanel-wrapper-2">
						<div class="xpanel">
							<!-- 2、不同年级学生的平均消费水平 studentcost -->
							<div class="fill-h" id="cost_div"></div>
						</div>
					</div>
					<div class="xpanel-wrapper xpanel-wrapper-2">
						<div class="xpanel">
							<!-- 6、低于平均消费水平的学生之中不同年级之间的占比 -->
							<div class="fill-h" id="avgcost_div"></div>
						</div>
					</div>
				</div>
				
				<!--换屏  -->
				<div class="col-lg-3 fill-h">
					<div class="xpanel-wrapper xpanel-wrapper-3">
						<div class="xpanel">
							<!--1、不同年级学生用网情况（XTMC=软网关）14-19级）studentnet -->
							<div class="fill-h" id="net_div"></div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-6 fill-h">
					<div class="xpanel-wrapper xpanel-wrapper-3">
						<div class="xpanel">
							<!-- 8、学生19年的月总额和月均消费情况 -->
							<div class="fill-h" id="monthcost_div"></div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 fill-h">
					<div class="xpanel-wrapper xpanel-wrapper-3">
						<div class="xpanel">
							<!-- 3、不同年级学生消费类别（XFLB）占比（固定消费类别）studenttype -->
							<div class="fill-h" id="type_div"></div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>

<!-- 5、南海实训饭堂，不同年级的消费占比 studentst -->
<script>
    $(function(){
        var twoChart = echarts.init(document.getElementById('two_div'));
        var grades=[];
        var nums=[];
        var twodata=[];
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/getStudenttwo.action",
            data:{},
            cache:false,
            async: false,
            dataType:"json",
            success : function (result) {
                for(var i in result){
                    grades.push(result[i].grade);
                    nums.push(result[i].number);
                    var map={};
                    map.name=result[i].grade;
                    map.value=result[i].number;
                    twodata[i]=map;
                };
                twoChart.setOption({ //加载数据图表
                    title: {
                        text: '南海实训饭堂，不同年级的消费占比',
                        left: 'left',
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
                    tooltip: {
                        trigger: 'item',
                        formatter: "{b} : {c} ({d}%)"
                    },
                    visualMap: {
                        show: false,
                        min: 500,
                        max: 600,
                        inRange: {
                            //colorLightness: [0, 1]
                        }
                    },
                    series: [{
                        name: '访问来源',
                        type: 'pie',
                        radius: '45%',
                        center: ['50%', '60%'],
                        color: ['rgb(131,249,103)', '#FBFE27', '#FE5050', '#1DB7E5'], //'#FBFE27','rgb(11,228,96)','#FE5050'
                        data: twodata
                        	.sort(function(a, b) {
                            return a.value - b.value
                        }),
                        roseType: 'radius',
                        label: {
                            normal: {
                                formatter: ['{c|{c}次}', '{b|{b}级}'].join('\n'),
                                rich: {
                                    c: {
                                        color: 'rgb(241,246,104)',
                                        fontSize: 12,
                                        fontWeight:'bold',
                                        lineHeight: 5
                                    },
                                    b: {
                                        color: 'rgb(98,137,169)',
                                        fontSize: 12,
                                        height: 40
                                    },
                                },
                            }
                        },
                        labelLine: {
                            normal: {
                                lineStyle: {
                                    color: 'rgb(98,137,169)',
                                },
                                smooth: 0.2,
                                length: 10,
                                length2: 20,

                            }
                        },
                        itemStyle: {
                            normal: {
                                shadowColor: 'rgba(0, 0, 0, 0.8)',
                                shadowBlur: 50,
                            }
                        }
                    }]
                });
            },
        });
    })
</script>
<!-- 4、南海一饭饭堂，不同年级的消费占比  studentst -->
<script>
$(function(){
    var oneChart = echarts.init(document.getElementById('one_div'));
    var grades=[];
    var nums=[];
    var onedata=[];
    $.ajax({
        type:"POST",
        url:"${pageContext.request.contextPath}/getStudentone.action",
        data:{},
        cache:false,
        async: false,
        dataType:"json",
        success : function (result) {
            for(var i in result){
                grades.push(result[i].grade);
                nums.push(result[i].number);
                var map={};
                map.name=result[i].grade;
                map.value=result[i].number;
                onedata[i]=map;
            };
            var scaleData = onedata;
	        var placeHolderStyle = {
	            normal: {
	                label: {
	                    show: false
	                },
	                labelLine: {
	                    show: false
	                },
	                color: 'rgba(0, 0, 0, 0)',
	                borderColor: 'rgba(0, 0, 0, 0)',
	                borderWidth: 0
	            }
	        };
	        var data = [];
	        var color = ['rgb(255, 153, 153)', 'rgb(255, 176, 63)', 'rgb(61, 186, 45)', 'rgb(43, 166, 254)'];
	        var colorBorder = ['rgba(255, 153, 153, 0.4)', 'rgba(255, 176, 63, 0.4)', 'rgba(61, 186, 45, 0.4)', 'rgba(43, 166, 254, 0.4)'];
	        for (var i = 0; i < scaleData.length; i++) {
	            data.push({
	                data: scaleData[i].value,
	                value: 20,
	                name: scaleData[i].name,
	                itemStyle: {
	                    normal: {
	                        color: color[i],
	                        borderWidth: 20,
	                        borderColor: colorBorder[i]
	                    }
	                }
	            }, {
	                value: 8,
	                name: '',
	                itemStyle: placeHolderStyle
	            });
	        }
	        data.push({
	            value: 40,
	            name: '',
	            itemStyle: placeHolderStyle
	        })
	        var seriesObj = [{
	            name: '',
	            type: 'pie',
	            clockWise: false,
	            radius: [80, 60],
	            hoverAnimation: false,
	            startAngle: -30,
	            itemStyle: {
	                normal: {
	                    label: {
	                        show: true,
	                        position: 'inner',
	                        fontSize: 12,
	                        lineHeight: 10,
	                        formatter: function(params) {
	                            var percent = 0;
	                            var total = 0;
	                            for (var i = 0; i < scaleData.length; i++) {
	                                total += scaleData[i].value;
	                            }
	                            percent = ((params.value / total) * 100).toFixed(0);
	                            if (params.name !== '') {
	                                if (params.name.length > 4) {
	                                    return params.name.slice(0, 3) + '\n' + params.name.slice(3);
	                                } else {
	                                    return params.name;
	                                }
	
	                            } else {
	                                return '';
	                            }
	                        }
	                    },
	                    labelLine: {
	                        length: 30,
	                        length2: 60,
	                        show: true
	                    }
	                }
	            },
	            data: data
	        }, {
	            name: '',
	            type: 'pie',
	            clockWise: false,
	            radius: [80, 60],
	            hoverAnimation: false,
	            startAngle: -30,
	            itemStyle: {
	                normal: {
	                    label: {
	                        show: true,
	                        position: 'outside',
	                        fontSize: 12,
	                        formatter: function(params) {
	                            var percent = 0;
	                            var total = 0;
	                            for (var i = 0; i < scaleData.length; i++) {
	                                total += scaleData[i].value;
	                            }
	                            percent = ((params.value / total) * 100).toFixed(0);
	                            if (params.name !== '') {
	                                return params.data.data;
	                            } else {
	                                return '';
	                            }
	                        }
	                    },
	                    labelLine: {
	                        length: 20,
	                        length2: 30,
	                        show: true
	                    }
	                }
	            },
	            data: data
	        }];
            oneChart.setOption({ //加载数据图表
                title : {
                    text: '南海一饭饭堂，不同年级的消费占比',
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
                tooltip: {
                    show: false
                },
                legend: {
                    show: false
                },
                toolbox: {
                    show: false
                },
                series: seriesObj,
                graphic: [{
                    type: 'group',
                    left: 'center',
                    top: 'middle',
                    children: [{
                            type: 'text',
                            z: 100,
                            left: 'center',
                            top: '0',
                            style: {
                                fill: '#ffffff',
                                text: [
                                    '南海一饭饭堂'
                                ],
                                fontSize:12
                            }
                        }
                    ]
                }]
            });
        },
    });
})
</script>
<!--1、不同年级学生用网情况（XTMC=软网关）14-19级）studentnet -->
<script>
    $(function(){
        var netChart = echarts.init(document.getElementById('net_div'));
        var grades=[];
        var nums=[];
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/getStudentnet.action",
            data:{},
            cache:false,
            async: false,
            dataType:"json",
            success : function (result) {
                for(var i in result){
                    grades.push(result[i].grade);
                    nums.push(result[i].number);
                };
                var chartData = nums;
                var chartName = grades;
                var myColor = ['#FFA483','#F97F53','#F45922'];
                netChart.setOption({ //加载数据图表
                    title : {
                        text: '不同年级学生用网情况（开设软网关）',
                        x:'left',
                        textStyle: {
                        	color :'#ffffff',
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
                    grid: {
                        left: '10%',
                        right: '10%',
                        bottom: '10%',
                        top: '10%',
                        containLabel: true
                    },
                    xAxis: [{
                            show: false,
                        },
                        {
                            show: false,
                        }
                    ],
                    yAxis: {
                        type: 'category',
                        inverse: true,
                        show: false
                    },

                    series: [
                        //亮色条 百分比
                        {
                            show: true,
                            type: 'bar',
                            barGap: '-100%',
                            barWidth: '20%',
                            z: 2,
                            itemStyle: {
                                normal: {
                                    color: function(params) {
                                        var num = myColor.length;
                                        return myColor[params.dataIndex % num]
                                    }
                                }
                            },
                            label: {
                                normal: {
                                    show: true,
                                    textStyle: {
                                        color: '#ffffff',
                                        fontSize: 12,
                                        
                                    },
                                    position: 'right',
                                    formatter: function(data) {
                                        return (chartData[data.dataIndex]) ;
                                    }
                                }
                            },
                            data: chartData,
                        },
                        //年份
                        {
                            show: true,
                            type: 'bar',
                            xAxisIndex: 1, //代表使用第二个X轴刻度
                            barGap: '-100%',
                            barWidth: '10%',
                            itemStyle: {
                                normal: {
                                    barBorderRadius: 200,
                                    color: 'transparent'
                                }
                            },
                            label: {
                                normal: {
                                    show: true,
                                    position: [0, '-20'],
                                    textStyle: {
                                        fontSize:16,
                                        color: '#ffffff',
                                        fontWeight: 'bold'
                                    },
                                    formatter: function(data) {
                                        return chartName[data.dataIndex]+ '级';
                                    }
                                }
                            },
                            data: chartData
                        }
                    ]
                });
            },
        });
    })
</script>
<!-- 7、学生近几年的消费情况 -->
<script>
    $(function(){
        var yearcostChart = echarts.init(document.getElementById('yearcost_div'));
        var nums=[];
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/getStudentyearcost.action",
            data:{},
            cache:false,
            async: false,
            dataType:"json",
            success : function (result) {
                for(var i in result){
                    nums.push(result[i].sum_cost);
                };
                yearcostChart.setOption({ //加载数据图表
                    title: {
                        text: '学生近几年的消费情况',
                        left: 'left',
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
                    tooltip: {
                        trigger: 'axis',
                        show: false
                    },
                    radar: {
                        indicator: [{
                                name: '2016年',
                                num: 24900
                            },
                            {
                                name: '2017年',
                                num: 3023531481
                            },
                            {
                                name: '2018年',
                                num: 4101342687
                            }, {
                                name: '2019年',
                                num: 2836075313
                            }
                        ],
                        radius: '55%',
                        center: ['50%', '50%'],
                        shape: 'circle',
                        splitNumber: 4,
                        name: {
                            textStyle: {
                                color: '#F6F46D',
                                fontSize: 14
                            },
                            formatter: function(value, indicator) {
                                return '{a|' + value + '} {b|' + indicator.num + '}'
                            },
                            lineHeight: 20,
                            rich: {
                                a: {
                                    fontSize: 12,
                                    align: 'center'
                                },
                                b: {
                                    fontSize: 12,
                                    align: 'left'
                                }
                            }
                        },
                        splitArea: {
                            areaStyle: {
                                color: ['rgba(255,255,255,0.1)',
                                    'rgba(255,255,255,0.03)', 'rgba(255,255,255,0.1)',
                                    'rgba(255,255,255,0.03)'
                                ]
                            }
                        },
                        splitLine: {
                            lineStyle: {
                                type: "dashed",
                                width: 1
                            }
                        },
                        axisLine: {
                            lineStyle: {
                                color: 'rgba(238,238,238, 0.2)'
                            }
                        }
                    },
                    series: {
                        name: '消费',
                        type: 'radar',
                        tooltip: {
                            trigger: 'item'
                        },
                        data: [{
                            value: nums,
                        }],
                        symbol: 'circle',
                        symbolSize: 12,
                        itemStyle: {
                            normal: {
                                color: 'rgba(246,241,111,0.8)',
                                borderColor: 'rgba(246,241,111,0.2)',
                                borderWidth: 12,
                            }
                        },
                        areaStyle: {
                            normal: {
                                color: 'rgba(246,241,111, 0.5)',
                            }
                        },
                        lineStyle: {
                            normal: {
                                type: "dashed",
                                color: 'rgba(246,241,111, 1)',
                                width: 2
                            }
                        },

                    }
                });
            },
        });
    })
</script>
<!-- 8、学生19年的月总额和月均消费情况 -->
<script>
    $(function(){
        var monthcostChart = echarts.init(document.getElementById('monthcost_div'));
        var months = [];
        var sums = [];
        var avgs=[];
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/getStudentmonthcost.action",
            data:{},
            cache:false,
            async: false,
            dataType:"json",
            success : function (result) {
                for(var i in result){
                    months.push(result[i].month);
                    sums.push(result[i].sum_cost);
                    avgs.push(result[i].avg_cost);
                };
                monthcostChart.setOption({ //加载数据图表
                	title: {
                        text: '2019年学生的月总额和月均消费情况',
                        textStyle: {
                        	 align: 'left',
                            color: '#ffffff',
                            fontSize: 16,
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
                        top: "25%",
                        left: "15%",
                        bottom: "10%"
                    },
                    tooltip: {
                        trigger: "axis",
                        axisPointer: {
                            type: "shadow",
                            label: {
                                show: true
                            }
                        }
                    },
                    legend: {
                        data: ["月平均消费金额", "月总消费金额"],
                        top: "15%",
                        textStyle: {
                            color: "#ffffff"
                        }
                    },
                    xAxis: {
                        data: months,
                        axisLine: {
                            show: true //隐藏X轴轴线
                        },
                        axisTick: {
                            show: true //隐藏X轴刻度
                        },
                        axisLabel: {
                            show: true,
                            textStyle: {
                                color: "#ebf8ac" //X轴文字颜色
                            }
                        },
                         axisLine: {
                                    lineStyle: {
                                        color: '#01FCE3'
                                        }
                                },
                    },
                    yAxis: [{
                            type: "value",
                            name: "总消费/元",
                            nameTextStyle: {
                                color: "#ebf8ac"
                            },
                            splitLine: {
                                show: false
                            },
                            splitLine: {
                                show: false
                            },
                            axisTick: {
                                show: true
                            },
                            axisLine: {
                                show: true
                            },
                            axisLabel: {
                                show: true,
                                textStyle: {
                                    color: "#ebf8ac"
                                }
                            },
                             axisLine: {
                                        lineStyle: {
                                            color: '#FFFFFF'
                                            }
                                    },
                        },
                        {
                            type: "value",
                            name: "平均消费/元",
                            nameTextStyle: {
                                color: "#ebf8ac"
                            },
                            position: "right",
                            splitLine: {
                                show: false
                            },
                            splitLine: {
                                show: false
                            },
                            axisTick: {
                                show: false
                            },
                            axisLine: {
                                show: false
                            },
                            axisLabel: {
                                show: true,
                                formatter: "{value} ", //右侧Y轴文字显示
                                textStyle: {
                                    color: "#ebf8ac"
                                }
                            }
                        },
                        {
                            type: "value",
                            gridIndex: 0,
                            min: 50,
                            max: 100,
                            splitNumber: 8,
                            splitLine: {
                                show: false
                            },
                            axisLine: {
                                show: false
                            },
                            axisTick: {
                                show: false
                            },
                            axisLabel: {
                                show: false
                            },
                            splitArea: {
                                show: true,
                                areaStyle: {
                                    color: ["rgba(250,250,250,0.0)", "rgba(250,250,250,0.05)"]
                                }
                            }
                        }
                    ],
                    series: [{
                            name: "月平均消费金额",
                            type: "line",
                            yAxisIndex: 1, //使用的 y 轴的 index，在单个图表实例中存在多个 y轴的时候有用
                            smooth: true, //平滑曲线显示
                            showAllSymbol: true, //显示所有图形。
                            symbol: "circle", //标记的图形为实心圆
                            symbolSize: 10, //标记的大小
                            itemStyle: {
                                //折线拐点标志的样式
                                color: "#058cff"
                            },
                            lineStyle: {
                                color: "#058cff"
                            },
                            areaStyle:{
                                color: "rgba(5,140,255, 0.2)"
                            },
                            data: avgs
                        },
                        {
                            name: "月总消费金额",
                            type: "bar",
                            barWidth: 15,
                            itemStyle: {
                                normal: {
                                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                            offset: 0,
                                            color: "#00FFE3"
                                        },
                                        {
                                            offset: 1,
                                            color: "#4693EC"
                                        }
                                    ])
                                }
                            },
                            data: sums
                        }
                    ]
                });
            },
        });
    })
</script>
<!-- 2、不同年级学生的平均消费水平 studentcost -->
<script>
$(function(){
    var costChart = echarts.init(document.getElementById('cost_div'));
    var grades=[];
    var cost_nums=[];
    $.ajax({
        type:"POST",
        url:"${pageContext.request.contextPath}/getStudentcost.action",
        data:{},
        cache:false,
        async: false,
        dataType:"json",
        success : function (result) {
			//alert("data:"+result);
            for(var i in result){
                grades.push(result[i].grade);
                cost_nums.push(result[i].cost);
            };
            costChart.setOption({ //加载数据图表
           title: {
               text: "不同年级学生的平均消费水平",
               left: "left",
               textStyle: {
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
               top: '20%',
               left: '10%',
               right: '10%',
               bottom: '15%',
               containLabel: true,
           },
           xAxis: {
               type: 'category',
               boundaryGap: false,
               data: grades,
               axisLabel: {
                   margin: 30,
                   color: '#ffffff'
               },
               axisLine: {
                   show: false
               },
               axisTick: {
                   show: true,
                   length: 25,
                   lineStyle: {
                       color: "#ffffff1f"
                   }
               },
               splitLine: {
                   show: true,
                   lineStyle: {
                       color: '#ffffff1f'
                   }
               }
	           },
	           yAxis: [{
	               type: 'value',
	               position: 'right',
	               axisLabel: {
	                   margin: 20,
	                   color: '#ffffff'
	               },
	
	               axisTick: {
	                   show: true,
	                   length: 15,
	                   lineStyle: {
	                       color: "#ffffff1f",
	                   }
	               },
	               splitLine: {
	                   show: true,
	                   lineStyle: {
	                       color: '#ffffff1f'
	                   }
	               },
	               axisLine: {
	                   lineStyle: {
	                       color: '#ffffff1f',
	                       width: 2
	                   }
	               }
	           }],
	           series: [{
	               name: '注册总量',
	               type: 'line',
	               smooth: true, //是否平滑曲线显示
	               showAllSymbol: true,
	               symbol: 'circle',
	               symbolSize: 6,
	               lineStyle: {
	                   normal: {
	                       color: "#fff", // 线条颜色
	                   },
	               },
	               label: {
	                   show: true,
	                   position: 'top',
	                   textStyle: {
	                       color: '#fff',
	                   }
	               },
	               itemStyle: {
	                   color: "red",
	                   borderColor: "#fff",
	                   borderWidth: 3
	               },
	               tooltip: {
	                   show: false
	               },
	               areaStyle: {
	                   normal: {
	                       color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
	                               offset: 0,
	                               color: '#eb64fb'
	                           },
	                           {
	                               offset: 1,
	                               color: '#3fbbff0d'
	                           }
	                       ], false),
	                   }
	               },
	               data: cost_nums
	           }]
            });
        },
    });
})
</script>
<!-- 6、低于平均消费水平的学生之中不同年级之间的占比 -->
<script>
    $(function(){
        var avgcostChart = echarts.init(document.getElementById('avgcost_div'));
        var grades=[];
        var nums=[];
        var avgcostdata=[];
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/getStudentavgcost.action",
            data:{},
            cache:false,
            async: false,
            dataType:"json",
            success : function (result) {
				//alert("data:"+result);
                for(var i in result){
                    grades.push(result[i].sfrzh);
                    nums.push(result[i].avg_cost);
                    var map={};
                    map.name=result[i].sfrzh;
                    map.value=result[i].avg_cost;
                    avgcostdata[i]=map;
                };
                avgcostChart.setOption({ //加载数据图表
                    title: {
                        text: '不同年级低于平均消费水平占比',
                        left: 'left',
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
                    tooltip : {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    color:['#8fc31f','#f35833','#00ccff','#ffcc00'],
                    series : [
                        {
                            name: '不同年级低于平均消费水平占比',
                            type: 'pie',
                            radius : '40%',
                           center: ["50%", "50%"],
                           radius: ["30%", "45%"],
                           data: avgcostdata,
                            itemStyle: {
                                emphasis: {
                                    shadowBlur: 6,
                                    shadowOffsetX: 0,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            },
                            itemStyle: {
                                normal: {
                                    label:{ 
                                        show: true, 
                                        fontSize: 12,
                                        formatter: '{b} : {c} ({d}%)' 
                                    },
                                     borderColor: '#ffffff1f',
                            		 borderWidth: 8,
                                },
                                labelLine :{
                                	
        	                        show: false
                                }
                            }
                        }
                    ],
                    graphic: [{
                        type: 'group',
                        left: 'center',
                        top: 'middle',
                        children: [{
                                type: 'text',
                                z: 100,
                                left: 'center',
                                top: '5',
                                style: {
                                    fill: '#ffffff',
                                    text: [
                                        '学生平均消费水平'
                                    ],
                                    font: '12px Microsoft YaHei',
                                    fontSize: '12'
                                }
                            },
                            {
                                type: 'text',
                                z: 100,
                                left: 'center',
                                top: '32',
                                style: {
                                    fill: 'red',
                                    text: [
                                        '4.9630元'
                                    ],
                                    font: '16px Microsoft YaHei'
                                }
                            }
                        ]
                    }]
                });
            },
        });
    })
</script>
<!-- 3、不同年级学生消费类别（XFLB）占比（固定消费类别）studenttype -->
<script>
$(function(){
    var typeChart = echarts.init(document.getElementById('type_div'));
    var grade=[];
    var xflb=[];
    var six=[];
    var seven=[];
    var eight=[];
    var nine=[];
    $.ajax({
        type:"POST",
        url:"${pageContext.request.contextPath}/getStudenttype.action",
        data:{},
        cache:false,
        async: false,
        dataType:"json",
        success : function (result) {
			for(var j=0;j< result[0].grade.length;j++){
				grade.push(result[0].grade[j]);
                xflb.push(result[0].xflb[j]);
                six.push(result[0].six[j]);
                seven.push(result[0].seven[j]);
                eight.push(result[0].eight[j]);
                nine.push(result[0].nine[j]);
			};
			var fontColor = '#30eee9';
            typeChart.setOption({ //加载数据图表
            	title:{
                    text:'不同年级学生消费类别占比',
                    left:'left',
                    textStyle:{
                        color:'#ffffff',
                        align:'left',
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
            		grid: {
            	        left: '5%',
                        right: '5%',
                        top:'20%',
            	        bottom: '8%',
            	        containLabel: true
            		},
            		tooltip : {
            	        trigger: 'axis',
            	        axisPointer: {
            	            type: 'cross',
            	            label: {
            	                backgroundColor: '#6a7985'
            	            }
            	        }
            	    },
            		legend: {
            			show:true,
            			x:'right',
            			top:'12%',
            			y:'35',
            			icon: 'stack',
            			itemWidth:10,
            			itemHeight:10,
            			textStyle:{
            				color:'#1bb4f6'
            			},
            			data:grade
            		},
            		xAxis : [
            	        {
            	            type : 'category',
            	            boundaryGap : false,
            	            axisLabel:{
            	            	color: fontColor
            	            },
            	            axisLine:{
                           		show:true,
                           		lineStyle:{
            		            	color:'#397cbc'
            		            }
            				},
            				axisTick:{
            	            	show:false,
            	            },  
            	            splitLine:{
            	            	show:false,
            		            lineStyle:{
            		            	color:'#195384'
            		            }
            		        },
            	            data : xflb
            	        }
            	    ],
            	    yAxis : [
            			{
            				type : 'value',
            				name : '数量',
            				axisLabel : {
            					formatter: '{value}',
            					textStyle:{
            						color:'#2ad1d2'
            					}
            				},
            				axisLine:{
            					lineStyle:{
            						color:'#27b4c2'
            					}
            				},
            				axisTick:{
            	            	show:false,
            	            },
            				splitLine:{
            					show:true,
            					lineStyle:{
            						color:'#11366e'
            					}
            				}
            			}
            		],
            		series : [
            			
            			{
            				name:'2016',
            				type:'line',
            				stack: '总量',
            				symbol:'circle',
            				symbolSize: 8,
            	            itemStyle: {
            			        normal: {
            			            color: '#aecb56',
            			            lineStyle: {
            							color: "#aecb56",
            							width:1
            			            },
            			            areaStyle: { 
            							color: new echarts.graphic.LinearGradient(0, 1, 0, 0, [{
            								offset: 0,
            								color: 'rgba(7,44,90,0.3)'
            							}, {
            								offset: 1,
            								color: 'rgba(114,144,89,0.9)'
            							}]),
            			            }
            			        }
            				},
            				data:six
            			},
            			{
            				name:'2017',
            				type:'line',
            				stack: '总量',
            				symbol:'circle',
            				symbolSize: 8,
            	            itemStyle: {
            			        normal: {
            			            color: '#3A44FB',
            			            lineStyle: {
            							color: "#3A44FB",
            							width:1
            			            },
            			            areaStyle: { 
            							color: new echarts.graphic.LinearGradient(0, 1, 0, 0, [{
            								offset: 0,
            								color: 'rgba(7,46,101,0.3)'
            							}, {
            								offset: 1,
            								color: 'rgba(0,166,246,0.9)'
            							}]),
            			            }
            			        }
            				},
            				data:seven
            			},
            			{
            				name:'2018',
            				type:'line',
            				stack: '总量',
            				symbol:'circle',
            				symbolSize: 8,
            	            itemStyle: {
            			        normal: {
            			            color: '#6FE81A',
            			            lineStyle: {
            							color: "#6FE81A",
            							width:1
            			            },
            			            areaStyle: { 
            							color: new echarts.graphic.LinearGradient(0, 1, 0, 0, [{
            								offset: 0,
            								color: 'rgba(7,44,90,0.3)'
            							}, {
            								offset: 1,
            								color: 'rgba(0,212,199,0.9)'
            							}]),
            			            }
            			        }
            				},
            				data:eight
            			},
            			{
            				name:'2019',
            				type:'line',
            				stack: '总量',
            				symbol:'circle',
            				symbolSize: 8,
            	            itemStyle: {
            			        normal: {
            			            color: '#aecb56',
            			            lineStyle: {
            							color: "#aecb56",
            							width:1
            			            },
            			            areaStyle: { 
            							color: new echarts.graphic.LinearGradient(0, 1, 0, 0, [{
            								offset: 0,
            								color: 'rgba(7,44,90,0.3)'
            							}, {
            								offset: 1,
            								color: 'rgba(0,212,199,0.9)'
            							}]),
            			            }
            			        }
            				},
            				data:nine
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
			two_div.resize();
			one_div.resize();
			yearcost_div.resize();
			cost_div.resize();
			avgcost_div.resize();
			net_div.resize();
			monthcost_div.resize();
			type_div.resize();
		}
	});
</script>
</body>
</html>