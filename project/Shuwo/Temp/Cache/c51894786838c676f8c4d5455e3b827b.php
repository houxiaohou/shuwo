<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<?php echo U('Shop/update/');?>" method="post">
<input type="hidden" name="id" value="<?php echo ($data["ShopID"]); ?>"/>
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
<input type="submit" value="修改信息"/>
</form>
</body>
</html>