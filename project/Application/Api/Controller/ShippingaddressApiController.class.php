<?php
namespace Api\Controller;
use Think\Controller\RestController;
require_once 'CategoryConst.php';
require_once 'GeoHash.php';
class ShippingaddressApiController extends RestController {
    //返回所有的用户地址
    public function getalladdress(){
        $address=M('shippingaddress');
        $data=$address->select();
        $this->response($data,'json');
    }
}