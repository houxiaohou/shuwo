<?php
require 'DAL/ProductManager.php';
require 'DAL/UserManager.php';
require 'Model/User.php';
require 'Utilities/UserConst.php';
require 'Utilities/WeixinAuthorizer.php';

class IndexAction extends Action {
    public function index(){
    	$usermanager = new UserManager();
    	$user  =new User();
    	
    	if (WeixinAuthorizer::AuthorizUser() != null)
    	{
    		$user = WeixinAuthorizer::AuthorizUser() ;

    		$userid =  $usermanager->InsertUser($user);
    		
    		session(UserConst::USERID) = $userid;
    	}
    	
    	$productmanager = new ProductManager();
    	$this->data =  $productmanager->GetAllProduct();
    	$this->display();
    }
}


