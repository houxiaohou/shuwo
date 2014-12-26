<?php
require 'Model/Order.php';
interface  IOrderManager
{
	public function AddOrder(Order $order);
	
	public  function UpdateOrder(Order $order);
	
	public function  GetOrderByOrderStatus($userid,$orderstatus);
	
	public  function GetOrderByPaymentStatus($userid,$paymentstatus);
	
	public  function GetOrderByUserID($userid);
	
	public  function  GetAllProductByOrderID($orderID);
	
	
}