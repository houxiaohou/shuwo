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
    	
    	$productmanager = new ProductDAL();
    	$this->data =  $productmanager->GetAllProduct();
    	$this->display();
    }
}


