<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
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
<form action="<?php echo U('Index/index/');?>" method="post">
<div class="main">
<input type="hidden" id="longitude_hidden" name="longitude_hidden" value=""/>
<input type="hidden" id="latitude_hidden" name="latitude_hidden" value=""/>
  <center>
  <select id="loc_province" name="Province" style="width:120px;">
  </select>
  <select id="loc_city" name="City" style="width:120px; margin-left: 10px">
  </select>
  <select id="loc_town" name="Distinct" style="width:120px;margin-left: 10px">
  </select>
           详细地址：<input type="text" id="ShopAddress" name="ShopAddress"/>
           <input type="submit" style ="width:32px" value="确定" />
           <br></br>
  </center>
  
<div id="container" style="border:1px solid red;weight:900px;height:400px;margin:0px auto;overflow:hidden;">
</div>
	<script type="text/javascript" src="__JS__/baidumap.js"/>
</div>
</form>
</body>
</html>