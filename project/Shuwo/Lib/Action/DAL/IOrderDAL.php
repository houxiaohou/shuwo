<?php
interface  IOrderDAL
{
	public function AddOrder(Order $order);
	
	public  function UpdateOrder(Order $order);
	
	public function  GetOrderByOrderStatus($userid,$orderstatus);
	
	public  function GetOrderByPaymentStatus($userid,$paymentstatus);
	
	public  function GetOrderByUserID($userid);
	
}