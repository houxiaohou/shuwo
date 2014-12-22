<?php
require 'DAL/ProductManager.php';
class IndexAction extends Action {
    public function index(){
    	$productmanager = new ProductManager();
    	$this->data =  $productmanager->GetAllProduct();
    	$this->display();
    }
}


