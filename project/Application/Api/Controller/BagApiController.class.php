<?php

namespace Api\Controller;

use Think\Controller\RestController;

require_once 'BagConst.php';
require_once 'Authorize.php';
class BagApiController extends RestController {
	/**
	 * 根据条件列出用户所有可用红包
	 */
	public function listUserAvailableBags() {
		$get = "get.";
		$authorize = new Authorize ();
		$userId = $authorize->Filter ( "user" );
		if (! intval ( $userId )) {
			$message ["msg"] = "Unauthorized";
			$this->response ( $message, 'json', '401' );
			return;
		}
		
		$currenttime = date ( 'Y-m-d' );
		$bagDao = M ( 'bag' );
		$type = I ( $get . BagConst::TYPE, 0 ); // 1 - 外送，2 - 自提
		
		$data = $bagDao->where ( "(type = " . $type . " and date(expires) >='" . $currenttime . "' and date(start)<='" . $currenttime . "' and user_id =" . $userId . " and used=0) or (used=0 and isever =1)" )->order ( 'expires desc' )->select ();
		if (! count ( $data )) {
			$data = [ ];
		}
		$this->response ( $data, 'json' );
	}
	
	/**
	 * 列出用户过期的红包
	 */
	public function listUserExpiredBags() {
		$get = "get.";
		$authorize = new Authorize ();
		$userId = $authorize->Filter ( "user" );
		if (! intval ( $userId )) {
			$message ["msg"] = "Unauthorized";
			$this->response ( $message, 'json', '401' );
			return;
		}
		$currenttime = date ( 'Y-m-d' );
		$bagDao = M ( 'bag' );
		$data = $bagDao->where ( "date(expires) <'" . $currenttime . "' and user_id =" . $userId . " and isever !=1" )->order ( 'expires desc' )->select ();
		if (! count ( $data )) {
			$data = [ ];
		}
		$this->response ( $data, 'json' );
	}
	
	/**
	 * 根据使用情况列出用户使用过的红包
	 */
	public function listUserUsedBags() {
		$get = "get.";
		$authorize = new Authorize ();
		$userId = $authorize->Filter ( "user" );
		if (! intval ( $userId )) {
			$message ["msg"] = "Unauthorized";
			$this->response ( $message, 'json', '401' );
			return;
		}
		$bagDao = M ( 'bag' );
		$data = $bagDao->where ( "used = 1 and user_id =" . $userId )->order ( 'expires desc' )->select ();
		if (! count ( $data )) {
			$data = [ ];
		}
		$this->response ( $data, 'json' );
	}
	
	public function sendbagtouser() {
		$post = "post.";
		$authorize = new Authorize ();
		$auid = $authorize->Filter ( "admin" );
		if (true) {
			$bag = M ( "bag" );
			$userid = I ( "post.userids" );
			$userids = explode ( ".", $userid );
			for($i = 0; $i < count ( $userids ); $i ++) {
				$current = date ( 'Y-m-d' );
				$expirdate = date ( 'Y-m-d', strtotime ( '+6 days' ) );
				$expirdate = $expirdate . " 23:59:59";
				$bagitem [BagConst::START] = $current;
				$bagitem [BagConst::SHOP_ID] = 0;
				$bagitem [BagConst::TYPE] = 1;
				$bagitem [BagConst::EXPIRES] = $expirdate;
				$bagitem [BagConst::USED] = 0;
				$bagitem [BagConst::AMOUNT] = 5;
				$bagitem [BagConst::USER_ID] = $userids[$i];
				$bagitem [BagConst::ISEVER] = 0;
				$bagitem [BagConst::ISOUT] = 0;
				if ($bag->add ( $bagitem ) === false) {
					$this->response("error",json);
				}
			}
			  $this->response("success",json);
		} else {
			$message ["msg"] = "Unauthorized";
			$this->response ( $message, 'json', '401' );
			return;
		}
	}
}