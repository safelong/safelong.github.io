---
layout: post
title: 高德地图API试用
thread: 20
categories: web
tags: eb
keywords: 高德地图,api, web开发
description: 高德地图API试用
---

<!DOCTYPE HTML>  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">  
<title>新城科技园外卖查询系统</title>  
<link rel="stylesheet" type="text/css" href="http://api.amap.com/Public/css/demo.Default.css" />  
<style type="text/css">
    body{padding:10px;}
    #iCenter{width:100%;height:400px;border:1px solid #F6F6F6;margin:10px 0 0;}
    h1,p{line-height:1.5em;}
    span{float:right;}
</style>
<script language="javascript" src="http://webapi.amap.com/maps?v=1.2&key=74e41b6abe2a69da0fbd57b65f8a1233"></script>  
</head>  
<body onLoad="mapInit()">  
    <h1>新城科技园外卖查询系统</h1>
    <p>查询自己的云数据</p>
    <strong>
    <form id="selecttype">
        <input type="radio" name="type" value="中餐" onclick="getType('Chinese')"/> 中餐
        <input type="radio" name="type" value="西餐" onclick="getType('Western')"/> 西餐
        <input type="radio" name="type" value="小吃" onclick="getType('小吃')"/> 小吃
    </form>
    </strong>
    <p><input type="button" value="餐厅查询" onclick="placeSearch()"/><br />
    <div id="iCenter"></div>  
</body>  
<script language="javascript">  
var mapObj;  
var keywords;
var cloudDataLayer
var marker = new Array();
var windowsArr = new Array();
/* 
 *初始化地图对象，加载地图 
 */  
function mapInit(){  
    mapObj = new AMap.Map("iCenter",{center:new AMap.LngLat(118.73929024,31.99482865),level:12});      
    addCloudLayer();  
    
    // 工具栏显示
    mapObj.plugin(["AMap.ToolBar"],function(){		
		toolBar = new AMap.ToolBar();
		mapObj.addControl(toolBar);		
	});
	toolBar.show();

}  
/* 
 *叠加云数据图层 
 */  
function addCloudLayer() {  
    //加载云图层插件  
    mapObj.plugin('AMap.CloudDataLayer', function () {  
        var layerOptions = {   
            query:{keywords: ''},   
            clickable:true  
        };  
        cloudDataLayer = new AMap.CloudDataLayer('5461bd85e4b0921a69fbb046', layerOptions); //实例化云图层类  
        cloudDataLayer.setMap(mapObj); //叠加云图层到地图  
          
        AMap.event.addListener(cloudDataLayer, 'click', function (result) {  
            var clouddata = result.data;  
            var infoWindow = new AMap.InfoWindow({  
                content:"<h3><font face=\"微软雅黑\"color=\"#3366FF\">"+ clouddata._name +"</font></h3><hr />地址："+ clouddata._address + "<br />" + "电话号码：" + clouddata.phonenumber+ "<br />" + "邮编：" + clouddata.postalcode+"<br /><strong>" + "经营类别：" +clouddata.type+  "</strong><br />" + "所在省份：" +clouddata.provinces ,  
                size:new AMap.Size(300, 0),  
                autoMove:true,  
                offset:new AMap.Pixel(0,-5)  
            });  
              
            infoWindow.open(mapObj, clouddata._location);  
        });  
    });  
}  

function getType(type){
    var op={
        /*map:mapObj,*/
        query:{keywords:type}
    }
    cloudDataLayer.setOptions(op)
}

//地点查询函数    
function placeSearch(){ 
    var MSearch;
    mapObj.plugin(["AMap.PlaceSearch"], function() {       
        MSearch = new AMap.PlaceSearch(); //构造地点查询类
        AMap.event.addListener(MSearch, "complete", placeSearch_CallBack); //查询成功时的回调函数
        AMap.event.addListener(MSearch, "error", function(error){  //打印错误信息
            console.log("error:", error);
        });
        MSearch.searchInBounds("餐饮", mapObj.getBounds()); //范围查询
    }); 
}

//添加marker和infowindow  
function addmarker(i,d){
    var lngX = d.location.getLng();
    var latY = d.location.getLat();
    var markerOption = {
        map:mapObj,
        icon:"http://webapi.amap.com/images/"+(i+1)+".png",
        position:new AMap.LngLat(lngX, latY),
        topWhenClick:true,
        topWhenMouseOver:true  
    };           
    var mar = new AMap.Marker(markerOption); 
    marker.push(new AMap.LngLat(lngX, latY));
 
    var infoWindow = new AMap.InfoWindow({
        content:"<h3><font color=\"#00a6ac\">  "+(i+1) + "."+ d.name +"</h3></font>"+TipContents(d.type,d.address,d.tel),
        size:new AMap.Size(300,0),
        autoMove:true ,
        offset:new AMap.Pixel(0,-20)
    }); 
    windowsArr.push(infoWindow);   
    var aa = function(e){infoWindow.open(mapObj,mar.getPosition());}; 
    AMap.event.addListener(mar,"click",aa); 
}

//回调函数
function placeSearch_CallBack(data){ 
    var resultStr="";
    var resultArr = data.poiList.pois;
    var resultCount = data.poiList.pois.length; 
    for (var i = 0; i < resultCount; i++) { 
        resultStr += "<div id='divid"+(i+1)+"' onmouseover='openMarkerTipById1("+i+",this)' onmouseout='onmouseout_MarkerStyle("+(i+1)+",this)' style=\"font-size: 12px;cursor:pointer;padding:2px 0 4px 2px; border-bottom:1px solid #C1FFC1;\"><table><tr><td><img src=\"http://webapi.amap.com/images/"+(i+1)+".png\"></td>"+"<td><h3><font color=\"#00a6ac\">名称: "+resultArr[i].name+"</font></h3>";
        resultStr += TipContents(resultArr[i].type, resultArr[i].address, resultArr[i].tel)+"</td></tr></table></div>";
        addmarker(i, resultArr[i]);
    }
    document.getElementById("result").innerHTML = resultStr;
}   
function TipContents(type,address,tel){  
    if (type == "" || type == "undefined" || type == null || type == " undefined" || typeof type == "undefined") { 
        type = "暂无"; 
    } 
    if (address == "" || address == "undefined" || address == null || address == " undefined" || typeof address == "undefined") { 
        address = "暂无"; 
    } 
    if (tel == "" || tel == "undefined" || tel == null || tel == " undefined" || typeof address == "tel") { 
        tel = "暂无"; 
    } 
    var str ="  地址：" + address + "<br />  电话：" + tel + " <br />  类型："+type; 
    return str; 
} 
</script>  
</html>