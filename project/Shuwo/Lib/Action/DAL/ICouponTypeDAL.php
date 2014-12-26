<?php
require 'Model/CouponType.php';
interface  ICouponTypeDAL 
{
	//
	public  function GetAllCouponType();
	//
	public  function AddCoupType(CouponType $coupontype);
	//
	public  function Update(CouponType $coupontype);
}