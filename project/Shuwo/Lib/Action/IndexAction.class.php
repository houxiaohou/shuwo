<?php
require_once 'DAL/ShopDAL.php';
require_once 'DAL/UserDAL.php';
require_once 'Utilities/UserConst.php';
require_once 'Utilities/WeixinAuthorizer.php';
require_once 'BAL/GeoHash.php';
class IndexAction extends Action {
    public function index(){
           $userDal = new UserDAL();
           if(WeixinAuthorizer::AuthorizUser())
           {
           	  $user = WeixinAuthorizer::AuthorizUser();
           	  if($user)
           	  {
           	    $userid = $userDal->InsertUser($user);
           	  	$_SESSION[UserConst::USERID]  =$userid;
           	  }
           }
           
           // 查询店铺
           $latitude=$_POST['latitude_hidden'];
           $longitude=$_POST['longitude_hidden'];
           $geoHash = new Geohash();
           $geoHashCode =$geoHash->encode($latitude,$longitude);
           $length = 5;
           $likeGeoHash = substr($geoHashCode, 0,$length);
           $sql = 'GeoHash like'.$likeGeoHash.'%';
           $shop = M("shop");
           $data =  $shop->where($sql)->select();
           if(count($data))
           {
           	foreach ($data as $item)
           	{
           		
           	}
           }
           
    	$this->display();
    }
}


