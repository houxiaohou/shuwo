<?php
namespace Api\Controller;
use Think\Controller\RestController;
require_once 'OrderConst.php';
class OrderApiController extends RestController {
    /*
     * 查询所有的订单
     */
      public function getallorder(){
        $order =M("order");
        $data =$order->select();
        if(!count($data)){
            $data = [];
        }
        $this->response($data,"json");
    }
    /*
     * 根据GET传的id查询对应的订单
     */
    public function getorderbyid(){
        $order = M('order');
		$id = intval(I('get.id',0));
		if ($id){
			$where[OrderConst::ORDERID] =$id;
			$data = $order->where($where)->find();
			if (!count($data)){
				$data = [];
			}
		} else {
			$data = [];
 		}
 		$this->response($data[OrderConst::ORDERID],"json");
     }
     /*
      * 根据GET传的shopid查询对应店铺的的订单
      */
     public function getordershopbyid(){
         $order = M('order');
         $id = intval(I('get.id',0));
         if ($id){
             $where[OrderConst::SHOPID] =$id;
             $data = $order->where($where)->select();
             if (!count($data)){
                 $data = [];
             }
         } else {
             $data = [];
         }
         $this->response($data,"json");
        }
         /*
          * 删除订单
          */
         public function deleteorder(){
             $id  = intval(I('get.id',0));
             if($id)
             {
                 $order =M("order");
                 $where[OrderConst::ORDERID] =$id;
                 $order->where($where)->delete();
             }
         }        
}