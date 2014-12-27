<?php
require 'ICouponTypeDAL.php';
class CouponTypeDAL implements  ICouponTypeDAL
{
	public  function GetAllCouponType();
	public  function AddCoupType(coupontypeModel $coupontype);
	public  function Update(coupontypeModel $coupontype);
}