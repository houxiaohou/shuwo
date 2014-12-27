<?php
class WeixinAuthorizer
{
	public  static  function  AuthorizUser()
	{
		$user = new userModel();
		$user->Name ="shuwo";
		$user->UnionID="shuwo001";
		return  user;
	}
}