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
		if(!count($data))
		{
			$data = [];
		}	
		$this->response($data,"json");

}

//通过id查询店铺
public function getshopbyid() {
	$get = 'get.';
	$shop =M("shop");
	$id  = intval(I('get.id',0));
	$lat = doubleval(I($get.ShopConst::LATITUDE,0));
	$lng = doubleval(I($get.ShopConst::LONGITUDE,0));
	$sql = '';
	
	if ($id)
	{
		if($lat>0&$lng>0)
		{
            $sql = 'select *,GETDISTANCE(lat,lng,'.$lat.','.$lng.') AS distance FROM shop WHERE shopid='.$id;
		}
		else
		{
			$sql = 'select *,-1 AS distance FROM shop WHERE shopid='.$id;
		}
		$data = $shop->query($sql);
        if(!count($data))
        {
        	$data = [];
        }
        $this->response($data[0],"json");
	}
	else
	{ 
		$data = [];
		$this->response($data,"json");
	}
}

// 通过经纬度得到周围的营业店铺
public function getshops()
{
	$get = 'get.';
	$shop =M("shop");
	$geohash = new Geohash();
	$lat = doubleval(I($get.ShopConst::LATITUDE,0));
	$lng =doubleval(I($get.ShopConst::LONGITUDE,0));
	$start =intval(I('get.start',0))-1;
	$count =intval(I('get.count',0));
	$n = 4;
	if ($lat>0&$lng>0&$start>=0&$count>0)
	{
		$geohashcode = $geohash->encode($lat, $lng);
		$likegeo = substr($geohashcode,0,$n); 
		$sql = 'SELECT *,GETDISTANCE(lat,lng,'.$lat.','.$lng.') AS distance FROM  
				shop where geohash like "'.$likegeo.'%" AND 1 HAVING distance<=2000 AND isopen =true ORDER BY distance ASC LIMIT '.$start.','.$count;
		$data = $shop->query($sql);	
		if(!count($data))
		{
			$data = [];
		}
	}
	else 
	{
		$data = [];
		
	}
	$this->response($data,"json");
}

//通过店铺id得到所有的上架商品
public  function getallproducts()
{
	$product =M("product");
	$shopid = intval(I('get.id',0));
	if($shopid)
	{
		$data = $product->join("shopproduct ON shopproduct.productid=product.productid")->
	                  join("category ON category.categoryid = product.categoryid")->
	                  where("shopid=".$shopid)->select();
		if(!count($data))
		{
			$data = [];
		}
		$this->response($data,'json');
	}
}

//通过店铺id得到所有上架商品
public  function getsaleproducts()
{
	$product =M("product");
	$shopid = intval(I('get.id',0));
	if($shopid)
	{
		$data = $product->join("shopproduct ON shopproduct.productid=product.productid")->
	                  join("category ON category.categoryid = product.categoryid")->
	                  where("shopid=".$shopid." AND issale=1")->order('num desc')->select();
		if(!count($data))
		{
			 $data = [];
		}
	}
	else
	{
		$data = [];
		
	}
	$this->response($data,'json');
}

//添加商铺
public function addshop()
{
	$post ='post.';
	$shop =M("shop");
	$id = 0;
	$data[ShopConst::SHOPNAME] = I($post.ShopConst::SHOPNAME,'');
	$data[ShopConst::SHOPADDRESS]=I($post.ShopConst::SHOPADDRESS,'');
	$data[ShopConst::SHOPIMGURL] = I($post.ShopConst::SHOPIMGURL,'');
	$data[ShopConst::CONTACTNAME] =I($post.ShopConst::CONTACTNAME,'');
	$data[ShopConst::CONTACTPHONE] = I($post.ShopConst::CONTACTPHONE,'');
	$data[ShopConst::CITY] = I($post.ShopConst::CITY,'');
	$data[ShopConst::PROVINCE] =I($post.ShopConst::PROVINCE,'');
	$data[ShopConst::DISTRICT] =I($post.ShopConst::DISTRICT,'');
	$lat = $data[ShopConst::LATITUDE] = doubleval(I($post.ShopConst::LATITUDE,0));
	$lng  = $data[ShopConst::LONGITUDE] = doubleval(I($post.ShopConst::LONGITUDE,0));
	if($lat>0&$lng>0)
	{
		$geohash = new Geohash();
		$data[ShopConst::GEOHASH] = $geohash->encode($lat, $lng);
	}
	else
	{
		$data[ShopConst::GEOHASH] ='';
	}
	$data[ShopConst::NOTICE] = I($post.ShopConst::NOTICE,'');
	$data[ShopConst::DELIVERYPRICE]=I($post.ShopConst::DELIVERYPRICE,'');
	$data[ShopConst::ISOPEN] = I($post.ShopConst::ISOPEN,0);
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

//更新店铺
public function updateshop()
{
     $post ='post.';
	 $id  = intval(I('get.id',0));
	 $lat = 0;
	 $lng = 0;
	 if($id)
	 {
	 	$shop =M("shop");
	 	$data[ShopConst::SHOPID] = $id;
		if (I($post.ShopConst::SHOPNAME)!=null)
		{
			$data[ShopConst::SHOPNAME] = I($post.ShopConst::SHOPNAME);
		}
		if(I($post.ShopConst::SHOPADDRESS)!=null)
		{
			$data[ShopConst::SHOPADDRESS]=I($post.ShopConst::SHOPADDRESS);
		}
		if(I($post.ShopConst::SHOPIMGURL)!=null)
		{
			$data[ShopConst::SHOPIMGURL] = I($post.ShopConst::SHOPIMGURL);
		}
		if(I($post.ShopConst::CONTACTNAME)!=null)
		{
			$data[ShopConst::CONTACTNAME] =I($post.ShopConst::CONTACTNAME);
		}
		if(I($post.ShopConst::CONTACTPHONE)!=null)
		{
			$data[ShopConst::CONTACTPHONE] = I($post.ShopConst::CONTACTPHONE);
		}
		if(I($post.ShopConst::CITY)!=null)
		{
			$data[ShopConst::CITY] = I($post.ShopConst::CITY);
		}
		if(I($post.ShopConst::PROVINCE)!=null)
		{
			$data[ShopConst::PROVINCE] =I($post.ShopConst::PROVINCE);
		}
	    if (I($post.ShopConst::DISTRICT)!=null)
	    {
			$data[ShopConst::DISTRICT] =I($post.ShopConst::DISTRICT);
	    }
	    if(doubleval(I($post.ShopConst::LATITUDE))&doubleval(I($post.ShopConst::LONGITUDE)))
	    {
					$lat = $data[ShopConst::LATITUDE] = I($post.ShopConst::LATITUDE);
					$lng  = $data[ShopConst::LONGITUDE] = I($post.ShopConst::LONGITUDE);
					$geohash = new Geohash();
					$data[ShopConst::GEOHASH] = $geohash->encode($lat, $lng);
	    }
	    if(I($post.ShopConst::NOTICE)!=null)
	    {
			$data[ShopConst::NOTICE] = I($post.ShopConst::NOTICE);
	    }
	    if(intval(I($post.ShopConst::DELIVERYPRICE)))
	    {
			$data[ShopConst::DELIVERYPRICE]=I($post.ShopConst::DELIVERYPRICE);
	    }
	    if (I($post.ShopConst::ISOPEN)!=null)
	    {
	    	$isopen =intval(I($post.ShopConst::ISOPEN));
	    	if ($isopen)
			{
				$data[ShopConst::ISOPEN] = 1;
			}
			else
			{
				$data[ShopConst::ISOPEN] = 0;
			}
	    }
		$shop->save($data);
	}
}

	//更新店铺是否营业
	public function updateshopisopen()
	{
		$shop =M("shop");
		$post ='post.';
		$id  = intval(I('get.id',0));
		$isopen =intval(I($post.ShopConst::ISOPEN));
		if($id)
		{
			$data[ShopConst::SHOPID] = $id;
			if ($isopen)
			{
				$data[ShopConst::ISOPEN] = 1;
			}
			else
			{
				$data[ShopConst::ISOPEN] = 0;
			}
			$shop->save($data);
		}
	}

//删除店铺
// 
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