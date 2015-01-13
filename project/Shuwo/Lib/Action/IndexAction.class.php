<?php
require_once 'DAL/UserDAL.php';
require_once 'DAL/ProductDAL.php';
require_once "Utilities/WeixinAuthorizer.php";
require_once 'Utilities/UserConst.php';
class IndexAction extends Action {
    public function index(){
    	$userdal= new UserDAL();
    	$user = M('user');
    	if (WeixinAuthorizer::AuthorizUser())
    	{
    		$user = WeixinAuthorizer::AuthorizUser();
    		$userid =  $userdal->InsertUser($user);
     	   
    	} $_SESSION[UserConst::USERID]=$userid;
    	$productdal = new ProductDAL();
    	$this->data = $productdal->GetAllProduct();
    	$this->display();
    }
}


