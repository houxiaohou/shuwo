<?php
namespace Api\Controller;
use Think\Controller\RestController;
class ShopApiController extends RestController {

public function shops() {
		$shop =M("shop");
		$data = $shop->select();
		$this->response($data,"json");
}

public function shop() {
	$data["id"]  = $_GET["id"];
	$this->response($data,"json");
}

public  function getproducts()
{
	$data["id"]  = $_GET["id"];
	$this->response($data,"json");
}

}