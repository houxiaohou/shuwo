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
		if(count($data))
		{
			$this->response($data,"json");
		}
}

//通过id查询店铺
public function getshopbyid() {
	$shop =M("shop");
	$id  = intval(I('get.id',0));
	if ($id)
	{
        $sql = ShopConst::SHOPID.'="'.$id.'"';
        $data = $shop->where($sql)->find();
        $this->response($data,"json"); 
	}
}

// 通过经纬度得到周围的店铺
public function getshops()
{
	$shop =M("shop");
	$geohash = new Geohash();
	$lat = doubleval(I('get.lat',0));
	$long =doubleval(I('get.long',0));
	$start =intval(I('get.start',0))-1;
	$count =intval(I('get.count',0));
	$n = 4;
	if ($lat>0&$long>0&$start>=0&$count>0)
	{
		$geohashcode = $geohash->encode($lat, $long);
		$likegeo = substr($geohashcode,0,$n); 
		$sql = 'SELECT *,GETDISTANCE(lat,long,'.$lat.','.$long.') AS distance FROM  
				shop where geohash like "'.$likegeo.'%" AND 1 HAVING distance<=2000 ORDER BY distance ASC LIMIT '.$start.','.$count;
		$data = $shop->query($sql);	
		$this->response($data,"json");
	}


}
//通过店铺id得到所有的产品
public  function getallproducts()
{
	$product =M("product");
	$shopid = intval(I('get.id',0));
	if($shopid)
	{
	$data = $product->join("shopproduct ON shopproduct.productid=product.productid")->
	                  join("productcategory ON productcategory.productid=product.productid")->
	                  join("category ON productcategory.categoryid = category.categoryid")->
	                  where("shopid=".$shopid)->select();
	if(count($data))
	{
		$this->response($data,'json');  
	}
	}
}

public  function getsaleproducts()
{
	$product =M("product");
	$shopid = intval(I('get.id',0));
	if($shopid)
	{
		$data = $product->join("shopproduct ON shopproduct.productid=product.productid")->
	                  join("productcategory ON productcategory.productid=product.productid")->
	                  join("category ON productcategory.categoryid = category.categoryid")->
	                  where("shopid=".$shopid." AND issale=1")->order('num desc')->select();
		$this->response($data,'json');
	}
}
public function addshop()
{
	$post ='post';
	$shop =M("shop");
	$id = 0;
	$geohash = new Geohash();
	$data[ShopConst::SHOPNAME] = I($post.ShopConst::SHOPNAME);
	$data[ShopConst::SHOPADDRESS]=I($post.ShopConst::SHOPADDRESS);
	$data[ShopConst::SHOPIMGURL] = I($post.ShopConst::SHOPIMGURL);
	$data[ShopConst::CONTACTNAME] =I($post.ShopConst::CONTACTNAME);
	$data[ShopConst::CONTACTPHONE] = I($post.ShopConst::CONTACTPHONE);
	$data[ShopConst::CITY] = I($post.ShopConst::CITY);
	$data[ShopConst::PROVINCE] =I($post.ShopConst::PROVINCE);
	$data[ShopConst::DISTINCT] =I($post.ShopConst::DISTINCT);
	$lat = $data[ShopConst::LATITUDE] = I($post.ShopConst::LATITUDE);
	$long  = $data[ShopConst::LONGITUDE] = I($post.ShopConst::LONGITUDE);
	$data[ShopConst::GEOHASH] = $geohash->encode($lat, $long);
	$data[ShopConst::NOTICE] = I($post.ShopConst::NOTICE);
	$data[ShopConst::LIMITEPRICE]=I($post.ShopConst::LIMITEPRICE);
	$id =  $shop->add($data);
	if($id>0)
	{
		$ranchar = chr(rand(97,122)).chr(rand(97,122));
		$shopsn = $ranchar.$id;
		$s["shopsn"] = $shopsn;
		$shop->where('shopid='.$id)->setField('shopsn',$shopsn);
		$this->response($s,"json");
	}
		
}
public function updateshop()
{
     $post ='post';
	 $id  = intval(I('get.id',0));
	 if($id)
	 {
	 	$shop =M("shop");
	 	$data["shopid"] = $id;
		$geohash = new Geohash();
		$data[ShopConst::SHOPNAME] = I($post.ShopConst::SHOPNAME);
		$data[ShopConst::SHOPADDRESS]=I($post.ShopConst::SHOPADDRESS);
		$data[ShopConst::SHOPIMGURL] = I($post.ShopConst::SHOPIMGURL);
		$data[ShopConst::CONTACTNAME] =I($post.CONTACTNAME);
		$data[ShopConst::CONTACTPHONE] = I($post.ShopConst::CONTACTPHONE);
		$data[ShopConst::CITY] = I($post.ShopConst::CITY);
		$data[ShopConst::PROVINCE] =I($post.ShopConst::PROVINCE);
		$data[ShopConst::DISTRICT] =I($post.ShopConst::DISTRICT);
		$lat = $data[ShopConst::LATITUDE] = I($post.ShopConst::LATITUDE);
		$long  = $data[ShopConst::LONGITUDE] = I($post.ShopConst::LONGITUDE);
		$data[ShopConst::GEOHASH] = $geohash->encode($lat, $long);
		$data[ShopConst::NOTICE] = I($post.ShopConst::NOTICE);
		$data[ShopConst::LIMITEPRICE]=I($post.ShopConst::LIMITEPRICE);
		$data[ShopConst::GEOHASH] = $geohash->encode($lat, $long);
		$shop->save($data);
	}
}
public function deleteshop()
{
    $id  = intval(I('get.id',0));
    if($id)
    {
    	$shop =M("shop");
		$shop->where('shopid='.$id)->delete();
    }
}
}