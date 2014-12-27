<?php
require '../../Model/orderproductModel.class.php';
interface  IOrderProductDAL
{
	public  function  AddOrderProduct(orderproductModel $orderproduct);
	
	public  function  GetAllProductByOrderID($orderID);
	
}