<?php
interface IProductDAL
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
