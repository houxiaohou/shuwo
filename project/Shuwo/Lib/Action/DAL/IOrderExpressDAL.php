<?php
require 'Model/orderexpress.php';
interface  IOrderExpressDAL
{
	public function AddOrderExpress(orderexpress $orderExpress);
	
	public function UpdateOrderExpress(orderexpress $orderExpress);
}