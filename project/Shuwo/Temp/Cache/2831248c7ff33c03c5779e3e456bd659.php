<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>店铺管理</title>
</head>
<body>
<form action="<?php echo U('Shop/create/');?>" method="post">
省：<input type="text" name="City"/> 	市:<input type="text" name="Distinct"/>		区:<input type="text" name="Province"/><br/>
<br>
详细地址：<input type="text" name="ShopAddress"><br/>
<br/>
<input type="button" value="计算经纬度"/><br/>
<br/>
经度：<input type="text" name="Longitude"/>	纬度:<input type="text" name="Latitude"/><br/>
<br/>
联系人姓名:<input type="text" name="ContactName"/>    联系人电话:<input type="text" name="ContactPhone"/><br/>
<br/>
店铺名称:<input type="text" name="ShopName"/><br/>
<br/>
<input type="submit" value="添加商铺"/>
<div style="border:1px solid red;weight:900px;height:400px;margin:0px auto;">
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
	<td><a href="<?php echo U('Shop/modify',array('id' => $vo[ShopID]));?>">修改</a> | <a href="<?php echo U('Shop/del/',array('id' => $vo[ShopID]));?>">删除</a> <td>
</tr><?php endforeach; endif; else: echo "" ;endif; ?>
</table>
<table>
</table>  
</form>
</body>
</html>