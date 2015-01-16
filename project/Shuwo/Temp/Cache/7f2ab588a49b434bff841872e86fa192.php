<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Select2实现全国省市区三级联动下拉菜单 - 素材家园</title>
<script src="js/jquery.js"></script>
<script type="text/javascript" src="js/area.js"></script>
<script type="text/javascript" src="js/location.js"></script>
<script src="js/select2.js"></script>
<script src="js/select2_locale_zh-CN.js"></script>
<link href="css/common.css" rel="stylesheet"/>
<link href="css/select2.css" rel="stylesheet"/>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.5&ak=lNKQpXsBLNjd9N4zxpiok9yz"></script>

</head>
<body>
<form action="<?php echo U('Admin/create/');?>" method="post">
<div class="main">
<center>

  <select id="loc_province" style="width:120px;">
  </select>
  <select id="loc_city" style="width:120px; margin-left: 10px">
  </select>
  <select id="loc_town" style="width:120px;margin-left: 10px">
  </select>
  <br>
  <br>
  <br>
  <br>
</center>
  id:<input type="text" name="ShopID"/>
  <br/>
  <br/>
详细地址：<input type="text" id="ShopAddress" name="ShopAddress"><br/>
<br/>
<input type="button" value="计算经纬度" onclick="searchByStationName();" /><br/>
<br/>
经度：<input type="text" id="Longitude" name="Longitude"/>	纬度:<input type="text" id="Latitude" name="Latitude"/><br/>
<br/>
联系人姓名:<input type="text" name="ContactName"/>    联系人电话:<input type="text" name="ContactPhone"/><br/>
<br/>
店铺名称:<input type="text" name="ShopName"/><br/>
<br/>
<input type="submit" value="添加商铺"/>
<div id="container" style="border:1px solid red;weight:900px;height:400px;margin:0px auto;overflow:hidden;">
百度地图
</div>
<table border="1">
<tr>
	<td>店铺名称</td>
	<td>联系人名称</td>
	<td>联系人手机号</td>
	<td>详细地址</td>
	<td>经度</td>
	<td>纬度</td>
	<td>省</td>
	<td>市</td>
	<td>区</td>
	<td>操作</td>
</tr>
<?php if(is_array($arr)): $i = 0; $__LIST__ = $arr;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
	<td><?php echo ($vo["ShopName"]); ?></td>
	<td><?php echo ($vo["ContactName"]); ?></td>
	<td><?php echo ($vo["ContactPhone"]); ?></td>
	<td><?php echo ($vo["ShopAddress"]); ?></td>
	<td><?php echo ($vo["Longitude"]); ?></td>
	<td><?php echo ($vo["Latitude"]); ?></td>
	<td><?php echo ($vo["City"]); ?></td>
	<td><?php echo ($vo["Distinct"]); ?></td>
	<td><?php echo ($vo["Province"]); ?></td>
	<td><a href="<?php echo U('Admin/shopedit',array('id' => $vo[ShopID]));?>">修改</a> | <a href="<?php echo U('Admin/del/',array('id' => $vo[ShopID]));?>">删除</a> <td>
</tr><?php endforeach; endif; else: echo "" ;endif; ?>
</table>
<table>
</table>  
</form>
<script type="text/javascript">
    //创建一个地图
	var map = new BMap.Map('container');
    //设置地图显示中心及放大倍数
    map.centerAndZoom('上海市嘉定区',12);
    //启用滚轮放大缩小，默认禁止
    map.enableScrollWheelZoom();
    //启用地图惯性拖拽，默认禁止
    map.enableContinuousZoom();
    //添加默认缩放平移控件
    map.addControl(new BMap.NavigationControl());
    //添加默认缩略地图控件，右下角打开
    map.addControl(new BMap.OverviewMapControl({isOpen:true,anchor:BMAP_ANCHOR_BOTTOM_RIGHT}));

    //新建一个查询
    var localSearch = new BMap.LocalSearch(map);
    //允许自动调节窗体大小
    localSearch.enableAutoViewport();

    function searchByStationName(){
    	map.clearOverlays();//清空原先的标注
    	var province = document.getElementById("Province").value;
    	var city = document.getElementById("Province").value;
    	var distinct = document.getElementById("Distinct").value;
    	var shopAddress = document.getElementById("ShopAddress").value;
    	var keyword = province + city + distinct + shopAddress;
    	localSearch.setSearchCompleteCallback( function(searchResult){
    		var poi = searchResult.getPoi(0);
    		document.getElementById("Longitude").value = poi.point.lng;
    		document.getElementById("Latitude").value = poi.point.lat;
    		map.centerAndZoom(poi.point,13);

    		//创建标注，为要查询地址的经纬度
    		var marker = new BMap.Marker(new BMap.Point(poi.point.lng,poi.point.lat));
    		map.addOverlay(marker);
    		var content = shopAddress + "<br/><br/>经度：" + poi.point.lng + "<br/>纬度：" + poi.point.lat;
    		var infoWindow = new BMap.InfoWindow("<p style='font-size:14px;'>" + content + '</p>');
    		marker.addEventListener('click',function(){
    			this.openInfoWindow(infoWindow);
    		});
    		marker.setAnimation(BMAP_ANIMATION_BOUNCE);
    	});
    	localSearch.search(keyword);
    }
</script>
</div>
</form>

</body>
</html>