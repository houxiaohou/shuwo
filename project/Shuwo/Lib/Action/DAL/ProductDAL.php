<?php
require 'IProductDAL.php';
class ProductDAL implements  IProductDAL
{

	public function GetAllProduct()
	{
		try 
		{

		}
		catch (Exception $ex)
		{
			//log 
			throw $ex;
		}
	}
	
	public function  GetProductByID($id)
	{

	}
	
	public  function UpdateProduct(Product $prodcut)
	{
		
	}
	
	public function  AddProduct(Product $prodcut)
	{
		
	}

	public  function  DeleteProduct($id)
	{
		
	}

}