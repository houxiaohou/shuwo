<?php

interface IBankTypeDAL
{
	public function GetAllBankType();
	
	public function AddBankType(banktypeModel $banktype);
	
	public function UpdateBankType(banktypeModel $banktype);
	
	public function DeleteBankType($id);
}