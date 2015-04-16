<?php

namespace Api\Controller;

use Think\Controller\RestController;
use Think\Model;

require_once 'OrderConst.php';
require_once 'Authorize.php';
class SearchApiController  extends RestController {
    /*
     * 模糊查询
     */
    public function allorder(){
        $authorize = new Authorize ();
        $auid = $authorize->Filter ( 'admin','shop');
        if($auid){
            $orders = M('orders');
            $orderid = I('post.orderid');
            $phone = I('post.phone');
            if(!empty($orderid)){
                $where[OrderConst::ORDERID] = array('like',"%{$orderid}%");
            }
            if(!empty($phone)){
                $where[OrderConst::PHONE] = array('like',"%{$phone}%");
            }
            $data = $orders->where($where)->select();
            $this->response ( $data, 'json' );
                }else{
            $message ["msg"] = "Unauthorized";
            $this->response ( $message, 'json', '401' );
        }
    }
}