<?php
require 'IProductDAL.php';
class ProductDAL implements  IProductDAL
{

	public function GetAllProduct()
	{
		try 
		{
		    $data = D('Product');
		    
		    
		    $data->create();
		    $data1 = $data->select();
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
	
	public  function UpdateProduct(productModel $prodcut)
	{
		
	}
	
	public function  AddProduct(productModel $prodcut)
	{
		
	}

	public  function  DeleteProduct($id)
	{
		
	}

}