<?php
require 'DAL/ProductDAL.php';
require 'DAL/UserDAL.php';
require 'DAL/Model/User.php';
require 'Utilities/UserConst.php';
require 'Utilities/WeixinAuthorizer.php';

class IndexAction extends Action {
    public function index(){
    	$usermanager = new UserDAL();
    	$user  =new User();
    	
    	if (WeixinAuthorizer::AuthorizUser() != null)
    	{
    		$user = WeixinAuthorizer::AuthorizUser() ;

    		$userid =  $usermanager->InsertUser($user);
    		
    		session(UserConst::USERID) = $userid;
    	}
    	
    	$productmanager = new ProductDAL();
    	$this->data =  $productmanager->GetAllProduct();
    	$this->display();
    }
}


