<?php
interface IShippingAddressDAL
{
	public function AddShippingAddress(ShippingAddress $shippingaddress);
	public function UpdateShippingAddress(ShippingAddress $shippingaddress);
	public function DeleteShippingAddress($said);
	public  function  GetAllAddressByUserId($userid);
}