<?php 
namespace Api\Controller;
use Think\Controller\RestController;
require_once 'ShippingaddressConst.php';
class IsdefaultApiController extends RestController {
    //更新种类
    public function updateisdefault(){ 
    $address=M('shippingaddress');
    $said=intval( I('get.id',0));
    if($said){
        $userid=I('post.userid');
        $data[ShippingaddressConst::SAID]=$said;
        if($userid){
            $data[ShippingaddressConst::USERID]=$userid;
        }
        if(I('post.isdefault') != null ){
            $data[ShippingaddressConst::ISDEFAULT]=I('post.isdefault');
        }
        if($address->save($data)){
            $address->where("userid = {$userid}  and said !=".$said)->setField('isdefault',0);
        }
        $this->response($data,'json');
    }
  }
}