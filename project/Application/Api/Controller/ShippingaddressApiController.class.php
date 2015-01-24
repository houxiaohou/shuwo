<?php
namespace Api\Controller;
use Think\Controller\RestController;
require_once 'ShippingaddressConst.php';
class ShippingaddressApiController extends RestController {
    //返回所有的用户地址
    public function getalladdress(){
        $address=M('shippingaddress');
        $data=$address->select();
        if(!count($data))
        {
            $data = [];
        }
        $this->response($data, "json");
    }
    //根据id查询对应的用户地址
    public function getaddressbyid(){
        $address=M('shippingaddress');
        $said  =intval( I('get.id',0));
        if(!count($said))
        {
            $data = [];         
        }
        $sql = ShippingaddressConst::SAID.'="'.$said.'"';
        $data = $address->where($sql)->find();
        if(!count($data)){
            $data = [];
        }
        $this->response($data,"json");
    }
    //更新用户地址
    public function updateaddress(){
        $address=M('shippingaddress');
        $said=intval( I('get.id',0));
        if($said){
        $userid=I('post.userid');
        $data[ShippingaddressConst::SAID]=$said;
         if($userid){
             $data[ShippingaddressConst::USERID]=$userid;
         }
        if(I('post.username') != null){
            $data[ShippingaddressConst::USERNAME]=I('post.username');
        }
        if(I('post.province') != null ){
            $data[ShippingaddressConst::PROVINCE]=I('post.province');
        }
        if(I('post.city') != null ){
            $data[ShippingaddressConst::CITY]=I('post.city');
        }
        if(I('post.distint') != null ){
            $data[ShippingaddressConst::DISTRICT]=I('post.district');
            
        }
        if(I('post.address') != null ){
            $data[ShippingaddressConst::ADDRESS]=I('post.address');
        }
        if(I('post.mobile') != null ){
            $data[ShippingaddressConst::MOBILE]=I('post.mobile');
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
    //添加用户地址
    public function addaddress(){
        $address=M('shippingaddress');
        $userid=I('post.userid');
        if($userid){
            $data[ShippingaddressConst::USERID]=$userid;
        }
        if(I('post.username') != null){
            $data[ShippingaddressConst::USERNAME]=I('post.username');
        }
        if(I('post.province') != null ){
            $data[ShippingaddressConst::PROVINCE]=I('post.province');
        }
        if(I('post.city') != null ){
            $data[ShippingaddressConst::CITY]=I('post.city');
        }
        if(I('post.distint') != null ){
            $data[ShippingaddressConst::DISTRICT]=I('post.district');
        }
        if(I('post.address') != null ){
            $data[ShippingaddressConst::ADDRESS]=I('post.address');
        }
        if(I('post.mobile') != null ){
            $data[ShippingaddressConst::MOBILE]=I('post.mobile');
        }
        if(I('post.isdefault') != null ){
            $data[ShippingaddressConst::ISDEFAULT]=I('post.isdefault');
        }
        $said=$address->add($data);
        if($said){
            $address->where("userid = {$userid}  and said !=".$said)->setField('isdefault',0);
        }
        $this->response($data,'json');
    }
    //删除用户地址
    public function deleteaddress(){
        $address=M('shippingaddress');
        $said=intval( I('get.id',0));
        if($said){
        $address->where('said  ='.$said)->delete();
        }
    }
    //局部更新
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
