<?php
require 'ICouponTypeManager';
class CouponTypeManager implements  ICouponTypeManager
{
	public  function GetAllCouponType();
	public  function AddCoupType(CouponType $coupontype);
	public  function Update(CouponType $coupontype);
}