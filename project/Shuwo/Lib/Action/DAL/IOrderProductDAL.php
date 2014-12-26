<?php
require 'Model/orderproduct.php';
interface  IOrderProductDAL
{
	public  function  AddOrderProduct(orderproduct $orderproduct);
	
	public  function  GetAllProductByOrderID($orderID);
	
}