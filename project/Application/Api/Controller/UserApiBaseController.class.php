<?php
namespace Api\Controller;
use Think\Controller\RestController;
require_once 'Authorize.php';

class UserApiBaseController extends RestController
{
   protected $userid ;
	
	protected function _initialize()
	{
// 		$authorizer = new  Authorize();
// 		$id = $authorizer->Filter('user');
// 		if(intval($id)>0)
// 		{
// 			$userid = $id;
// 		}
// 		else
// 		{
// 			$message["msg"] = "Unauthorized";
// 			$this->response($message,'json','401');
// 		}
	}
	
}