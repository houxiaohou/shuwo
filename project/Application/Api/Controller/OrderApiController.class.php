<?php

namespace Api\Controller;

use Think\Controller\RestController;

require_once 'OrderConst.php';
require_once 'BDConst.php';
require_once 'ProductConst.php';
require_once 'OrderProductConst.php';
require_once 'ShippingaddressConst.php';
require_once 'Authorize.php';
require_once 'Weixin.php';
class OrderApiController extends RestController {
	/*
	 * 查询所有的订单
	 */
	public function getallorder() {
		$authorize = new Authorize ();
		$isAdmin = $authorize->Filter ( "admin" );
		if ($isAdmin) {
		$order = M ( "orders" );
		$product = M ( "product" );
		$orderproduct = M ( "orderproduct" );
		$start = I ( 'get.start' );
		$count = I ( 'get.count' );
		
		$orderdata = $order->order ( '-createdtime' )->limit ( $start, $count )->select ();
		$this->orderdetail($orderdata, $orderproduct, $count, $product);
		}else{
		    $message ["msg"] = "Unauthorized";
		    $this->response ( $message, 'json', '401' );
		}
	}
	
	/*
	 * 根据GET传的id查询对应的订单
	 */
	public function getorderbyid() {
		$order = M ( 'orders' );
		$product = M ( 'product' );
		$orderproduct = M ( 'orderproduct' );
		
		$id = I ( 'get.id', 0 );
		$where [OrderConst::ORDERID] = $id;
		$orderdata = $order->where ( $where )->find ();
		
		$authorize = new Authorize ();
		$isAdmin = $authorize->Filter ( "admin" );
		if (! $isAdmin) {
			$shopId = $authorize->Filter ( "shop" );
			if ($shopId != $orderdata [OrderConst::SHOPID]) {
				$userId = $authorize->Filter ( "user" );
				if ($userId != $orderdata [OrderConst::USERID]) {
					$message ["msg"] = "Unauthorized";
					$this->response ( $message, 'json', '401' );
				}
			}
		}
		
		if ($id) {
			if ($orderdata != null) {
				$data [OrderConst::ORDERID] = $orderdata [OrderConst::ORDERID];
				$data [OrderConst::CREATEDTIME] = $orderdata [OrderConst::CREATEDTIME];
				$data [OrderConst::ORDERSTATUS] = $orderdata [OrderConst::ORDERSTATUS];
				$data [OrderConst::USERNAME] = $orderdata [OrderConst::USERNAME];
				$data [OrderConst::ADDRESS] = $orderdata [OrderConst::ADDRESS];
				$data [OrderConst::PHONE] = $orderdata [OrderConst::PHONE];
				$data [OrderConst::NOTES] = $orderdata [OrderConst::NOTES];
				$data [OrderConst::SHOPID] = $orderdata [OrderConst::SHOPID];
				$data [OrderConst::DLTIME] = $orderdata [OrderConst::DLTIME];
				$data [OrderConst::ISFIRST] = $orderdata [OrderConst::ISFIRST];
				
				if ($orderdata [OrderConst::RTOTALPRICE] > 0) {
					$data ['price'] = $orderdata [OrderConst::RTOTALPRICE];
				} else {
					$data ['price'] = $orderdata [OrderConst::TOTALPRICE];
				}
				$where_order_product [OrderProductConst::ORDERID] = $orderdata [OrderConst::ORDERID];
				$orderproductdata = $orderproduct->where ( $where_order_product )->field ( 'id,productid,quantity,realweight,realprice' )->select ();
				$count_order_product = count ( $orderproductdata );
				for($j = 0; $j < $count_order_product; $j ++) {
					$data_order_product [$j] ['orderproductid'] = $orderproductdata [$j] [OrderProductConst::ID];
					$data_order_product [$j] ['quantity'] = $orderproductdata [$j] [OrderProductConst::QUANTITY];
					$data_order_product [$j] ['realprice'] = $orderproductdata [$j] [OrderProductConst::REALPRICE];
					$data_order_product [$j] ['realweight'] = $orderproductdata [$j] [OrderProductConst::REALWEIGHT];
					$where_product [ProductConst::PRODUCTID] = $orderproductdata [$j] [OrderProductConst::PRODUCTID];
					$productdata = $product->where ( $where_product )->field ( 'productname,unit,attribute,unitweight' )->find ();
					$data_order_product [$j] ['productname'] = $productdata ['productname'];
					$data_order_product [$j] ['unit'] = $productdata ['unit'];
					$data_order_product [$j] ['attribute'] = $productdata ['attribute'];
					$data_order_product [$j] ['unitweight'] = $productdata ['unitweight'];
				}
				$data ['productdetail'] = $data_order_product;
			} else {
				$data = [ ];
			}
		} else {
			$data = [ ];
		}
		$this->response ( $data, 'json' );
	}
	
	/*
	 * 根据GET传的shopid查询对应店铺的的订单
	 */
	// public function getorderbyshopid(){
	// $order = M('order');
	// $id = intval(I('get.id',0));
	// if ($id){
	// $where[OrderConst::SHOPID] =$id;
	// $data = $order->where($where)->select();
	// if (!count($data)){
	// $data = [];
	// }
	// } else {
	// $data = [];
	// }
	// $this->response($data,"json");
	// }
	
	/*
	 * 获取当前用户的订单
	 */
	public function getordersbyuser() {
		$authorize = new Authorize ();
		$userid = 2;
		if ($userid) {
			$status = I ( 'get.status', - 1 );
			$start = I ( 'get.start' );
			$count = I ( 'get.count' );
			$order = M ( 'orders' );
			$orderproduct = M ( 'orderproduct' );
			$product = M ( 'product' );
			
			$where [OrderConst::USERID] = $userid;
			if (intval ( $start ) > - 1) {
				switch (intval ( $status )) {
					case 0 :
					case 1 :
					case 2 :
						$where [OrderConst::ORDERSTATUS] = $status;
						break;
					default :
						break;
				}
			}
			
			$orderdata = $order->where ( $where )->order ( '-createdtime' )->limit ( $start, $count )->select ();
			$data = [ ];
			if ($orderdata && count ( $orderdata ) > 0) {
               $this->orderdetail($orderdata, $orderproduct, $count, $product);
		} else {
			$message ["msg"] = "Unauthorized";
			$this->response ( $message, 'json', '401' );
		  }
		}
	}
	/*
	 * 获取当前店铺的订单
	 */
	public function getordersbyshop() {
		$authorize = new Authorize ();
		$auid = $authorize->Filter ( 'admin,shop' );
		if ($auid) {
			if (intval ( $auid )) {
				$shopid = $auid;
			} else {
				$shopid = I ( 'get.shopid' );
			}
			$status = I ( 'get.status', - 1 );
			$start = I ( 'get.start' );
			$count = I ( 'get.count' );
			$order = M ( 'orders' );
			$orderproduct = M ( 'orderproduct' );
			$product = M ( 'product' );
			
			$where_order [OrderConst::SHOPID] = $shopid;
			if (intval ( $status ) > - 1) {
				switch (intval ( $status )) {
					case 0 :
					case 1 :
					case 2 :
						$where_order [OrderConst::ORDERSTATUS] = $status;
						break;
					default :
						break;
				}
			}
			$orderdata = $order->where ( $where_order )->order ( '-createdtime' )->limit ( $start, $count )->select ();
			$this->orderdetail($orderdata, $orderproduct, $count, $product);
		} else {
			$message ["msg"] = "Unauthorized";
			$this->response ( $message, 'json', '401' );
		}
	}
	
	/*
	 * 删除订单
	 */
	public function deleteorder() {
		$id = intval ( I ( 'get.id', 0 ) );
		if ($id) {
			$order = M ( "orders" );
			$where [OrderConst::ORDERID] = $id;
			$order->where ( $where )->delete ();
		}
	}
	
	/*
	 * 创建新订单
	 */
	public function createorder() {
		$order = M ( 'orders' );
		// 生成16位唯一订单号
		$orderid = date ( 'Ymd' ) . substr ( implode ( NULL, array_map ( 'ord', str_split ( substr ( uniqid (), 7, 13 ), 1 ) ) ), 0, 8 );
		$data [OrderConst::ORDERID] = $orderid;
		// 新生成的订单状态默认为0，为1时下单成功，为2时订单取消
		$data [OrderConst::ORDERSTATUS] = 0;
		$authorize = new Authorize ();
		// $data[OrderConst::USERID] = I('post.userid');
		$userid = $authorize->Filter ( "user" );
		$data [OrderConst::USERID] = $userid;
		if ($userid) {
			$orders = M ( 'orders' );
			if ($orders->where ( "userid = {$userid}" )->find ()) {
				$data [OrderConst::ISFIRST] = 0;
			} else {
				$data [OrderConst::ISFIRST] = 1;
			}
		}
		$data [OrderConst::SHOPID] = I ( 'post.shopid' );
		// 订单的支付状态默认为0待支付，为1时支付成功，为2时支付失败
		$data [OrderConst::PAYSTATUS] = 0;
		$where1 [ShippingaddressConst::SAID] = I ( 'post.said' );
		// 根据获得的said访问shippingaddress表得到相应的address和phone
		$shippingaddress = M ( 'shippingaddress' );
		$shippingaddressdata = $shippingaddress->where ( $where1 )->find ();
		// $data[OrderConst::ADDRESS] = I('post.address');
		$data [OrderConst::ADDRESS] = $shippingaddressdata [ShippingaddressConst::ADDRESS];
		// $data[OrderConst::PHONE] = I('post.phone');
		$data [OrderConst::PHONE] = $shippingaddressdata [ShippingaddressConst::MOBILE];
		$data [OrderConst::USERNAME] = $shippingaddressdata [ShippingaddressConst::USERNAME];
		$data [OrderConst::CREATEDTIME] = date ( "Y-m-d H:i:s", time () );
		$data [OrderConst::DLTIME] = I ( 'post.dltime' );
		$data [OrderConst::NOTES] = I ( 'post.notes' );
		
		$product = M ( 'product' );
		$orderproduct = M ( 'orderproduct' );
		$totalprice = 0;
		
		$orderdetail_json = $_POST ['orderdetail'];
		$orderdetail = json_decode ( $orderdetail_json, true );
		
		$count = count ( $orderdetail );
		for($i = 0; $i < $count; $i ++) {
			$productid = $orderdetail [$i] ['productid'];
			$quantity = $orderdetail [$i] ['quantity'];
			
			$data1 [OrderProductConst::ORDERID] = $orderid;
			$data1 [OrderProductConst::PRODUCTID] = $productid;
			$data1 [OrderProductConst::QUANTITY] = $quantity;
			
			// 根据产品id从product表中获得对应产品的数据，存储在一个关系数组中
			$where [ProductConst::PRODUCTID] = $productid;
			$productdata = $product->where ( $where )->find ();
			$price = $productdata [ProductConst::PRICE];
			$discount = $productdata [ProductConst::DISCOUNT];
			$attribute = $productdata [ProductConst::ATTRIBUTE];
			$unitweight = $productdata [ProductConst::UNITWEIGHT];
			if ($discount) {
				$price = $discount;
			}
			switch ($attribute) {
				// attribute为1， 按数量销售，按重量计价
				case 1 :
					$productprice = $quantity * $unitweight / 500 * $price;
					break;
				// attribute为2， 按重量销售，按重量计价
				case 2 :
					$productprice = $quantity * 250 / 500 * $price;
					break;
				// attribute为3， 按数量销售，按数量计价
				case 3 :
					$productprice = $quantity * $price;
					break;
			}
			$totalprice += $productprice;
			// 将每个产品的价格(含预估)写入orderproduct表中的realprice字段
			$data1 [OrderProductConst::REALPRICE] = $productprice;
			$orderproduct->add ( $data1 );
		}
		$data [OrderConst::TOTALPRICE] = $totalprice;
		$order->add ( $data );
		$data2 ['orderid'] = $orderid;
		
		// 构造模板消息
		
		$shopid = intval ( $data [OrderConst::SHOPID] );
		if ($shopid) {
			$user = M ( "user" );
			$userinfo = $user->where ( 'shopid=' . $shopid )->find ();
			$current = date ( 'y年m月d日 H:i' );
			$contact = $data [OrderConst::USERNAME] . " 电话" . $data [OrderConst::PHONE];
			$address = "发货地址: " . $data [OrderConst::ADDRESS] . "   配送时间: " . $data [OrderConst::DLTIME];
			$orderNum = "订单编号：" . $orderid;
			if (count ( $userinfo ) && ! empty ( $userinfo ["openid"] )) {
				$template = array (
						'touser' => $userinfo ["openid"],
						'template_id' => C ( 'NEWORDER_TEMPID' ),
						'url' => "http://www.shuwow.com/Home/Index/shop",
						'topcolor' => "#009900",
						'data' => array (
								'first' => array (
										'value' => urlencode ( $orderNum ),
										'color' => "#FF0000" 
								),
								'tradeDateTime' => array (
										'value' => urlencode ( $current ),
										'color' => "#009900" 
								),
								'orderType' => array (
										'value' => urlencode ( "新的订单" ),
										'color' => "#009900" 
								),
								'customerInfo' => array (
										'value' => urlencode ( $contact ),
										'color' => "#009900" 
								),
								'orderItemName' => array (
										'value' => urlencode ( "发货地址&配送时间" ) 
								),
								'orderItemData' => array (
										'value' => urlencode ( $address ),
										'color' => "#009900" 
								),
								'remark' => array (
										'value' => urlencode ( "\\n信息来自树窝小店" ),
										'color' => "#cccccc" 
								) 
						) 
				);
				$weixin = new Weixin ();
				$token = $weixin->getshopGlobalAccessToken ();
				$weixin->sendtemplatemsg ( urldecode ( json_encode ( $template ) ), $token );
				
				
				//通知BD
				$shop = M('shop');
				$shopname = $shop->where("shopid=".$shopid)->getField("spn");
				$bdshop = M ( 'bdshop' );
				$bdshops = $bdshop->where ( "shopid=" . $shopid )->select ();
				if (count ( $bdshops )) {
					$bd = M ( 'bd' );
					for($i = 0; $i < count ( $bdshops ); $i ++) {
						$bddata = $bd->where ( "bdid=" . $bdshops [$i] [BDConst::BDID] )->find ();
						if (count ( $bddata ) && ! empty ( $bddata [BDConst::OPENID] )) {
							$msgstr = $shopname."收到新的订单";
							$bdtemplate = array (
									'touser' => $bddata [BDConst::OPENID],
									'template_id' => C ( 'NEWORDER_TEMPID' ),
									'topcolor' => "#009900",
									'data' => array (
											'first' => array (
													'value' => urlencode ( $orderNum ),
													'color' => "#FF0000" 
											),
											'tradeDateTime' => array (
													'value' => urlencode ( $current ),
													'color' => "#009900" 
											),
											'orderType' => array (
													'value' => urlencode ( $msgstr ),
													'color' => "#FF0000" 
											),
											'customerInfo' => array (
													'value' => urlencode ( $contact ),
													'color' => "#009900" 
											),
											'orderItemName' => array (
													'value' => urlencode ( "发货地址&配送时间" ) 
											),
											'orderItemData' => array (
													'value' => urlencode ( $address ),
													'color' => "#009900" 
											),
											'remark' => array (
													'value' => urlencode ( "\\n信息来自树窝小店" ),
													'color' => "#cccccc" 
											) 
									) 
							);
							$token = $weixin->getshopGlobalAccessToken ();
							$weixin->sendtemplatemsg ( urldecode ( json_encode ( $bdtemplate ) ), $token );
						}
					}
				}
			}
		}
		
		$this->response ( $data2, 'json' );
	}
	
	/*
	 * 水果称重
	 */
	public function getWeight() {
		$weixin = new Weixin ();
		$orderproduct = M ( 'orderproduct' );
		$product = M ( 'product' );
		$rtotalprice = 0; // 真实总价
		
		$weightdetail_json = $_POST ['weightdetail'];
		$weightdetail = json_decode ( $weightdetail_json, true );
		$count = count ( $weightdetail );
		
		for($i = 0; $i < $count; $i ++) {
			$orderproductid = $weightdetail [$i] ['orderproductid'];
			$weight = $weightdetail [$i] ['weight'];
			
			// 获取每个orderproductid对应的产品的realprice(含估计)
			$where [OrderProductConst::ID] = $orderproductid;
			$realprice = $orderproduct->where ( $where )->getField ( OrderProductConst::REALPRICE );
			
			// 如果重量不为0，插入到orderproduct表的realweight字段中
			if ($weight) {
				$data [OrderProductConst::REALWEIGHT] = $weight;
				// 根据orderproductid从orderproduct表中获得对应的productid 和orderid
				$where2 [OrderProductConst::ID] = $orderproductid;
				$orderproductdata = $orderproduct->where ( $where2 )->find ();
				$productid = $orderproductdata [OrderProductConst::PRODUCTID];
				$orderid = $orderproductdata [OrderProductConst::ORDERID];
				
				// 根据productid从product表中获得对应产品的数据，存储在一个关系数组中
				$where3 [ProductConst::PRODUCTID] = $productid;
				$productdata = $product->where ( $where3 )->find ();
				$price = $productdata [ProductConst::PRICE];
				$discount = $productdata [ProductConst::DISCOUNT];
				
				if ($discount) {
					$price = $discount;
				}
				if ($productdata [ProductConst::ATTRIBUTE] == 1 || $productdata [ProductConst::ATTRIBUTE] == 2) {
					$realprice = $weight * $price / 500;
				} else {
					$realprice = $weight * $price;
				}
				$data [OrderProductConst::REALPRICE] = $realprice;
				
				$orderproduct->where ( $where )->save ( $data );
				
				// 计算真实总价
				$rtotalprice += $realprice;
			}
		}
		// 将真实总价写入对应的order表中的rtotalprice字段中
		$order = M ( 'orders' );
		$where4 [OrderConst::ORDERID] = $orderid;
		$order->where ( $where4 )->setField ( 'rtotalprice', $rtotalprice );
		// 将订单状态由0变成1(订单确认)
		if ($order->where ( $where4 )->setField ( 'orderstatus', 1 )) {
			$userid = $order->where ( $where4 )->getField ( "userid" );
			if (intval ( $userid )) {
				$user = M ( "user" );
				$userinfo = $user->where ( 'userid=' . $userid )->find ();
				if (count ( $userinfo ) && ! empty ( $userinfo ['openid'] )) {
					$current = date ( 'y年m月d日H:i' );
					$msg = "您所购买的水果,商家已于" . $current . "称重";
					$realtotal = $order->where ( $where4 )->getField ( 'rtotalprice' );
					$totalprice = "实际价格:" . $realtotal . "元";
					if (count ( $userinfo ) && ! empty ( $userinfo ["openid"] )) {
						$template = array (
								'touser' => trim ( $userinfo ["openid"] ),
								'template_id' => C ( 'ORDERSTATUS_TEMPID' ),
								'url' => "http://www.shuwow.com/Home/Index/index/#/order",
								'topcolor' => "#009900",
								'data' => array (
										'first' => array (
												'value' => urlencode ( $msg ),
												'color' => "#FF0000" 
										),
										'OrderSn' => array (
												'value' => urlencode ( $orderid ),
												'color' => "#009900" 
										),
										'OrderStatus' => array (
												'value' => urlencode ( $totalprice ),
												'color' => "#009900" 
										),
										'remark' => array (
												'value' => urlencode ( "\\n信息来自树窝小店" ),
												'color' => "#cccccc" 
										) 
								) 
						);
						$token = $weixin->getusersGlobalAccessToken ();
						$weixin->sendtemplatemsg ( urldecode ( json_encode ( $template ) ), $token );
					}
				}
			}
			
			// 通知BD
			$shopid = $order->where ( $where4 )->getField ( "shopid" );
			if ($shopid) {
				$shop = M ( "shop" );
				$shopname = $shop->where ( "shopid=" . $shopid )->getField ( "spn" );
				$bdshop = M ( "bdshop" );
				$bdshops = $bdshop->where ( "shopid=" . $shopid )->select ();
				if (count ( $bdshops )) {
					$bd = M ( 'bd' );
					for($i = 0; $i < count ( $bdshops ); $i ++) {
						$bddata = $bd->where ( "bdid=" . $bdshops [$i] [BDConst::BDID] )->find ();
						if (count ( $bddata ) && ! empty ( $bddata [BDConst::OPENID] )) {
							$current = date ( 'y年m月d日H:i' );
							$msg = $shopname."已于" . $current . "确认订单";
							$realtotal = $order->where ( $where4 )->getField ( 'rtotalprice' );
							$totalprice = "实际价格:" . $realtotal . "元";
							$bdtemplate = array (
									'touser' => trim ( $bddata [BDConst::OPENID]),
									'template_id' => C ( 'BDORDERSTATUS_TEMPID' ),
									'topcolor' => "#0000CD",
									'data' => array (
											'first' => array (
													'value' => urlencode ( $msg ),
													'color' => "#FF0000" 
											),
											'OrderSn' => array (
													'value' => urlencode ( $orderid ),
													'color' => "#009900" 
											),
											'OrderStatus' => array (
													'value' => urlencode ( $totalprice ),
													'color' => "#009900" 
											),
											'remark' => array (
													'value' => urlencode ( "\\n信息来自树窝小店" ),
													'color' => "#cccccc" 
											) 
									) 
							);
							$token = $weixin->getshopGlobalAccessToken ();
							$weixin->sendtemplatemsg ( urldecode ( json_encode ( $bdtemplate ) ), $token );
						}
					}
				}
			}
		}
	}
	/*
	 * 撤销订单
	 */
	public function cancelorder() {
		$order = M ( 'orders' );
		$id = I ( 'post.id', 0 );
		$ordernotes = I ( 'post.ordernotes', '' );
		$authorize = new Authorize ();
		$auid = $authorize->Filter ( "admin,shop" );
		if (! $auid) {
			$message ["msg"] = "Unauthorized";
			$this->response ( $message, 'json', '401' );
		} else {
			if (intval ( $auid )) {
				if ($auid != $order->where ( "orderid=" . $id )->getField ( "shopid" )) {
					$message ["msg"] = "Unauthorized";
					$this->response ( $message, 'json', '401' );
				}
			}
		}
		
		if ($id) {
			if ($order->where ( "orderid=" . $id )->setField ( "orderstatus", 2 ) && $order->where ( "orderid=" . $id )->setField ( "ordernotes", $ordernotes )) {
				$userid = $order->where ( "orderid=" . $id )->getField ( "userid" );
				if (intval ( $userid )) {
					$user = M ( "user" );
					$phone = '暂无';
					$shopname = '';
					if (intval ( $auid )) {
						$shop = M ( 'shop' );
						$shopid = $auid;
						$shop = $shop->where ( "shopid=" . $shopid )->find ();
						$shopname = $shop ['spn'];
						$phone = $shop ['phone'];
					}
					$userinfo = $user->where ( 'userid=' . $userid )->find ();
					
					if (count ( $userinfo ) && ! empty ( $userinfo ['openid'] )) {
						$current = date ( 'y年m月d日H:i' );
						$msg = $shopname . "已于" . $current . "取消订单";
						$errormsg = "订单取消原因:" . $ordernotes . " 商家电话:" . $phone;
						if (count ( $userinfo ) && ! empty ( $userinfo ["openid"] )) {
							$template = array (
									'touser' => trim ( $userinfo ["openid"] ),
									'template_id' => C ( 'ORDERSTATUS_TEMPID' ),
									'url' => "http://www.shuwow.com/Home/Index/index/#/order",
									'topcolor' => "#009900",
									'data' => array (
											'first' => array (
													'value' => urlencode ( $msg ),
													'color' => "#FF0000" 
											),
											'OrderSn' => array (
													'value' => urlencode ( $id ),
													'color' => "#009900" 
											),
											'OrderStatus' => array (
													'value' => urlencode ( $errormsg ),
													'color' => "#009900" 
											),
											'remark' => array (
													'value' => urlencode ( "\\n信息来自树窝小店" ),
													'color' => "#cccccc" 
											) 
									) 
							);
							$weixin = new Weixin ();
							$token = $weixin->getusersGlobalAccessToken ();
							$weixin->sendtemplatemsg ( urldecode ( json_encode ( $template ) ), $token );
						}
					}
				}
			}
			
			// 通知BD
			$shopid = $order->where ( "orderid=" . $id )->getField ( "shopid" );
			if ($shopid) {
				$shop = M ( "shop" );
				$shopname = $shop->where ( "shopid=" . $shopid )->getField ( "spn" );
				$bdshop = M ( "bdshop" );
				$bdshops = $bdshop->where ( "shopid=" . $shopid )->select ();
				if (count ( $bdshops )) {
					$bd = M ( 'bd' );
					for($i = 0; $i < count ( $bdshops ); $i ++) {
						$bddata = $bd->where ( "bdid=" . $bdshops [$i] [BDConst::BDID] )->find ();
						if (count ( $bddata ) && ! empty ( $bddata [BDConst::OPENID] )) {
							$current = date ( 'y年m月d日H:i' );
							$msg = $shopname."已于" . $current . "取消订单";
							$errormsg = "订单取消原因:" . $ordernotes . " 商家电话:" . $phone;
							$bdtemplate = array (
									'touser' => trim ( $bddata [BDConst::OPENID]),
									'template_id' => C ( 'BDORDERSTATUS_TEMPID' ),
									'topcolor' => "#FF0000",
									'data' => array (
											'first' => array (
													'value' => urlencode ( $msg ),
													'color' => "#FF0000"
											),
											'OrderSn' => array (
													'value' => urlencode ( $id ),
													'color' => "#009900"
											),
											'OrderStatus' => array (
													'value' => urlencode ( $errormsg ),
													'color' => "#009900"
											),
											'remark' => array (
													'value' => urlencode ( "\\n信息来自树窝小店" ),
													'color' => "#cccccc"
											)
									)
							);
							$token = $weixin->getshopGlobalAccessToken ();
							$weixin->sendtemplatemsg ( urldecode ( json_encode ( $bdtemplate ) ), $token );
						}
					}
				}
			}
			
		} else {
			$data = [ ];
			$this->response ( $data, 'json' );
		}
	}
	private function orderdetail( $orderdata, $orderproduct,$count,$product){
	    for($i = 0; $i < $count; $i ++) {
	        $data_order_product = [ ];
	        if ($orderdata [$i] [OrderConst::ORDERID] == null) {
	            break;
	        } else {
	            $data [$i] [OrderConst::ORDERID] = $orderdata [$i] [OrderConst::ORDERID];
	            $data [$i] [OrderConst::CREATEDTIME] = $orderdata [$i] [OrderConst::CREATEDTIME];
	            $data [$i] [OrderConst::ORDERSTATUS] = $orderdata [$i] [OrderConst::ORDERSTATUS];
	            $data [$i] [OrderConst::USERNAME] = $orderdata [$i] [OrderConst::USERNAME];
	            $data [$i] [OrderConst::ADDRESS] = $orderdata [$i] [OrderConst::ADDRESS];
	            $data [$i] [OrderConst::PHONE] = $orderdata [$i] [OrderConst::PHONE];
	            $data [$i] [OrderConst::NOTES] = $orderdata [$i] [OrderConst::NOTES];
	            $data [$i] [OrderConst::SHOPID] = $orderdata [$i] [OrderConst::SHOPID];
	            $data [$i] [OrderConst::DLTIME] = $orderdata [$i] [OrderConst::DLTIME];
	            $data [$i] [OrderConst::ISFIRST] = $orderdata [$i] [OrderConst::ISFIRST];
	
	            if ($orderdata [$i] [OrderConst::RTOTALPRICE] > 0) {
	                $data [$i] ['price'] = $orderdata [$i] [OrderConst::RTOTALPRICE];
	            } else {
	                $data [$i] ['price'] = $orderdata [$i] [OrderConst::TOTALPRICE];
	            }
	            if ($orderdata [$i] [OrderConst::ORDERNOTES] != null) {
	                $data [$i] [OrderConst::ORDERNOTES] = $orderdata [$i] [OrderConst::ORDERNOTES];
	            }
	            $where_order_product [OrderProductConst::ORDERID] = $orderdata [$i] [OrderConst::ORDERID];
	            $orderproductdata = $orderproduct->where ( $where_order_product )->field ( 'id,productid,quantity,realweight,realprice' )->select ();
	            $count2 = count ( $orderproductdata );
	            for($j = 0; $j < $count2; $j ++) {
	                $data_order_product [$j] ['orderproductid'] = $orderproductdata [$j] [OrderProductConst::ID];
	                $data_order_product [$j] ['quantity'] = $orderproductdata [$j] [OrderProductConst::QUANTITY];
	                $data_order_product [$j] ['realprice'] = $orderproductdata [$j] [OrderProductConst::REALPRICE];
	                $data_order_product [$j] ['realweight'] = $orderproductdata [$j] [OrderProductConst::REALWEIGHT];
	                $where_product [ProductConst::PRODUCTID] = $orderproductdata [$j] [OrderProductConst::PRODUCTID];
	                $productdata = $product->where ( $where_product )->field ( 'productname,unit,attribute,unitweight,price,discount' )->find ();
	                $data_order_product [$j] ['productname'] = $productdata ['productname'];
	                $data_order_product [$j] ['price'] = $productdata ['price'];
	                $data_order_product [$j] ['unit'] = $productdata ['unit'];
	                $data_order_product [$j] ['attribute'] = $productdata ['attribute'];
	                $data_order_product [$j] ['unitweight'] = $productdata ['unitweight'];
	                if(intval($data_order_product [$j] ['discount']))
	                {
	                    $data_order_product [$j] ['discount'] = $productdata ['discount'];
	                }
	                else
	                {
	                    $data_order_product [$j] ['discount'] = $productdata ['price'];
	                }
	            }
	        }
	        $data [$i] ['productdetail'] = $data_order_product;
	    }
	    $this->response ( $data, 'json' );
	}
}