<?php
require 'IProductManager.php';
class ProductManager implements  IProductManageer
{

	public function GetAllProduct()
	{
		try 
		{
			$product = M("product");
		$data = $product->select();
		return  $data;
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