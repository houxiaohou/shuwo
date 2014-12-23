<?php
require "Model/User.php";
interface  IUserManager
{
	public  function GetUserByID($userid);
	//
	public function GetAllUser();
	//
	public function InsertUser(User $user);
	//
	public function  UpdaterUser(User $user);
}