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
<form action="<?php echo U('Admin/create/');?>" method="post">
<div class="main">
<input type="hidden" id="Province_1" name="Province_1" value=""/>
<input type="hidden" id="City_1" name="City_1" value=""/>
<input type="hidden" id="Distinct_1" name="Distinct_1" value=""/>
<center>
id:<input type="text" name="ShopID"/>
  <select id="loc_province" name="Province" style="width:120px;">
  </select>
  <select id="loc_city" name="City" style="width:120px; margin-left: 10px">
  </select>
  <select id="loc_town" name="Distinct" style="width:120px;margin-left: 10px">
  </select>
  <br>
  <br>
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
			<input type="submit" value="添加商铺"/>
<div id="container" style="border:1px solid red;weight:900px;height:400px;margin:0px auto;overflow:hidden;">
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
	<script type="text/javascript" src="__JS__/baidumap.js"/>
</div>
</form>
</body>
</html>