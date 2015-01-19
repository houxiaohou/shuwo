<?php
return array(
'URL_ROUTER_ON' => true, // 是否开启URL路由
'URL_ROUTE_RULES' => array(
		//店铺URL配置
		array('allshops', 'ShopApi/getallshops', '', array('method' => 'GET')),
		array('shops', 'ShopApi/getshops', '', array('method' => 'GET')),
		array('shop/:id', 'ShopApi/getshopbyid', '', array('method' => 'GET')),
		array('shop/:id/products', 'ShopApi/getproducts', '', array('method' => 'GET')),
		array('shop','ShopApi/addshop', '', array('method' => 'POST')),
		array('shop/:id','ShopApi/updateshop', '', array('method' => 'POST')),
        array('shop/:id','ShopApi/deleteshop', '', array('method' => 'DELETE')),
		
		//产品URL配置 
)
);