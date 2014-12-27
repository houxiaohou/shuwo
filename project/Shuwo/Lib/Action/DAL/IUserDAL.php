<?php
require "../../Model/userModel.class.php";
interface  IUserDAL
{
	public  function GetUserByID($userid);
	//
	public function GetAllUser();
	//
	public function InsertUser(userModel $user);
	//
	public function  UpdaterUser(userModel $user);
}