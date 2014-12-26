<?php
require 'Model/productcategory.php';
interface  IProductCategoryDAL
{
	public function AddProductCategory(productcategory $productcategory);
	public function UpdateProductCategory(productcategory $productcategory);
	public function GetAllProductByCategoryID($categoryid); 
	
}