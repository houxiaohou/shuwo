<?php
interface IShippingAddressDAL
{
	public function AddShippingAddress(shippingaddressModel $shippingaddress);
	public function UpdateShippingAddress(shippingaddressModel $shippingaddress);
	public function DeleteShippingAddress($said);
	public  function  GetAllAddressByUserId($userid);
}