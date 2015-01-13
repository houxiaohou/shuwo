<?php
interface  IProductCouponTypeDAL
{
	public  function  AddProductCouponType(ProductCouponType $productcoupontype);
	public  function  UpdateProductCouponType(ProductCouponType $productcoupontype);
	public  function  DeleteProductCouponType($id);
}