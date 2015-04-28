<?php
namespace Api\Controller;

use Think\Controller\RestController;

require_once 'BagConst.php';
require_once 'Authorize.php';

class BagApiController extends RestController
{
    /**
     * 根据条件列出用户所有可用红包
     */
    public function listUserAvailableBags()
    {
        $get = "get.";
        $authorize = new Authorize ();
        $userId = 2;
          if (!intval($userId)) {
       		$message ["msg"] = "Unauthorized";
 			$this->response($message, 'json', '401');
            return;
 		}

        $currenttime = date('Y-m-d');
        $bagDao = M('bag');
        $type = I($get.BagConst::TYPE,0); // 1 - 外送，2 - 自提
        
        $data =  $bagDao->where("type = ".$type." and date(expires) >='".$currenttime."' and date(start)<='".$currenttime."' and user_id =".$userId." and used=0")->order ( 'expires desc' )->select();
        if(!count($data))
        {
        	$data = [];
        }
        $this->response($data, 'json');
        
    }

    /**
     * 列出用户过期的红包
     */
    public function listUserExpiredBags()
    {
    	$get = "get.";
    	$authorize = new Authorize ();
    	$userId = $authorize->Filter("user");
    	if (!intval($userId)) {
    		$message ["msg"] = "Unauthorized";
    		$this->response($message, 'json', '401');
    		return;
    	}
    	$currenttime = date('Y-m-d');
    	$bagDao = M('bag');
    	$data =  $bagDao->where( "date(expires) <'".$currenttime."' and user_id =".$userId)->order ( 'expires desc' )->select();
    	if(!count($data))
    	{
    		$data = [];
    	}
    	$this->response($data, 'json');
    }

    /**
     * 根据使用情况列出用户使用过的红包
     */
    public function listUserUsedBags()
    {
    	$get = "get.";
    	$authorize = new Authorize ();
    	$userId = $authorize->Filter("user");
    	if (!intval($userId)) {
    		$message ["msg"] = "Unauthorized";
    		$this->response($message, 'json', '401');
    		return;
    	}
    	$bagDao = M('bag');
    	$data =  $bagDao->where( "used = 1 and user_id =".$userId)->order ( 'expires desc' )->select();
    	if(!count($data))
    	{
    		$data = [];
    	}
    	$this->response($data, 'json');
    }

}