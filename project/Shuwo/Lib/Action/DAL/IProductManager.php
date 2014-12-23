<?php
require 'Model/Product.php';
interface IProductManageer
{
	//
	public function GetAllProduct(); 
	//
	public function GetProductByID($id); 
	//
    public  function UpdateProduct(Product $prodcut);
    //
    public function  AddProduct(Product $prodcut);
    //
    public  function  DeleteProduct($id);
}
