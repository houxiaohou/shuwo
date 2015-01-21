<?php
namespace Api\Controller;
use Think\Controller\RestController;
require_once 'ShopConst.php';
require_once 'GeoHash.php';
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
	$id  = I('get.id');
	$sql = ShopConst::ID.'="'.$id.'"';
	$data = $shop->where($sql)->find();
	$this->response($data,"json"); 
}

// 通过经纬度得到周围的店铺
public function getshops()
{
	$shop =M("shop");
	$geohash = new Geohash();
	$lat = I('get.lat');
	$long =I('get.long');
	$start =I('get.start')-1;
	$count =I('get.count');
	$n = 4;
	if ($lat&$long)
	{
		$geohashcode = $geohash->encode($lat, $long);
		$likegeo = substr($geohashcode, 0,$n); 
		$sql = 'SELECT *,GETDISTANCE(latitude,longitude,'.$lat.','.$long.') AS distance FROM  
				shop where geohash like "'.$likegeo.'%" AND 1 HAVING distance<=2000 ORDER BY distance ASC LIMIT '.$start.','.$count;
		$data = $shop->query($sql);	
	}

	$this->response($data,"json");
}
//通过店铺id得到所有的产品
public  function getallproducts()
{
	$product =M("product");
	$shopid = $_GET["id"];
	$data = $product->join("shopproduct ON shopproduct.productid=product.productid")->
	                  join("productcategory ON productcategory.productid=product.productid")->
	                  join("category ON productcategory.categoryid = category.categoryid")->
	                  where("shopid=".$shopid)->select();
	$this->response($data,'json');  
}

public  function getsaleproducts()
{
	$product =M("product");
	$shopid = $_GET["id"];
	$data = $product->join("shopproduct ON shopproduct.productid=product.productid")->
	                  join("productcategory ON productcategory.productid=product.productid")->
	                  join("category ON productcategory.categoryid = category.categoryid")->
	                  where("shopid=".$shopid." AND issale=1")->order('num desc')->select();
	$this->response($data,'json');
}
public function addshop()
{
	$shop =M("shop");
	$geohash = new Geohash();
	$data[ShopConst::SHOPNAME] = I('post.spn');
	$data[ShopConst::SHOPADDRESS]=I('post.spadr');
	$data[ShopConst::CONTACTNAME] =I('post.ctn');
	$data[ShopConst::CONTACTPHONE] = I('post.ctp');
	$data[ShopConst::CITY] = I('post.city');
	$data[ShopConst::PROVINCE] =I('post.prv');
	$data[ShopConst::DISTINCT] =I('post.dst');
	$lat = $data[ShopConst::LATITUDE] = I('post.lat');
	$long  = $data[ShopConst::LONGITUDE] = I('post.long');
	$data[ShopConst::GEOHASH] = $geohash->encode($lat, $long);
	$data[ShopConst::NOTICE] = I('post.ntc');
	$id =  $shop->add($data);
	$ranchar = chr(rand(97,122)).chr(rand(97,122));
	$shopid = $ranchar.$id;
	$s["shopid"] = $shopid;
	$shop->where('id='.$id)->setField('shopid',$shopid);
	$this->response($s,"json");
		
}
public function updateshop()
{
	$shop =M("shop");
	$data["id"]  = $_GET["id"];
	$geohash = new Geohash();
	$data[ShopConst::SHOPNAME] = I('post.spn');
	$data[ShopConst::SHOPADDRESS]=I('post.spadr');
	$data[ShopConst::CONTACTNAME] =I('post.ctn');
	$data[ShopConst::CONTACTPHONE] = I('post.ctp');
	$data[ShopConst::CITY] = I('post.city');
	$data[ShopConst::PROVINCE] =I('post.prv');
	$data[ShopConst::DISTINCT] =I('post.dst');
	$lat = $data[ShopConst::LATITUDE] = I('post.lat');
	$long  = $data[ShopConst::LONGITUDE] = I('post.long');
	$data[ShopConst::GEOHASH] = $geohash->encode($lat, $long);
	$data[ShopConst::NOTICE] = I('post.ntc');
	$shop->save($data);
}
public function deleteshop()
{
	$shop =M("shop");
	$id  = $_GET["id"];
	$shop->where('id='.$id)->delete();
}
}