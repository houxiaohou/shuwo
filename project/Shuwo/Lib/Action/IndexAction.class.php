<?php
require 'DAL/ProductDAL.php';
require 'DAL/UserDAL.php';
require 'DAL/Model/user.php';
require 'Utilities/UserConst.php';
require 'Utilities/WeixinAuthorizer.php';

class IndexAction extends Action {
    public function index(){
    	$usermanager = new UserDAL();
    	$user  =new user();
    	
    	if (WeixinAuthorizer::AuthorizUser() != null)
    	{
    		$user = WeixinAuthorizer::AuthorizUser() ;

    		$userid =  $usermanager->InsertUser($user);
    		
    		session(UserConst::USERID) = $userid;
    	}
    	$test = D("Test");
    	$test->Name = 'User1';
    	$productmanager = new ProductDAL();
    	$this->data =  $productmanager->AddProduct($test);
    	$this->display();
    }
}


