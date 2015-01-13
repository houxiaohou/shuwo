<?php
interface  ICouponDAL
{
	//
	public function GetValidCouponsByUserID($userid);
	
	///
	public  function GetUnValidCouponsByUserID($userid);
	
	public function AddCoupon(Coupon $coupon);
	
	public function GetCouponByID($couponid);
	
	public function UpdateValidGoupon($couponid);
	
	
}