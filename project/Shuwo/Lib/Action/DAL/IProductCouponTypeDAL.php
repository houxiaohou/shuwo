<?php
interface  IProductCouponTypeDAL
{
	public  function  AddProductCouponType(productcoupontypeModel $productcoupontype);
	public  function  UpdateProductCouponType(productcoupontypeModel $productcoupontype);
	public   function  DeleteProductCouponType($id);
}