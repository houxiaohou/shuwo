<?php
require 'IProductManager.php';
class ProductManager implements  IProductManageer
{

	public function GetAllProduct()
	{
		$product = M("product");
		$data = $product->select();
		return  $data;
	}
	
	public function  GetProductByID($id)
	{
		$product = M("product");
		$data = $product->select();
		return  $data;
	}

}