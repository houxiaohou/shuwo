<?php
interface  ICouponTypeDAL 
{
	//
	public  function GetAllCouponType();
	//
	public  function AddCoupType(coupontypeModel  $coupontype);
	//
	public  function Update(coupontypeModel $coupontype);
}