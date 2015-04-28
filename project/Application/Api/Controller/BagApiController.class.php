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
        $userId = $authorize->Filter("user");
        if (!intval($userId)) {
 			$message ["msg"] = "Unauthorized";
 			$this->response($message, 'json', '401');
			return;
 		}

        $currenttime = date('Y-m-d H:i:s');
        $bagDao = M('bag');
        $type = I($get.BagConst::TYPE,0); // 1 - 外送，2 - 自提
        
        $data =  $bagDao->where("type = ".$type." and expires >='".$currenttime."' and user_id =".$userId." and used=0")->order ( 'expires asc' )->select();
        if(!count($data))
        {
        	$data = [];
        }
        $this->response($data, 'json');
        
    }

    /**
     * 列出用户已使用的红包
     */
    public function listUserExpiredBags()
    {
    	
    }

    /**
     * 根据使用情况列出用户红包
     */
    public function listUserBagsByUsedOrNot()
    {

    }

}