<?php
interface  ICouponTypeDAL 
{
	//
	public  function GetAllCouponType();
	//
	public  function AddCouponType(coupontypeModel $coupontype);
	//
	public  function UpdateCouponType(coupontypeModel $coupontype);
	
	public  function  DeleteCouponType($coupontypeid);
}