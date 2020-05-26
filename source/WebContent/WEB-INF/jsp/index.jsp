<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<title>首页</title>
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
			<a href="index.action" class="a1">总体分析</a>
			<a href="teacher.action" class="a0">教职工分析</a>
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
							<!--4.2018学年各季度消费人流量占比，分季度：1-3, 4-6, 7-9, 10-12，tbseason  -->
							<div class="fill-h" id="season_div"></div>
						</div>
					</div>
					<div class="xpanel-wrapper xpanel-wrapper-2">
						<div class="xpanel">
							<!--3、各类交易类型（JYLX）占比 tbkind  -->
							<h5 style="color:#ffffff; font-weight: bold">各类交易类型占比</h5>
							<div class="fill-h" id="kind_div"></div>
						</div>
					</div>
					
				</div>
				
				<div class="col-lg-6 fill-h">
					<div class="xpanel-wrapper xpanel-wrapper-1">
						<div class="xpanel">
							<!--1. 最受师生欢迎的消费地点top15（师生消费最多的场所）SHMC  -->
							<div class="fill-h" id="place_div"></div>
						</div>
					</div>
					
				</div>
				
				<div class="col-lg-3 fill-h">
					<div class="xpanel-wrapper xpanel-wrapper-2">
						<div class="xpanel">
							<!-- 2.tbtype各类消费类别（XFLB）占比 tbtype  -->
							<div class="fill-h" id="type_div"></div>
						</div>
					</div>
					<div class="xpanel-wrapper xpanel-wrapper-2">
						<div class="xpanel">
							<!-- 8.小卖部类型商户2019年10月的日营业额走势-->
							<div class="fill-h" id="shop_div"></div>
						</div>
					</div>
					
				</div>
				
				<!--换屏  -->
				<div class="col-lg-3 fill-h">
					<div class="xpanel-wrapper xpanel-wrapper-3">
						<div class="xpanel">
							<!--5、2015-2019五年内的消费总金额 tbmoney  -->
							<div class="fill-h" id="money_div"></div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-6 fill-h">
					<div class="xpanel-wrapper xpanel-wrapper-3">
						<div class="xpanel">
							<!-- 7、2019年各个饭堂的人流量 tbcanteen-->
							<div class="fill-h" id="canteen_div"></div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 fill-h">
					<div class="xpanel-wrapper xpanel-wrapper-3">
						<div class="xpanel">
							<!-- 6、平均营业额top10的商户 tbshmc -->
							<h5 style="color:#ffffff; font-weight: bold">平均营业额top10的商户</h5>
							<div class="fill-h" id="avg_div"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<!--4.2018学年各季度消费人流量占比，分季度：1-3, 4-6, 7-9, 10-12，tbseason  -->
<script>
$(function(){
    var tbseasonChart = echarts.init(document.getElementById('season_div'));
    var seasons=[];
    var season_nums=[];
    $.ajax({
        type:"POST",
        url:"${pageContext.request.contextPath}/getSeason.action",
        data:{},
        cache:false,
        async: false,
        dataType:"json",
        success : function (result) {
            for(var i in result){
                seasons.push(result[i].season);
                season_nums.push(result[i].number);
            };
            var colorArray = [
                {
                    top: '#1ace4a', //绿
                    bottom: 'rgba(11,42,84, 0.3)'
                },
                {
                    top: '#4bf3ff', //蓝
                    bottom: 'rgba(11,42,84,.3)'
                },
                {
                    top: '#ffa800', //黄
                    bottom: 'rgba(11,42,84,.3)'
                },
                {
                    top: '#b250ff', //粉
                    bottom: 'rgba(11,42,84,.3)'
                }
            ];
            tbseasonChart.setOption({ //加载数据图表
            	title: {
                    text: '2018学年各季度消费人流量占比',
                    textStyle: {
                   	 	align: 'left',
                       color: '#ffffff',
                       fontSize: 16,
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
                grid:{
                    left:'8%',
                    top:'10%',
                    bottom:'10%',
                    right:'15%',
                    containLabel:true
                },
                tooltip: {
                     show: true,
                     formatter: "{b}:{c}"
                   },
	               xAxis: {
	                   type: 'value',
	                   show:false,
	                   position: 'top',
	                   axisTick: {
	                       show: false
	                   },
	                   axisLine: {
	                       show: false,
	                       lineStyle: {
	                           color: '#ffffff',
	                       }
	                   },
	                   splitLine: {
	                       show: false
	                   },
	               },
	               yAxis: [{
	                       type: 'category',
	                       axisTick: {
	                           show: false,
	                           alignWithLabel: false,
	                           length: 5,
	
	                       },
	                       "splitLine": { //网格线
	                           "show": false
	                       },
	                       inverse: 'true', //排序
	                       axisLine: {
	                           show: false,
	                           lineStyle: {
	                               color: '#ffffff',//字体颜色
	                           }
	                       },
	                       data: seasons
	                   }
	
	               ],
	               series: [{
	                       name: '人流量',
	                       type: 'bar',
	                           label: {
	                           normal: {
	                             show: true,
	                             position: 'right',
	                             formatter: '{c}',
	                             textStyle: {
	                               color: 'ffffff' //字体颜色
	                             }
	                           }
	                         },
	                       itemStyle: {
	                           normal: {
	                               show: true,
	                               color: function(params) {
	                                   let num = colorArray.length;
	                                   return {
	                                       type: 'linear',
	                                       colorStops: [{
	                                           offset: 0,
	                                           color: colorArray[params.dataIndex % num].bottom
	                                       }, {
	                                           offset: 1,
	                                           color: colorArray[params.dataIndex % num].top
	                                       }, {
	                                           offset: 0,
	                                           color: colorArray[params.dataIndex % num].bottom
	                                       }, {
	                                           offset: 1,
	                                           color: colorArray[params.dataIndex % num].top
	                                       }, {
	                                           offset: 0,
	                                           color: colorArray[params.dataIndex % num].bottom
	                                       }, {
	                                           offset: 1,
	                                           color: colorArray[params.dataIndex % num].top
	                                       }, {
	                                           offset: 0,
	                                           color: colorArray[params.dataIndex % num].bottom
	                                       }, {
	                                           offset: 1,
	                                           color: colorArray[params.dataIndex % num].top
	                                       }, {
	                                           offset: 0,
	                                           color: colorArray[params.dataIndex % num].bottom
	                                       }, {
	                                           offset: 1,
	                                           color: colorArray[params.dataIndex % num].top
	                                       }, {
	                                           offset: 0,
	                                           color: colorArray[params.dataIndex % num].bottom
	                                       }, {
	                                           offset: 1,
	                                           color: colorArray[params.dataIndex % num].top
	                                       }],
	                                       //globalCoord: false
	                                   }
	                               },
	                               barBorderRadius: 70,
	                               borderWidth: 0,
	                               borderColor: '#333',
	                           }
	                       },
	                       barGap: '0%',
	                       barCategoryGap: '50%',
	                       data: season_nums
	                   }
	
	               ]
            });
        },
    });
}) 
</script>
<!--3、各类交易类型（JYLX）占比 tbkind  -->
<script>
$(function(){
    var tbkindChart = echarts.init(document.getElementById('kind_div'));
    var jylxs=[];
    var jylx_nums=[];
    var kinddata=[];
    $.ajax({
        type:"POST",
        url:"${pageContext.request.contextPath}/getKind.action",
        data:{},
        cache:false,
        async: false,
        dataType:"json",
        success : function (result) {
			//alert("data:"+result);
            for(var i in result){
                jylxs.push(result[i].jylx);
                jylx_nums.push(result[i].number);
                var map={};
                map.name=result[i].jylx;
                map.value=result[i].number;
                kinddata[i]=map;
            };
            var data = kinddata
            var titleArr= [], seriesArr=[];
            colors=[['#389af4', '#dfeaff'],['#ff8c37', '#ffdcc3'],['#ffc257', '#ffedcc'], ['#fd6f97', '#fed4e0'],['#a181fc', '#e3d9fe']]
            data.forEach(function(item, index){
                titleArr.push(
                    {
                        text:item.name,
                        left: index * 19 + 8 +'%',
                        top: '65%',
                        textAlign: 'center',
                        textStyle: {
                            fontWeight: 'normal',
                            fontSize: '10',
                            color: colors[index][0],
                            textAlign: 'center',
                        },
                    }        
                );
                seriesArr.push(
                    {
                        name: item.name,
                        type: 'pie',
                        clockWise: false,
                        radius: [25, 35],
                        itemStyle:  {
                            normal: {
                                color: colors[index][0],
                                shadowColor: colors[index][0],
                                shadowBlur: 0,
                                label: {
                                    show: false
                                },
                                labelLine: {
                                    show: false
                                },
                            }
                        },
                        hoverAnimation: false,
                        center: [index * 19 + 12 +'%', '50%'],
                        data: [{
                            value: item.value,
                            label: {
                                normal: {
                                    formatter: function(params){
                                        return params.value;
                                    },
                                    position: 'center',
                                    show: true,
                                    textStyle: {
                                        fontSize: '10',
                                        fontWeight: 'bold',
                                        color: colors[index][0]
                                    }
                                }
                            },
                        }, {
                            value: 30000000-item.value,
                            name: 'invisible',
                            itemStyle: {
                                normal: {
                                    color: colors[index][1]
                                },
                                emphasis: {
                                    color: colors[index][1]
                                }
                            }
                        }]
                    }    
                )
            });
            tbkindChart.setOption({ //加载数据图表
            	toolbox: {
                    show: true,
                    feature: {
                        dataView: {readOnly: false},
                        restore: {},
                        saveAsImage: {}
                    }
                },
            	title:titleArr,
                series: seriesArr
            });
        },
    });
})
</script>
<!--5、2015-2019五年内的消费总金额 tbmoney  -->
<script>
$(function(){
    var tbmoneyChart = echarts.init(document.getElementById('money_div'));
    var years=[];
    var money_nums=[];
    $.ajax({
        type:"POST",
        url:"${pageContext.request.contextPath}/getMoney.action",
        data:{},
        cache:false,
        async: false,
        dataType:"json",
        success : function (result) {
			//alert("data:"+result);
            for(var i in result){
                years.push(result[i].year);
                money_nums.push(result[i].money);
            };
            var data_val= money_nums,
            	xAxis_val= years;
        	var data_val1=[0,0,0,0,0,0,0];
            tbmoneyChart.setOption({ //加载数据图表
            	title: {
                    text: '2015-2019五年内的消费总金额走势',
                    x:'left',
                    textStyle:{
                    	color :'#ffffff',
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
                grid:{
                	top: '10%',
                    left: '1%',
                    right:'9%',
                    bottom: '3%',
                    containLabel:true
                },
                tooltip:{
                    show:true,
                    backgroundColor:'#384157',
                    borderColor:'#384157',
                    borderWidth:1,
                    formatter:'{b}:{c}',
                    extraCssText:'box-shadow: 0 0 5px rgba(0, 0, 0, 1)'
                },
                legend:{
                    right:'10%',
                    top:'8%',
                    data:['总金额'],
                     textStyle:{
                        color :'#ffffff'
                    }
                },
                xAxis: {
                    data: xAxis_val,
                    boundaryGap:false,
                    axisLine:{
                        show:false
                    },
                    axisLabel: {
                        textStyle: {
                            color: '#ffffff'
                        }  
                    },
                    axisTick:{
                        show:false
                    }
                },
                yAxis: { 
                    ayisLine:{
                        show:false
                    },
                     axisLabel: {
                        textStyle: {
                            color: '#ffffff'
                        }  
                    },
                    splitLine:{
                        show:false,
                        lineStyle:{
                            color:'#ffffff'
                        }
                    },
                    axisLine: {
                            lineStyle: {
                                color: '#384157'
                            }
                        }
                },
                series: [
                    {
                        type: 'bar',
                        name:'linedemo',
                        tooltip:{
                            show:false
                        },
                        animation:false,
                        barWidth:1.4,
                        hoverAnimation:false,
                        data:data_val,
                        itemStyle:{
                            normal:{
                                color:'#f17a52',
                                opacity:0.6,
                                label:{
                                    show:false
                                }
                            }
                        }
                    },
                    {
                        type: 'line',
                        name:'总金额',
                        animation:false,
                        symbol:'circle',
                        hoverAnimation:false,
                        data:data_val1,
                        itemStyle:{
                            normal:{
                                color:'#f17a52',
                                opacity:0,
                            }
                        },
                        lineStyle:{
                            normal:{
                                width:1,
                                color:'#384157',
                                opacity:1
                            }
                        }
                    },
                    {
                        type: 'line',
                        name:'linedemo',
                        smooth:true,
                        symbolSize:10,
                        animation:false,
                        lineWidth:1.2,
                        hoverAnimation:false,
                        data:data_val,
                        symbol:'circle',
                        itemStyle:{
                            normal:{
                                color:'#f17a52',
                                shadowBlur: 40,
                                label:{
                                    show:true,
                                    position:'top',
                                    textStyle:{
                                        color:'#f17a52',
                                
                                    }
                                }
                            }
                        },
                       areaStyle:{
                            normal:{
                                color:'#f17a52',
                                opacity:0.08
                            }
                        }
                    }
                ]
            });
        },
    });
})
</script>
<!--1. 最受师生欢迎的消费地点top15（师生消费最多的场所）SHMC  -->
<script>
    $(function(){
        var tbplaceChart = echarts.init(document.getElementById('place_div'));
        var shmcs=[];
        var shmc_nums=[];
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/getPlace.action",
            data:{},
            cache:false,
            async: false,
            dataType:"json",
            success : function (result) {
                for(var i in result){
                    shmcs.push(result[i].shmc);
                    shmc_nums.push(result[i].number);
                };
                var res = {
               	    "colValues": {
               	        "0": shmc_nums
               	    },
               	    "title": "数据",
               	    "labels": shmcs
               	}
               	var _data = [{
               	    symbolSize: 60,
               	    label: {
               	        show: false
               	    },
               	    value: [0, 0],
               	}];
               	var _nameArr = [];
               	var _valuelArr = [];
               	var _linesDatas = []
               	 _nameArr = res.labels;
               	    _valuelArr = res.colValues[0];
               	for (var i = 0; i < _nameArr.length; i++) {
               	    _data.push({
               	        name: _nameArr[i],
               	        s: _valuelArr[i],
               	        value:[1,_nameArr.length-i]
               	    });
               	    _linesDatas.push(
               	         [{
               	            coord: [0, 0], // 起点
               	        },
               	        {
               	            coord: [0.96, _nameArr.length-i+0.03], // 起点
               	        },]
               	    )
               	}
                tbplaceChart.setOption({ //加载数据图表
                    title : {
                        text: '最受师生欢迎的消费场所',
                        x:'left',
                        textStyle: {
                            color: '#ffffff',
                            fontSize: 16,
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
                    polar: {},
                    radiusAxis: {
                        show: false
                    },
                    angleAxis: {
                        type: 'value',
                        show: false,
                        clockwise: false
                    },
                    series: [{
                           type: 'graph',
                           hoverAnimation: false,
                           coordinateSystem: 'polar',
                           label: {
                               normal: {

                                   show: true,
                                   position: 'outside',
                                   fontSize: 12,
                                   formatter: function(params) {
                                       var num = 10;
                                       var s = ''
                                       if(params.data.name){
                                           var _length = params.data.name.length;
                                           var c =_length/num
                                           for(var i=0;i<c;i++){
                                               var index = i*num;
                                               var end = (i+1)*num;
                                               console.log(index+ ','+ end+ ','+params.data.name.substring(index,end))
                                               if(i!==0){
                                                   s=s+'\n'
                                               }
                                               s=s+params.data.name.substring(index,end)
                                           }
                                       }
                                       if (params.data.s) {
                                           s = s + '\n' + '(' + params.data.s + ')'
                                       }
                                       return s
                                   },
                                   color: '#ffffff', //字体颜色
								   fontSize: '12'
                               }
                           },
                           symbolSize: 25,
                           nodes: _data,
                           silent: false,
                           zlevel:2
                       },
                       {
                           type: 'lines',
                           coordinateSystem: 'polar',
                           lineStyle: {
                               color: '#25cfb6',
                               width: 1,
                               opacity: 1,
                               curveness: .5
                           },
                           effect: {
                               show: true,
                               symbol: 'roundRect',
                               symbolSize: [3, 8],
                               color: 'rgba(130,245,95,.64)',
                               trailLength: .3,
                               label: {
                                   show: false
                               },
                           },
                           data: _linesDatas,
                           markLine: {

                           },
                           label: {
                               show: false
                           },
                           symbol: ['none', 'arrow'],
                           symbolSize: 10,
                           zlevel: 1
                       }
                   ]
                });
            },
        });
    })
</script>
<!-- 7、2019年各个饭堂的人流量 tbcanteen-->
<script>
$(function(){
    var tbcanteenChart = echarts.init(document.getElementById('canteen_div'));
    var shmcs=[];
    var people_nums=[];
    $.ajax({
        type:"POST",
        url:"${pageContext.request.contextPath}/getCanteenpeople.action",
        data:{},
        cache:false,
        async: false,
        dataType:"json",
        success : function (result) {
            for(var i in result){
                shmcs.push(result[i].shmc);
                people_nums.push(result[i].people);
            };
            tbcanteenChart.setOption({ //加载数据图表
            	title: {
                    text: '2019年各个饭堂的人流量对比',
                    x:'left',
                    textStyle: {
                    	 align: 'center',
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
                    top: "20%",
                    right: '15$',
                    left: '13%',
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
                xAxis: {
                    data: shmcs,
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
                        name: "人",
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
                        gridIndex: 0,
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
                series: [
                    {
                        name: "人流量",
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
                        data: people_nums
                    }
                ]
            });
        },
    });
})
</script>
<!-- 2.tbtype各类消费类别（XFLB）占比 tbtype  -->
<script>
    $(function(){
        var tbtypeChart = echarts.init(document.getElementById('type_div'));
        var xflbs=[];
        var xflb_nums=[];
        var typedata=[];
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/getXflbType.action",
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
                data = typedata;
	            arrName = getArrayValue(data, "name");
	            arrValue = getArrayValue(data, "value");
	            sumValue = eval(arrValue.join('+'));
	            objData = array2obj(data, "name");
	            optionData = getData(data);
	            function getArrayValue(array, key) {
	                var key = key || "value";
	                var res = [];
	                if (array) {
	                    array.forEach(function(t) {
	                        res.push(t[key]);
	                    });
	                }
	                return res;
	            }
	            function array2obj(array,key) {
	            	var resObj = {};
	            	for(var i=0;i<array.length;i++){
	            		resObj[array[i][key]] = array[i];
	            	}
	            	return resObj;
	            }
	            function getData(data) {
	                var res = {
	                    series: [],
	                    yAxis: []
	                };
	                for (let i = 0; i < data.length; i++) {
	                    res.series.push({
	                        name: '消费类别',
	                        type: 'pie',
	                        clockWise: false, //顺时加载
	                        hoverAnimation: false, //鼠标移入变大
	                        radius: [65 - i * 15 + '%', 57 - i * 15 + '%'],
	                        center: ["40%", "55%"],
	                        label: {
	                            show: false
	                        },
	                        itemStyle: {
	                            label: {
	                                show: false,
	                            },
	                            labelLine: {
	                                show: false
	                            },
	                            borderWidth: 5,
	                        },
	                        data: [{
	                            value: data[i].value,
	                            name: data[i].name
	                        }, {
	                            value: sumValue - data[i].value,
	                            name: '',
	                            itemStyle: {
	                                color: "rgba(0,0,0,0)",
	                                borderWidth: 0
	                            },
	                            tooltip: {
	                                show: false
	                            },
	                            hoverAnimation: false
	                        }]
	                    });
	                    res.series.push({
	                        name: '',
	                        type: 'pie',
	                        silent: true,
	                        z: 1,
	                        clockWise: false, //顺时加载
	                        hoverAnimation: false, //鼠标移入变大
	                        radius: [65 - i * 15 + '%', 57 - i * 15 + '%'],
	                        center: ["40%", "55%"],
	                        label: {
	                            show: false
	                        },
	                        itemStyle: {
	                            label: {
	                                show: false,
	                            },
	                            labelLine: {
	                                show: false
	                            },
	                            borderWidth: 5,
	                        },
	                        data: [{
	                            value: 7.5,
	                            itemStyle: {
	                                color: "#E3F0FF",
	                                borderWidth: 0
	                            },
	                            tooltip: {
	                                show: false
	                            },
	                            hoverAnimation: false
	                        }, {
	                            value: 2.5,
	                            name: '',
	                            itemStyle: {
	                                color: "rgba(0,0,0,0)",
	                                borderWidth: 0
	                            },
	                            tooltip: {
	                                show: false
	                            },
	                            hoverAnimation: false
	                        }]
	                    });
	                }
	                return res;
	            }
                tbtypeChart.setOption({ //加载数据图表
                	title : {
                        text: '各类消费类别占比',
                        x:'left',
                        textStyle: {
                        	color:'#ffffff',
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
                    legend: {
                        show: true,
                        top: "center",
                        right: '5%',
                        data: arrName,
                        itemWidth: 15,
                        itemHeight: 10,
                        width:25,
                        padding: [0, 2],
                        itemGap: 10,
                        formatter: function(name) {
                            return "{title|" + name + "}\n{value|" + (objData[name].value) + "}"
                        },
                        textStyle: {
                            rich: {
                                title: {
                                    fontSize: 12,
                                    lineHeight: 10,
                                    color: "#ffffff"
                                },
                                value: {
                                    fontSize: 12,
                                    lineHeight: 18,
                                    color: "#ffffff"
                                }
                            }
                        },
                    },
                    tooltip: {
                        show: true,
                        trigger: "item",
                        formatter: "{a}<br>{b}:{c}({d}%)"
                    },
                    color: ['#dd2313','#FF8700', '#ffc300', '#00e473', '#009DFF','#a922ec'],
                    grid: {
                        top: '27%',
                        bottom: '10%',
                        left: "10%",
                        containLabel: false
                    },
                    yAxis: [{
                        type: 'category',
                        inverse: true,
                        axisLine: {
                            show: false
                        },
                        axisTick: {
                            show: false
                        },
                        axisLabel: {
                            interval: 0,
                            inside: true,
                            textStyle: {
                                color: "#ffffff",
                                fontSize: 12,
                            },
                            show: true
                        },
                        data: optionData.yAxis
                    }],
                    xAxis: [{
                        show: false
                    }],
                    series: optionData.series
                });
            },
        });
    })
</script>
<!-- 8.小卖部类型商户2019年10月的日营业额走势-->
<script>
$(function(){
    var tbshopChart = echarts.init(document.getElementById('shop_div'));
    var shmc=[];
    var jyrq=[];
    var supermarket=[];
    var fruit=[];
    var store=[];
    $.ajax({
        type:"POST",
        url:"${pageContext.request.contextPath}/getShopcost.action",
        data:{},
        cache:false,
        async: false,
        dataType:"json",
        success : function (result) {
            for(var i =0;i<result[0].jyrq.length;i++){
            	shmc.push(result[0].shmc[i]);
                jyrq.push(result[0].jyrq[i]);
                supermarket.push(result[0].supermarket[i]);
                fruit.push(result[0].fruit[i]);
                store.push(result[0].store[i]);
            };
            tbshopChart.setOption({ //加载数据图表
            	title: {
                    text: '小卖部类型商户2019年10月的日营业额走势',
                    textStyle: {
                    	align: 'left',
                        color: '#ffffff',
                        fontSize: 16,
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
                    trigger: 'axis'
                },
                legend: {
                    color: ["#F58080", "#47D8BE", "#F9A589"],
                    data: shmc,
                    x: 'left',
                    top: '10%',
                    textStyle: {
                    	color: '#ffffff'
                    }
                },
                grid: {
                    top: '35%',
                    left: '5%',
                    right: '8%',
                    bottom: '3%',
                    containLabel: true
                },
                xAxis: {
                    type: 'category',
                    data: jyrq,
                    axisLine: {
                        lineStyle: {
                            color: "#ffffff"
                        }
                    }
                },
                yAxis: {
                    type: 'value',
                    splitLine: {
                        show : false
                    },
                    axisLine: {
                        show: false,
                        lineStyle: {
                            color: "#ffffff"
                        },
                    },
                    nameTextStyle: {
                        color: "#ffffff"
                    },
                    splitArea: {
                        show: false
                    }
                },
                series: [{
                        name: '南海启航教学超市',
                        type: 'line',
                        data: supermarket,
                        color: "#F58080",
                        lineStyle: {
                            normal: {
                                width: 2,
                                color: {
                                    type: 'linear',

                                    colorStops: [{
                                        offset: 0,
                                        color: '#FFCAD4' // 0% 处的颜色
                                    }, {
                                        offset: 0.4,
                                        color: '#F58080' // 100% 处的颜色
                                    }, {
                                        offset: 1,
                                        color: '#F58080' // 100% 处的颜色
                                    }],
                                    globalCoord: false // 缺省为 false
                                },
                                shadowColor: 'rgba(245,128,128, 0.5)',
                                shadowBlur: 1,
                                shadowOffsetY: 3
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: '#F58080',
                                borderWidth: 2,
                                borderColor: "#F58080"
                            }
                        },
                        smooth: true
                    },
                    {
                        name: '南海语晨水果便利店',
                        type: 'line',
                        data: fruit,
                        lineStyle: {
                            normal: {
                                width: 2,
                                color: {
                                    type: 'linear',
                                    colorStops: [{
                                            offset: 0,
                                            color: '#AAF487' // 0% 处的颜色
                                        },
                                        {
                                            offset: 0.4,
                                            color: '#47D8BE' // 100% 处的颜色
                                        }, {
                                            offset: 1,
                                            color: '#47D8BE' // 100% 处的颜色
                                        }
                                    ],
                                    globalCoord: false // 缺省为 false
                                },
                                shadowColor: 'rgba(71,216,190, 0.5)',
                                shadowBlur: 1,
                                shadowOffsetY: 3
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: '#AAF487',
                                borderWidth: 2,
                                borderColor: "#AAF487"
                            }
                        },
                        smooth: true
                    },
                    {
                        name: '轻院快乐惠小卖部',
                        type: 'line',
                        data: store,
                        lineStyle: {
                            normal: {
                                width: 2,
                                color: {
                                    type: 'linear',

                                    colorStops: [{
                                            offset: 0,
                                            color: '#F6D06F' // 0% 处的颜色
                                        },
                                        {
                                            offset: 0.4,
                                            color: '#F9A589' // 100% 处的颜色
                                        }, {
                                            offset: 1,
                                            color: '#F9A589' // 100% 处的颜色
                                        }
                                    ],
                                    globalCoord: false // 缺省为 false
                                },
                                shadowColor: 'rgba(249,165,137, 0.5)',
                                shadowBlur: 1,
                                shadowOffsetY: 3
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: '#F6D06F',
                                borderWidth: 2,
                                borderColor: "#F6D06F"
                            }
                        },
                        smooth: true
                    }
                ]
            });
        },
    });
})
</script>
<!-- 6、平均营业额top10的商户 tbshmc -->
<script>
    $(function(){
        var avgChart = echarts.init(document.getElementById('avg_div'));
        var shmcs=[];
        var avg_nums=[];
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/getAvgcost.action",
            data:{},
            cache:false,
            async: false,
            dataType:"json",
            success : function (result) {
                for(var i in result){
                    shmcs.push(result[i].shmc);
                    avg_nums.push(result[i].avg_cost);
                };
                var myColor = ['#eb2100', '#eb3600', '#d0570e', '#d0a00e', '#34da62', '#00e9db', '#00c0e9', '#0096f3', '#33CCFF', '#33FFCC'];
                avgChart.setOption({ //加载数据图表
                	tooltip: {},
                	toolbox: {
                        show: true,
                        feature: {
                            dataView: {readOnly: false},
                            restore: {},
                            saveAsImage: {}
                        }
                    },
                	grid: {
                        left: '8%',
                        top: '5%',
                        right: '17%',
                        bottom: '8%',
                        containLabel: true
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
                                color: '#ffffff',
                                fontSize: '12',
                            }
                        },
                        data: shmcs
                    }, {
                        axisTick: 'none',
                        axisLine: 'none',
                        axisLabel: {
                            textStyle: {
                                color: '#ffffff',
                                fontSize: '12',
                            }
                        },
                        data: []
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
                            data: avg_nums,
                            label: {
                                normal: {
                                    show: true,
                                    position: 'right',
                                    textStyle: {
                                        color: '#ffffff',
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
                            data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
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
<script>
	$(function() {
		
		/********** 浏览器窗口改变时，重置报表大小 ****************/
		window.onresize = function() {
			season_div.resize();
			kind_div.resize();
			money_div.resize();
			place_div.resize();
			canteen_div.resize();
			type_div.resize();
			shop_div.resize();
			avg_div.resize();
		}
	});
</script>
</body>
</html>