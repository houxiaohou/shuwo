<?php
namespace Api\Controller;

use Think\Controller\RestController;

require_once 'OrderConst.php';
require_once 'Weixin.php';
require_once 'BDConst.php';
class WeixinqueueApiController extends RestController {

	public  function  sendorderinfotouser()
	{
        $poststr = 'post.';
        $address = I($poststr.OrderConst::ADDRESS);
// 		$phone = I($poststr.OrderConst::PHONE);
// 		$username = I($poststr.OrderConst::USERNAME);

        
        $template = array (
        									'touser' => 'oR-0TuJI-tC6c33qgzf2ifIrudB8',
        									'template_id' => C ( 'NEWORDER_TEMPID' ),
        									'topcolor' => "#009900",
        									'data' => array (
        													'first' => array (
        																	'value' => urlencode ( $address),
        																	'color' => "#FF0000"
        															),
        													'tradeDateTime' => array (
        																	'value' => urlencode ( "test" ),
        																	'color' => "#009900"
        															),
        													'orderType' => array (
        																	'value' => urlencode ("test"),
        																	'color' => "#009900"
        															),
        													'customerInfo' => array (
        																	'value' => urlencode ( "test" ),
        																	'color' => "#009900"
        															),
        													'orderItemName' => array (
        																	'value' => urlencode ( "发货地址&配送时间" )
        															),
        													'orderItemData' => array (
        																	'value' => urlencode ( "test" ),
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
	}
	
	public function sendorderinfotobd()
	{
		$current = date ( 'y年m月d日 H:i' );
		$shop = M("shop");
		$order = M("orders");
		$poststr = 'post.';
		$shopid =  I($poststr.OrderConst::SHOPID);
		$orderid = I($poststr.OrderConst::ORDERID);
		$orderNum = "订单编号：".$orderid;
		$data = $order->where("orderid ='".$orderid."'")->find();
		$contact = $data [OrderConst::USERNAME] . " 电话" . $data [OrderConst::PHONE];
		$address = "发货地址: " . $data [OrderConst::ADDRESS] . "   配送时间: " . $data [OrderConst::DLTIME];
		$shopname = $shop->where ( "shopid=" . $shopid )->getField ( "spn" );
		$bdshop = M ( 'bdshop' );
		$bdshops = $bdshop->where ( "shopid=" . $shopid )->select ();
		if (count ( $bdshops )) {
			$bd = M ( 'bd' );
			for($i = 0; $i < count ( $bdshops ); $i ++) {
				$bddata = $bd->where ( "bdid=" . $bdshops [$i] [BDConst::BDID] )->find ();
				if (count ( $bddata ) && ! empty ( $bddata [BDConst::OPENID] )) {
					$msgstr = $shopname . "收到新的订单";
					if ($data [OrderConst::ISFIRST] == 0 && $data [OrderConst::DISCOUNT] > 0) {
						$msgstr = $msgstr . '--优惠订单减免' . $data [OrderConst::DISCOUNT] . '元';
					} else if ($data [OrderConst::ISFIRST] == 1) {
						$msgstr = $msgstr . '--首购订单减免' . $data [OrderConst::DISCOUNT] . '元';
					}
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
					$weixin = new Weixin ();
					$token = $weixin->getshopGlobalAccessToken ();
					$weixin->sendtemplatemsg ( urldecode ( json_encode ( $bdtemplate ) ), $token );
				}
			}
		}
	}
        
	
	//$url = U("WeixinqueueApi/sendorderinfotouser/",'','',true);
	//$params = ["address"=>"123"];
	//$this->curl_request_async($url,$params);
        
		
// 	private  function curl_request_async($url, $params, $type='POST')
// 	{
// 		foreach ($params as $key => &$val) {
// 			if (is_array($val)) $val = implode(',', $val);
// 			$post_params[] = $key.'='.urlencode($val);
// 		}
// 		$post_string = implode('&', $post_params);
	
// 		$parts=parse_url($url);
	
// 		$fp = fsockopen($parts['host'],
// 				isset($parts['port'])?$parts['port']:80,
// 				$errno, $errstr, 30);
	
// 		// Data goes in the path for a GET request
// 		if('GET' == $type) $parts['path'] .= '?'.$post_string;
	
// 		$out = "$type ".$parts['path']." HTTP/1.1\r\n";
// 		$out.= "Host: ".$parts['host']."\r\n";
// 		$out.= "Content-Type: application/x-www-form-urlencoded\r\n";
// 		$out.= "Content-Length: ".strlen($post_string)."\r\n";
// 		$out.= "Connection: Close\r\n\r\n";
// 		// Data goes in the request body for a POST request
// 		if ('POST' == $type && isset($post_string)) $out.= $post_string;
	
// 		fwrite($fp, $out);
// 		fclose($fp);
// 	}
	
	
	
// 		if (! empty ( $address ) && ! empty ( $phone ) && ! empty ($username )) {
				
// 			$order->add ( $data );
// 			$data2 ['orderid'] = $orderid;
				
// 			//构造模板消息	
// 			$shopid = intval ( $data [OrderConst::SHOPID] );
// 			if ($shopid) {
// 				$user = M ( "user" );
		
// 				$userinfo = $user->where ( 'shopid=' . $shopid )->select ();
		
// 				$current = date ( 'y年m月d日 H:i' );
// 				$contact = $data [OrderConst::USERNAME] . " 电话" . $data [OrderConst::PHONE];
// 				$address = "发货地址: " . $data [OrderConst::ADDRESS] . "   配送时间: " . $data [OrderConst::DLTIME];
// 				$orderNum = "订单编号：" . $orderid;
		
// 				$ordertype="新的订单";
// 				if ($data [OrderConst::ISFIRST] == 0 && $data [OrderConst::DISCOUNT] >0) {
// 					$ordertype = "优惠订单减免".$data[OrderConst::DISCOUNT]."元";
// 				}else if($data [OrderConst::ISFIRST] == 1 ){
// 					$ordertype= "首购订单减免".$data [OrderConst::DISCOUNT]."元";
// 				}
// 				// if (count ( $userinfo ) && ! empty ( $userinfo ["openid"] )) {
// 				if (count ( $userinfo )) {
// 					for($i = 0; $i < count ( $userinfo ); $i ++) {
// 						if (! empty ( $userinfo [$i] ["openid"] )) {
// 							$template = array (
// 									'touser' => $userinfo [$i] ["openid"],
// 									'template_id' => C ( 'NEWORDER_TEMPID' ),
// 									'url' => "http://www.shuwow.com/Home/Index/shop",
// 									'topcolor' => "#009900",
// 									'data' => array (
// 											'first' => array (
// 													'value' => urlencode ( $orderNum ),
// 													'color' => "#FF0000"
// 											),
// 											'tradeDateTime' => array (
// 													'value' => urlencode ( $current ),
// 													'color' => "#009900"
// 											),
// 											'orderType' => array (
// 													'value' => urlencode ($ordertype),
// 													'color' => "#009900"
// 											),
// 											'customerInfo' => array (
// 													'value' => urlencode ( $contact ),
// 													'color' => "#009900"
// 											),
// 											'orderItemName' => array (
// 													'value' => urlencode ( "发货地址&配送时间" )
// 											),
// 											'orderItemData' => array (
// 													'value' => urlencode ( $address ),
// 													'color' => "#009900"
// 											),
// 											'remark' => array (
// 													'value' => urlencode ( "\\n信息来自树窝小店" ),
// 													'color' => "#cccccc"
// 											)
// 									)
// 							);
// 							$weixin = new Weixin ();
// 							$token = $weixin->getshopGlobalAccessToken ();
// 							$weixin->sendtemplatemsg ( urldecode ( json_encode ( $template ) ), $token );
// 						}
// 					}
// 				}
// 			}
		//}
	
	
	//$url = U("WeixinqueueApi/sendorderinfotouser/",'','',true);
	//$params = ["address"=>"123"];
	//$this->curl_request_async($url,$params);
}