<?php
return array(
'URL_ROUTER_ON' => true, // 是否开启URL路由
'URL_ROUTE_RULES' => array(
		//店铺URL配置
		array('allshops', 'ShopApi/getallshops', '', array('method' => 'GET')),
		array('shops', 'ShopApi/getshops', '', array('method' => 'GET')),
		array('shop/:id/allproducts', 'ShopApi/getallproducts', '', array('method' => 'GET')),
		array('shop/:id/products', 'ShopApi/getsaleproducts', '', array('method' => 'GET')),
        array('shop/:id', 'ShopApi/getshopbyid', '', array('method' => 'GET')),
		array('shop/:id/isopen','ShopApi/updateshopisopen', '', array('method' => 'POST')),
		array('shop/:id','ShopApi/updateshop', '', array('method' => 'POST')),
		array('shop','ShopApi/addshop', '', array('method' => 'POST')),
        array('shop/:id','ShopApi/deleteshop', '', array('method' => 'DELETE')),
		
		//请求上传图片七牛token
		array('uptoken', 'ImgApi/getuptoken', '', array('method' => 'GET')),
		
		//产品URL配置 
		array('allproducts', 'ProductApi/getallproducts', '', array('method' => 'GET')),
		array('product/:id', 'ProductApi/getproductbyid', '', array('method' => 'GET')),
		array('product/:id/issale', 'ProductApi/updateproductissale', '', array('method' => 'POST')),
		array('product/:id', 'ProductApi/updateproduct', '', array('method' => 'POST')),
		array('product', 'ProductApi/addproduct', '', array('method' => 'POST')),
		array('product/:id', 'ProductApi/deleteproduct', '', array('method' => 'DELETE')),
		
		
        //产品类别URL配置
        array('allcategory','CategoryApi/getallcategorys','',array('method'=>'GET')),//查询所有的种类
        array('category/:id','CategoryApi/getcategorybyid', '', array('method' => 'GET')),//根据GET传的id查询对应的水果种类信息
        array('category/:id','CategoryApi/updatecategory', '', array('method' => 'POST')),//更新水果类型，以（POST）传参
        array('category','CategoryApi/addcategory', '', array('method' => 'POST')),//添加水果类型，以（POST）传参
        array('category/:id','CategoryApi/deletecategory', '', array('method' => 'DELETE')),   //删除水果类型
    
        //用户地址URL配置
        array('address/default','ShippingaddressApi/useraddress','',array('method'=>'GET')),//获取用户的默认地址
        array('address/:id/default','ShippingaddressApi/updateisdefault', '', array('method' => 'POST')),//局部更新地址，以（POST）传参
        array('address/:id','ShippingaddressApi/getaddressbyid', '', array('method' => 'GET')),//根据GET传的id查询对应的地址信息
        array('address/:id','ShippingaddressApi/updateaddress', '', array('method' => 'POST')),//更新地址，以（POST）传参
        array('address','ShippingaddressApi/getalluseraddress', '', array('method' => 'GET')),//获取用户的全部地址
        array('address','ShippingaddressApi/addaddress', '', array('method' => 'POST')),//添加地址，以（POST）传参
        array('address/:id','ShippingaddressApi/deleteaddress', '', array('method' => 'post')),   //删除地址

       //用户账号密码URL配置
       array('alladmin','AdminApi/getalladmin','',array('method'=>'GET')),//查询所有用户
       array('admin/:id','AdminApi/updateadmin', '', array('method' => 'POST')),//更新地址，以（POST）传参
       array('admin','AdminApi/addadmin', '', array('method' => 'POST')),//添加地址，以（POST）传参

       //订单URL配置
      array('allorder','OrderApi/getallorder','',array('method'=>'GET')),//查询所有的订单
      array('order/:id','OrderApi/getorderbyid', '', array('method' => 'GET')),//根据GET传的id查询对应的订单
      array('ordershop/:id','OrderApi/getordershopbyid', '', array('method' => 'GET')),//根据GET传的shopid查询对应店铺的的订单
      array('order/:id','OrderApi/deleteorder', '', array('method' => 'DELETE')),   //删除订单
      array('order','OrderApi/createorder', '', array('method' => 'POST')),//生成新订单
      array('weight','OrderApi/getweight', '', array('method' => 'POST')),//称重

)
);