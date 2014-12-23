<?php
require 'Model/Category.php';
interface  ICategoryManager
{
	//
	public function GetAllCategory();
	//
	public  function  AddCategory(Category $category);
	//
    public  function DelectCategory($id);
    //
    public function  UpdateCategory(Category $category);
    
}