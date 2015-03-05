<?php

namespace Api\Controller;

use Think\Controller\RestController;

require_once 'BDConst.php';
require_once 'Authorize.php';
class BDApiController extends RestController {
	
	// 返回所有bd
	public function getallbds() {
		$authorize = new Authorize ();
		$auid = 1;
		if ($auid) {
			$bd = M ( "bd" );
			$shops = [ ];
			$data = $bd->select ();
			if (! count ( $data )) {
				$data = [ ];
			} else {
				$bdshop = M("bdshop");
				for($i = 0;$i<count ( $data );$i++)
				{
					
				}
			}
			
			$this->response ( $data, "json" );
		} else {
			$message ["msg"] = "Unauthorized";
			$this->response ( $message, 'json', '401' );
		}
	}
}
