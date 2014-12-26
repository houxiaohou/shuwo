<?php
require 'Model/Category.php';
interface  ICategoryDAL
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