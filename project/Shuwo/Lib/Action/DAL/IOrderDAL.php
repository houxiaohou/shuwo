<?php
interface  IOrderDAL
{
	public function AddOrder(orderModel $order);
	
	public  function UpdateOrder(orderModel $order);
	
	public function  GetOrderByOrderStatus($userid,$orderstatus);
	
	public  function GetOrderByPaymentStatus($userid,$paymentstatus);
	
	public  function GetOrderByUserID($userid);
	
}