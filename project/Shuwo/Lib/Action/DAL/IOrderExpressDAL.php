<?php
require '../../Model/orderexpressModel.class.php';
interface  IOrderExpressDAL
{
	public function AddOrderExpress(orderexpressModel $orderExpress);
	
	public function UpdateOrderExpress(orderexpressModel $orderExpress);
}