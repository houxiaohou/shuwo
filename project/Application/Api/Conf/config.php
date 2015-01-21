<?php
return array(
'URL_ROUTER_ON' => true, // 是否开启URL路由
'URL_ROUTE_RULES' => array(
		//店铺URL配置
		array('allshops', 'ShopApi/getallshops', '', array('method' => 'GET')),
		array('shops', 'ShopApi/getshops', '', array('method' => 'GET')),
		array('shop/:id/allproducts', 'ShopApi/getallproducts', '', array('method' => 'GET')),
		array('shop/:id/products', 'ShopApi/getsaleproducts', '', array('method' => 'GET')),
		array('shop/:id', 'ShopApi/getshopsbyid', '', array('method' => 'GET')),
		array('shop/:id','ShopApi/updateshop', '', array('method' => 'POST')),
		array('shop','ShopApi/addshop', '', array('method' => 'POST')),
        array('shop/:id','ShopApi/deleteshop', '', array('method' => 'DELETE')),
		
		//产品URL配置 
		
        //产品类别URL配置
        array('allcategory','CategoryApi/getallcategorys','',array('method'=>'GET')),//查询所有的种类
        array('category/:id','CategoryApi/getcategorybyid', '', array('method' => 'GET')),//根据GET传的id查询对应的水果种类信息
        array('category/:id','CategoryApi/updatecategory', '', array('method' => 'POST')),//更新水果类型，以（POST）传参，‘name‘=种类名称，’atr‘=种类属性。1代表（个）计量，2代表（斤/克）,3代表（根），4代表（盒）
        array('category','CategoryApi/addcategory', '', array('method' => 'POST')),//添加水果类型，以（POST）传参
        array('category/:id','CategoryApi/deletecategory', '', array('method' => 'DELETE')),   //删除水果类型
		
        
)
);