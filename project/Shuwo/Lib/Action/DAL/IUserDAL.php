<?php
require "Model/user.php";
interface  IUserDAL
{
	public  function GetUserByID($userid);
	//
	public function GetAllUser();
	//
	public function InsertUser(user $user);
	//
	public function  UpdaterUser(user $user);
}