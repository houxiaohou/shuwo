<?php


namespace Home\Controller;

use Think\Controller;

require_once 'wechatCallback.php';

class WeixinController extends Controller
{
	public  function  Index()
	{
		$wechatObj = new wechatCallback();
		if (!isset($_GET['echostr'])) {
			$wechatObj->responseMsg();
		}else{
			$wechatObj->valid();
		}
	}
}








