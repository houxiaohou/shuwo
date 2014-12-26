<?php
require 'Model/order.php';
interface  IOrderDAL
{
	public function AddOrder(order $order);
	
	public  function UpdateOrder(order $order);
	
	public function  GetOrderByOrderStatus($userid,$orderstatus);
	
	public  function GetOrderByPaymentStatus($userid,$paymentstatus);
	
	public  function GetOrderByUserID($userid);
	
}