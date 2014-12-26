<?php
require 'Model/coupon.php';

interface  ICouponDAL
{
	public function GetValidCouponsByUserID($userid);
	
	public  function GetAllUnValidCouponsByUserID($userid);
	
	public function AddCoupon(coupon $coupon);
	
	public function GetCouponByID($couponid);
	
	public function UpdateValidGoupon($couponid);
}