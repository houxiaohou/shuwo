<?php
interface  IProductCategoryDAL
{
	public function AddProductCategory(productcategoryModel $productcategory);
	public function UpdateProductCategory(productcategoryModel $productcategory);
	public function GetAllProductByCategoryID($categoryid); 
	
}