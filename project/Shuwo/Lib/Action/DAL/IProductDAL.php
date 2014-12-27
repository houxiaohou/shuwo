<?php
interface IProductDAL
{
	//
	public function GetAllProduct(); 
	//
	public function GetProductByID($id); 
	//
    public  function UpdateProduct(productModel $prodcut);
    //
    public function  AddProduct(productModel $prodcut);
    //
    public  function  DeleteProduct($id);
   
}
