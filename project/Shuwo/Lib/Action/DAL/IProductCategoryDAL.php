<?php
require '../../Model/productcategoryModel.class.php';
interface  IProductCategoryDAL
{
	public function AddProductCategory(productcategoryModel $productcategory);
	public function UpdateProductCategory(productcategoryModel $productcategory);
	public function GetAllProductByCategoryID($categoryid); 
	
}