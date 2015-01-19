<?php
namespace Api\Controller;
use Think\Controller\RestController;
require_once 'ShopConst.php';
require_once 'BAL\GeoHash.php';
class ShopApiController extends RestController {

	//返回所有店铺
public function getallshops() {
		$shop =M("shop");
		$data =$shop->select();
		$this->response($data,"json");
}

//通过id查询店铺
public function getshopbyid() {
	$shop =M("shop");
	$shopid  = I('get.id');
	$sql = ShopConst::SHOPID.'="'.$shopid.'"';
	$data = $shop->where($sql)->find();
	$this->response($data,"json"); 
}

// 通过经纬度得到周围的店铺
public function getshops()
{
	$lat = I('get.lat');
	$long =I('get.long');
	
	$data["lat"] = $lat;
	
	$this->response($data,"json");
}

public  function getproducts()
{
	$shop =M("shop");
	$data["shopid"]  = $_GET["id"];
	$this->response($data,"json");
}
public function addshop()
{
	$shop =M("shop");
	$ranchar = chr(rand(97,122)).chr(rand(97,122));
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