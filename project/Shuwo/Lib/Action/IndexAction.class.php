<?php
require_once 'DAL/ShopDAL.php';
class IndexAction extends Action {
    public function index(){
    	/*$userdal= new UserDAL();
    	$user = M('user');
    	if (WeixinAuthorizer::AuthorizUser())
    	{
    		$user = WeixinAuthorizer::AuthorizUser();
    		$userid =  $userdal->InsertUser($user);
     	   
    	} $_SESSION[UserConst::USERID]=$userid;
    	$productdal = new ProductDAL();
    	$this->data = $productdal->GetAllProduct();*/
    	
    	//$shopDAL = new ShopDAL();
    	//$data =$shopDAL->GetShopByID("S0001");
    	$this->display();
    }
}


