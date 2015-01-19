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
public function addshop()
{
   $data["name"]= $_POST["name"];
   $data["method"]="add";
   $this->response($data,"json");
}
public function updateshop()
{
	$data["id"]  = $_GET["id"];
	$data["name"] = "update";
	$this->response($data,"json");
}
public function deleteshop()
{
	$data["id"]  = $_GET["id"];
}
}