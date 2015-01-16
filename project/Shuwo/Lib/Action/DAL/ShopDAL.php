<?php
require_once "Shuwo/Lib/Action/BAL/GeoHash.php";
// require_once 'Shop.php';
class ShopDAL 
{
    public function GetAllShops()
    {}
    
    public  function GetShopByID($shopid)
    {
       $shop = M("shop");
       $condition = "ShopID="+shopid;
       $data = $shop->where($condition)->find();
       
       return $data;
    }
    
    public function InsertShop(Shop $shop)
    {
//         $geoHash  = new Geohash();
//         $shopTable = M("shop");
//         $latitude=$shop->Latitude;
//         $longitude=$shop->Longitude;
//         $geoHashCode = $geoHash->encode($latitude,$longitude);
//         $shopTable->ShopID=$shop->id;
//         $shopTable->ShopAddress=$shop->ShopAddress;
//         $shopTable->ShopName=$shop->ShopName;
//         $shopTable->ContactName=$shop->ContactName;
//         $shopTable->ContactPhone=$shop->ContactPhone;
//         $shopTable->Latitude=$latitude;
//         $shopTable->Longitude=$longitude;
//         $shopTable->GeoHash = $geoHashCode;
//         $shopTable->City=$shop->City;
//         $shopTable->Distinct=$shop->Distinct;
//         $shopTable->Province=$shop->Province;
//         if($shopTable->add()){
//             $this->success('数据添加成功','shop');
//         }else{
//             $this->error("数据添加失败");
//         }
    }
}