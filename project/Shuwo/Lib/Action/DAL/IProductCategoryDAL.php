<?php
interface  IProductCategoryDAL
{
	public function AddProductCategory(ProductCategory $productcategory);
	public function UpdateProductCategory(ProductCategory $productcategory);
	public function GetAllProductByCategoryID($categoryid); 
	
}