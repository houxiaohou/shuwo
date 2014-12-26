<?php
require 'Model/category.php';
interface  ICategoryDAL
{
	//
	public function GetAllCategory();
	//
	public  function  AddCategory(category $category);
	//
    public  function DelectCategory($id);
    //
    public function  UpdateCategory(category $category);
    
}