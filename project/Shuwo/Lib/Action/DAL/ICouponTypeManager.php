<?php
require 'Model/CouponType.php';
interface  ICouponTypeManager 
{
	//
	public  function GetAllCouponType();
	//
	public  function AddCoupType(CouponType $coupontype);
	//
	public  function Update(CouponType $coupontype);
}