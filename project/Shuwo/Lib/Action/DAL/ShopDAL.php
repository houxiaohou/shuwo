<?php
class ShopDAL 
{
    public function GetAllShops()
    {}
    
    public  function GetShopByID($shopid)
    {
       $shop = M("shop");
       $condition = 'ShopID="'.$shopid.'"';
       $data = $shop->where($condition)->find();
       
       return $data;
    }
    
    
}