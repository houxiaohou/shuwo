<?php
interface  ICategoryDAL
{
	//
	public function GetAllCategory();
	//
	public  function AddCategory(categoryModel $category);
	//
    public  function DelectCategory($id);
    //
    public function  UpdateCategory(categoryModel $category);
    
}