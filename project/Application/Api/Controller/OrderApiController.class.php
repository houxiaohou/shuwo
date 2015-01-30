<?php
namespace Api\Controller;
use Think\Controller\RestController;
require_once 'OrderConst.php';
require_once 'ProductConst.php';
require_once 'OrderProductConst.php';
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

         /*
          * 创建新订单
          */
         
         public function createorder(){
         	$order = M('order');
         	//生成16位唯一订单号
         	$orderid = date('Ymd').substr(implode(NULL, 
        		array_map('ord', str_split(substr(uniqid(), 7, 13), 1))), 0, 8);
         	$data[OrderConst::ORDERID] = $orderid;
         	//新生成的订单状态默认为0，为1时下单成功，为2时订单取消
         	$data[OrderConst::ORDERSTATUS] = 0; 
         	$data[OrderConst::USERID] = I('post.userid');
         	$data[OrderConst::SHOPID] = I('post.shopid');
         	//订单的支付状态默认为0待支付，为1时支付成功，为2时支付失败
         	$data[OrderConst::PAYSTATUS] = 0;
         	$data[OrderConst::ADDRESS] = I('post.address');
         	$data[OrderConst::PHONE] = I('post.phone');
         	$data[OrderConst::CREATEDTIME] = date("Y-m-d H:i:s", time());
         	
        
         	$product = M('product');
         	$orderproduct = M('orderproduct');
         	$totalprice = 0;
         	
         	$orderdetail_json = $_POST['orderdetail'];
         	$orderdetail = json_decode($orderdetail_json,true);
         	
         	$count = count($orderdetail);
          	for ($i=0;$i<$count;$i++){
         		$productid = $orderdetail[$i]['productid'];
         		$quantity = $orderdetail[$i]['quantity'];
         		
         		
         		$data1[OrderProductConst::ORDERID] = $orderid;
         		$data1[OrderProductConst::PRODUCTID] = $productid;
         		$data1[OrderProductConst::QUANTITY] =$quantity; 
         		$orderproduct->add($data1);
         		
                //根据产品id从product表中获得对应产品的数据，存储在一个关系数组中
         		$where[ProductConst::PRODUCTID] = $productid;
         		$productdata = $product->where($where)->find();
         		$price = $productdata[ProductConst::PRICE];
         		$discount = $productdata[ProductConst::DISCOUNT];
         		$attribute = $productdata[ProductConst::ATTRIBUTE];
         		$unitweight = $productdata[ProductConst::UNITWEIGHT];
         		if ($discount) {
         			$price = $discount;
         		}
         		switch ($attribute){
         			//attribute为1， 按数量销售，按重量计价
         			case 1:
         				$totalprice += $quantity*$unitweight/500*$price;
         				break;
         			//attribute为2， 按重量销售，按重量计价
         			case 2:
         				$totalprice += $quantity*250/500*$price;
         				break;
         			//attribute为3， 按数量销售，按数量计价
         			case 3:
         				$totalprice += $quantity*$price;
         				break;
         		}
         			
         	}
         	$data[OrderConst::TOTALPRICE] = $totalprice;
         	$order->add($data);
         	
         	$this->response($totalprice,'json');

    	
         }
         
         /*
          * 水果称重
          */
         public  function getWeight(){
         	$orderproduct = M('orderproduct');
         	$weightdetail_json = $_POST['weightdetail'];
         	$weightdetail = json_decode($weightdetail_json,true);
         	$count = count($weightdetail);
         	
         	for ($i=0;$i<$count;$i++){
         		$orderid = $weightdetail[$i]['orderid'];
         		$quantity = $weightdetail[$i]['quantity'];
         		$weight = $weightdetail[$i]['weight'];
         		
         		
         	}
         	
         }
         
     
         
         
	
}