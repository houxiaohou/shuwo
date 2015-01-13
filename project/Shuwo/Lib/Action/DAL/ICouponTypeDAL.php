<?php
interface  ICouponTypeDAL 
{
	//
	public  function GetAllCouponType();
	//
	public  function AddCouponType(CouponType $coupontype);
	//
	public  function UpdateCouponType(CouponType $coupontype);
	
	public  function  DeleteCouponType($coupontypeid);
}