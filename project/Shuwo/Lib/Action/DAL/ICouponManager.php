<?php
require 'Model/Coupon.php';

interface  ICouponManager
{
	public function GetValidCouponsByUserID($userid);
	
	public  function GetAllUnValidCouponsByUserID($userid);
	
	public function AddCoupon(Coupon $coupon);
	
	public function GetCouponByID($couponid);
	
	public function UpdateValidGoupon($couponid);
}