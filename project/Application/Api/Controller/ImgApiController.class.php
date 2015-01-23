<?php
namespace Api\Controller;
use Think\Controller\RestController;
require_once("qiniu/rs.php");
class ImgApiController extends RestController
{
	public  function getuptoken()
	{
		$bucket = 'phpsdk';
		$accessKey = 'cPFlOFgcJIsgQVjhEH9AIPwjlQ8YI05aLHFWeHfD';
		$secretKey = 'FOGl8RpKFJUaYkJAJgXWbnsRGgO2JrUk44o4UuFo';
		
// 		\Qiniu_SetKeys($accessKey, $secretKey);
// 		$putPolicy = new \Qiniu_RS_GetPolicy($bucket);
// 		$upToken = $putPolicy->Token(null);
// 		$this->response($upToken,'json');
	}
}