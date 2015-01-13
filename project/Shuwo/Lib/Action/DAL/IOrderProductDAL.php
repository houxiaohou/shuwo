<?php
interface  IOrderProductDAL
{
	public  function  AddOrderProduct(OrderProduct $orderproduct);
	
	public  function  GetAllProductByOrderID($orderID);
	
}