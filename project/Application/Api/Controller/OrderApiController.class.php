<?php
namespace Api\Controller;
use Think\Controller\RestController;
require_once 'OrderConst.php';
require_once 'ProductConst.php';
require_once 'OrderProductConst.php';
require_once 'ShippingaddressConst.php';
require_once 'Authorize.php';
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
    	$product = M('product');
    	$orderproduct = M('orderproduct');
    	
    	$id = I('get.id',0);
    	$where[OrderConst::ORDERID] = $id;
    	$orderdata = $order->where($where)->find();
    	
    	$authorize = new Authorize();
    	$isAdmin = $authorize->Filter("admin");
    	if (!$isAdmin) {
    		$shopId = $authorize->Filter("shop");
    		if ($shopId != $orderdata[OrderConst::SHOPID]) {
    			$userId = $authorize->Filter("user");
    			if ($userId != $orderdata[OrderConst::USERID]) {
    				$message ["msg"] = "Unauthorized";
    				$this->response ( $message, 'json', '401' );
    	
    			}
    		}
    	}
    	 
		
		if ($id){
					if ($orderdata != null){
						$data[OrderConst::ORDERID] = $orderdata[OrderConst::ORDERID];
						$data[OrderConst::CREATEDTIME] = $orderdata[OrderConst::CREATEDTIME];
						$data[OrderConst::ORDERSTATUS] = $orderdata[OrderConst::ORDERSTATUS];
						$data[OrderConst::USERNAME] = $orderdata[OrderConst::USERNAME];
						$data[OrderConst::ADDRESS] = $orderdata[OrderConst::ADDRESS];
						$data[OrderConst::PHONE] = $orderdata[OrderConst::PHONE];
						$data[OrderConst::NOTES] = $orderdata[OrderConst::NOTES];
							
						if ($orderdata[OrderConst::RTOTALPRICE] > 0){
							$data['price'] = $orderdata[OrderConst::RTOTALPRICE];
						}else {
							$data['price'] = $orderdata[OrderConst::TOTALPRICE];
						}
						$where_order_product[OrderProductConst::ORDERID] = $orderdata[OrderConst::ORDERID];
						$orderproductdata = $orderproduct->where($where_order_product)->field('id,productid,quantity,realweight,realprice')->select();
						$count_order_product = count($orderproductdata);
						for ($j=0;$j<$count_order_product;$j++) {
							$data_order_product[$j]['orderproductid'] = $orderproductdata[$j][OrderProductConst::ID];
							$data_order_product[$j]['quantity'] = $orderproductdata[$j][OrderProductConst::QUANTITY];
							$data_order_product[$j]['realprice'] = $orderproductdata[$j][OrderProductConst::REALPRICE];
							$data_order_product[$j]['realweight'] = $orderproductdata[$j][OrderProductConst::REALWEIGHT];
							$where_product[ProductConst::PRODUCTID] = $orderproductdata[$j][OrderProductConst::PRODUCTID];
							$productdata =  $product->where($where_product)->field('productname,unit,attribute,unitweight')->find();
							$data_order_product[$j]['productname'] = $productdata['productname'];
							$data_order_product[$j]['unit'] = $productdata['unit'];
							$data_order_product[$j]['attribute'] = $productdata['attribute'];
							$data_order_product[$j]['unitweight'] = $productdata['unitweight'];	
						}
						$data['productdetail'] = $data_order_product;
					}else{
						$data = [];
					}
		}else{
			$data = [];
		}
		$this->response($data,'json');
    }
			
     /*
      * 根据GET传的shopid查询对应店铺的的订单
      */
//      public function getorderbyshopid(){
//          $order = M('order');
//          $id = intval(I('get.id',0));
//          if ($id){
//              $where[OrderConst::SHOPID] =$id;
//              $data = $order->where($where)->select();
//              if (!count($data)){
//                  $data = [];
//              }
//          } else {
//              $data = [];
//          }
//          $this->response($data,"json");
//         }
        
        /*
         * 获取当前用户的订单
         */
     public   function getordersbyuser(){
        	$authorize = new Authorize();
        	$userid = $authorize->Filter('user');
        	if ($userid){
        		$start = I('get.start');
        		$count = I('get.count');
        		$status = I('get.status');
        		$order = M('order');
        		$orderproduct = M('orderproduct');
        		$product = M('product');
        		 
        		$where[OrderConst::USERID] = $userid;
        		switch (intval($status)) {
        			case 0:
        			case 1:
        			case 2:
        				$where[OrderConst::ORDERSTATUS] = $status;
        				break;
        			default:
        				break;
        		}
        		
        		$orderdata = $order->where($where)->order('createdtime')->limit($start,$count)->select();
        		for ($i=0;$i<$count;$i++) {
        			if ($orderdata[$i][OrderConst::ORDERID] == null){
        				break;
        			}
        			else {
        				$data[$i][OrderConst::ORDERID] = $orderdata[$i][OrderConst::ORDERID];
        				$data[$i][OrderConst::CREATEDTIME] = $orderdata[$i][OrderConst::CREATEDTIME];
        				$data[$i][OrderConst::ORDERSTATUS] = $orderdata[$i][OrderConst::ORDERSTATUS];
        				$data[$i][OrderConst::USERNAME] = $orderdata[$i][OrderConst::USERNAME];
        				$data[$i][OrderConst::ADDRESS] = $orderdata[$i][OrderConst::ADDRESS];
        				$data[$i][OrderConst::PHONE] = $orderdata[$i][OrderConst::PHONE];
        				$data[$i][OrderConst::NOTES] = $orderdata[$i][OrderConst::NOTES];
        		
        				if ($orderdata[$i][OrderConst::RTOTALPRICE] > 0){
        					$data[$i]['price'] = $orderdata[$i][OrderConst::RTOTALPRICE];
        				}else {
        					$data[$i]['price'] = $orderdata[$i][OrderConst::TOTALPRICE];
        				}
        				$where_order_product[OrderProductConst::ORDERID] = $orderdata[$i][OrderConst::ORDERID];
        				$orderproductdata = $orderproduct->where($where_order_product)->field('id,productid,quantity,realweight,realprice')->select();
        				$count_order_product = count($orderproductdata);
        				for ($j=0;$j<$count_order_product;$j++) {
							$data_order_product[$j]['orderproductid'] = $orderproductdata[$j][OrderProductConst::ID];
        					$data_order_product[$j]['quantity'] = $orderproductdata[$j][OrderProductConst::QUANTITY];
        					$data_order_product[$j]['realprice'] = $orderproductdata[$j][OrderProductConst::REALPRICE];
        					$data_order_product[$j]['realweight'] = $orderproductdata[$j][OrderProductConst::REALWEIGHT];
        					$where_product[ProductConst::PRODUCTID] = $orderproductdata[$j][OrderProductConst::PRODUCTID];
        					$productdata =  $product->where($where_product)->field('productname,unit,attribute,unitweight')->find();
        					$data_order_product[$j]['productname'] = $productdata['productname'];
        					$data_order_product[$j]['unit'] = $productdata['unit'];
        					$data_order_product[$j]['attribute'] = $productdata['attribute'];
        					$data_order_product[$j]['unitweight'] = $productdata['unitweight'];
        					 
        				}
        			}
        			$data[$i]['productdetail'] = $data_order_product;
        		}
        		$this->response($data,'json');
        	}else{
        		$message ["msg"] = "Unauthorized";
        		$this->response ( $message, 'json', '401' );
        	}
        }
        /*
         * 获取当前店铺的订单
         */
        public function getordersbyshop() {
        	$authorize = new Authorize();
        	$auid = $authorize->Filter('admin,shop');
        	if($auid){
        	if (intval($auid)){
        		$shopid = $auid;
        	}else{
        		$shopid = I('get.shopid');
        	}
        	$status = I('get.status');
        	$start = I('get.start');
        	$count = I('get.count');
        	$order = M('order');
        	$orderproduct = M('orderproduct');
        	$product = M('product');
        	
        	$where_order[OrderConst::SHOPID] = $shopid;
        	switch (intval($status)) {
        		case 0:
        		case 1:
        		case 2:
        			$where_order[OrderConst::ORDERSTATUS] = $status;
        			break;
        		default:
        			break;
        	}
        	$orderdata = $order->where($where_order)->order('createdtime')->limit($start,$count)->select();
        	
        	for ($i=0;$i<$count;$i++) {
        		if ($orderdata[$i][OrderConst::ORDERID] == null){
        			break;
        		}
        		else {
        			$data[$i][OrderConst::ORDERID] = $orderdata[$i][OrderConst::ORDERID];
        			$data[$i][OrderConst::CREATEDTIME] = $orderdata[$i][OrderConst::CREATEDTIME];
        			$data[$i][OrderConst::ORDERSTATUS] = $orderdata[$i][OrderConst::ORDERSTATUS];
        			$data[$i][OrderConst::USERNAME] = $orderdata[$i][OrderConst::USERNAME];
        			$data[$i][OrderConst::ADDRESS] = $orderdata[$i][OrderConst::ADDRESS];
        			$data[$i][OrderConst::PHONE] = $orderdata[$i][OrderConst::PHONE];
        			$data[$i][OrderConst::NOTES] = $orderdata[$i][OrderConst::NOTES];
        			 
        			if ($orderdata[$i][OrderConst::RTOTALPRICE] > 0){
        				$data[$i]['price'] = $orderdata[$i][OrderConst::RTOTALPRICE];
        			}else {
        				$data[$i]['price'] = $orderdata[$i][OrderConst::TOTALPRICE];
        			}
        			$where_order_product[OrderProductConst::ORDERID] = $orderdata[$i][OrderConst::ORDERID];
        			$orderproductdata = $orderproduct->where($where_order_product)->field('id,productid,quantity,realweight,realprice')->select();
        			$count2 = count($orderproductdata);
        			for ($j=0;$j<$count2;$j++) {
        				$data_order_product[$j]['orderproductid'] = $orderproductdata[$j][OrderProductConst::ID];
        				$data_order_product[$j]['quantity'] = $orderproductdata[$j][OrderProductConst::QUANTITY];
        				$data_order_product[$j]['realprice'] = $orderproductdata[$j][OrderProductConst::REALPRICE];
        				$data_order_product[$j]['realweight'] = $orderproductdata[$j][OrderProductConst::REALWEIGHT];
        				$where_product[ProductConst::PRODUCTID] = $orderproductdata[$j][OrderProductConst::PRODUCTID];
        				$productdata =  $product->where($where_product)->field('productname,unit,attribute,unitweight')->find();
        				$data_order_product[$j]['productname'] = $productdata['productname'];
        				$data_order_product[$j]['unit'] = $productdata['unit'];
        				$data_order_product[$j]['attribute'] = $productdata['attribute'];
        				$data_order_product[$j]['unitweight'] = $productdata['unitweight'];
        				 
        			}
        		}
        		$data[$i]['productdetail'] = $data_order_product;
        	}
        	$this->response($data,'json');
        	}else{
        	    $message ["msg"] = "Unauthorized";
        	    $this->response ( $message, 'json', '401' );
        	}
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
         	$authorize = new Authorize();
//          	$data[OrderConst::USERID] = I('post.userid');
         	$data[OrderConst::USERID] = $authorize->Filter('user');
         	
         	$data[OrderConst::SHOPID] = I('post.shopid');
         	//订单的支付状态默认为0待支付，为1时支付成功，为2时支付失败
         	$data[OrderConst::PAYSTATUS] = 0;
         	$where1[ShippingaddressConst::SAID] = I('post.said');
         	//根据获得的said访问shippingaddress表得到相应的address和phone
         	$shippingaddress = M('shippingaddress');
         	$shippingaddressdata = $shippingaddress->where($where1)->find();
//          	$data[OrderConst::ADDRESS] = I('post.address');
         	$data[OrderConst::ADDRESS] = $shippingaddressdata[ShippingaddressConst::ADDRESS];
//          	$data[OrderConst::PHONE] = I('post.phone');
         	$data[OrderConst::PHONE] = $shippingaddressdata[ShippingaddressConst::MOBILE];
         	$data[OrderConst::CREATEDTIME] = date("Y-m-d H:i:s", time());
         	$data[OrderConst::DLTIME] = I('post.dltime');
         	$data[OrderConst::NOTES] = I('post.notes');
         	
        
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
         				$productprice = $quantity*$unitweight/500*$price;
         				break;
         			//attribute为2， 按重量销售，按重量计价
         			case 2:
         				$productprice = $quantity*250/500*$price;
         				break;
         			//attribute为3， 按数量销售，按数量计价
         			case 3:
         				$productprice = $quantity*$price;
         				break;
         		}
         		$totalprice += $productprice;
         		//将每个产品的价格(含预估)写入orderproduct表中的realprice字段
         		$data1[OrderProductConst::REALPRICE] = $productprice;
         		$orderproduct->add($data1);	
         	}
         	$data[OrderConst::TOTALPRICE] = $totalprice;
         	$order->add($data);
         	$data2['orderid'] = $orderid;
         	$this->response($data2,'json');

    	
         }
         
         /*
          * 水果称重
          */
         public  function getWeight(){
         	$orderproduct = M('orderproduct');
         	$product = M('product');
         	$rtotalprice = 0;//真实总价
         	
         	$weightdetail_json = $_POST['weightdetail'];
         	$weightdetail = json_decode($weightdetail_json,true);
         	$count = count($weightdetail);
         	
         	for ($i=0;$i<$count;$i++){
         		$orderproductid = $weightdetail[$i]['orderproductid'];
         		$weight = $weightdetail[$i]['weight'];
         		
         		
         		//获取每个orderproductid对应的产品的realprice(含估计)
         		$where[OrderProductConst::ID] = $orderproductid;
         		$realprice = $orderproduct->where($where)->getField(OrderProductConst::REALPRICE);
         		
         		//如果重量不为0，插入到orderproduct表的realweight字段中
         		if ($weight) {
         			$data[OrderProductConst::REALWEIGHT] = $weight;
         			//根据orderproductid从orderproduct表中获得对应的productid 和orderid
         			$where2[OrderProductConst::ID] = $orderproductid;
         			$orderproductdata = $orderproduct->where($where2)->find();
         			$productid = $orderproductdata[OrderProductConst::PRODUCTID];
         			$orderid = $orderproductdata[OrderProductConst::ORDERID];
         			 
         			//根据productid从product表中获得对应产品的数据，存储在一个关系数组中
         			$where3[ProductConst::PRODUCTID] = $productid;
         			$productdata = $product->where($where3)->find();
         			$price = $productdata[ProductConst::PRICE];
         			$discount = $productdata[ProductConst::DISCOUNT];
         			
         			if ($discount) {
         				$price = $discount;
         			}
					if ($productdata[ProductConst::ATTRIBUTE] == 1 || $productdata[ProductConst::ATTRIBUTE] == 2) {
						$realprice = $weight*$price/500;
					} else {
						$realprice = $weight*$price;
					}
         			$data[OrderProductConst::REALPRICE] = $realprice;
         			
         			$orderproduct->where($where)->save($data);
         			
         			//计算真实总价
         			$rtotalprice += $realprice;
         		}
         	}
         	//将真实总价写入对应的order表中的rtotalprice字段中
         	$order = M('order');
         	$where4[OrderConst::ORDERID] = $orderid;
         	$order->where($where4)->setField('rtotalprice',$rtotalprice);
         	//将订单状态由0变成1(订单确认)
         	$order->where($where4)->setField('orderstatus',1);
         }
         /*
          * 撤销订单
          */
         public function cancelorder()
         {
         	$authorize = new Authorize();
         	$auid = $authorize->Filter('admin,shop');
         	if($auid){
         		$order = M('order');
         		$id = I('get.id','');
         		if (intval($auid))
         		{
         			if($auid!=$order->where("orderid=".$id)->getField("shopid"))
         			{
         				$message ["msg"] = "Unauthorized";
         				$this->response ( $message, 'json', '401' );
         			}
         		}
         		$order->where("orderid=".$id)->setField("orderstatus",2);
         	}
         	else
         	{
         		$message ["msg"] = "Unauthorized";
         		$this->response ( $message, 'json', '401' );
         	}
         }
         
     
         
         
	
}