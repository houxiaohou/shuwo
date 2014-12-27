<?php

class IndexAction extends Action {
    public function index(){
    	$usermanager = new UserDAL();
    	
    	
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


