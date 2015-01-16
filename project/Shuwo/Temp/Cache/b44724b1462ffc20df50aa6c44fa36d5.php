<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Select2实现全国省市区三级联动下拉菜单 - 素材家园</title>
<script src="__JS__/jquery.js"></script>
<script type="text/javascript" src="__JS__/area.js"></script>
<script type="text/javascript" src="__JS__/location.js"></script>
<script src="__JS__/select2.js"></script>
<script src="__JS__/select2_locale_zh-CN.js"></script>
<link href="__CSS__/common.css" rel="stylesheet"/>
<link href="__CSS__/select2.css" rel="stylesheet"/>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.5&ak=lNKQpXsBLNjd9N4zxpiok9yz"></script>

</head>
<body>
<form action="<?php echo U('Admin/update/');?>" method="post">
<div class="main">
<input type="hidden" name="ShopID" value="<?php echo ($data["ShopID"]); ?>"/>
<input type="hidden" id="Province_1" name="Province_1" value=""/>
<input type="hidden" id="City_1" name="City_1" value=""/>
<input type="hidden" id="Distinct_1" name="Distinct_1" value=""/>
<center>

  <select id="loc_province" name="Province" style="width:120px;">
  </select>
  <select id="loc_city" name="City" style="width:120px; margin-left: 10px">
  </select>
  <select id="loc_town" name="Distinct" style="width:120px;margin-left: 10px">
  </select>
  <br>
  <br>
  </center>
	<br>
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
	<input type="submit" value="修改信息"/>
<div id="container" style="border:1px solid red;weight:900px;height:400px;margin:0px auto;overflow:hidden;">
<script type="text/javascript" src="__JS__/baidumap.js"/>
</div>
</form>
</body>
</html>