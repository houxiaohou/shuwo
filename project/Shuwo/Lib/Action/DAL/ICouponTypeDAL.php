<?php
require 'Model/coupontype.php';
interface  ICouponTypeDAL 
{
	//
	public  function GetAllCouponType();
	//
	public  function AddCoupType(coupontype $coupontype);
	//
	public  function Update(coupontype $coupontype);
}