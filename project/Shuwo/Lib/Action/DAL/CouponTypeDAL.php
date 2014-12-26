<?php
require 'ICouponTypeDAL.php';
class CouponTypeDAL implements  ICouponTypeDAL
{
	public  function GetAllCouponType();
	public  function AddCoupType(CouponType $coupontype);
	public  function Update(CouponType $coupontype);
}