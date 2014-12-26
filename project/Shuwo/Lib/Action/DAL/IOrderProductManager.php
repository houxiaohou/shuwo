<?php
require 'Model/OrderProduct.php';
interface  IOrderProductManager
{
	public  function  AddOrderProduct(OrderProduct $orderproduct);
	
	public  function  GetAllProductByOrderID($orderID);
}