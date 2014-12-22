<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<?php if(is_array($data)): $i = 0; $__LIST__ = $data;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><a href="<?php echo U('Product/detail/',array('id'=>$vo['ProductID']));?>"><?php echo ($vo["ProductName"]); ?></a>
    <br/><?php endforeach; endif; else: echo "" ;endif; ?>
 <br>test</br>
</body>
</html>