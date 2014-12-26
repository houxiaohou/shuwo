<?php
require 'Model/OrderExpress.php';
interface  IOrderExpressManager
{
	public function AddOrderExpress(OrderExpress $orderExpress);
	
	public function UpdateOrderExpress(OrderExpress $orderExpress);
}