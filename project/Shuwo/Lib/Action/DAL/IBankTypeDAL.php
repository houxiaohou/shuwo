<?php
require "Model/banktype.php";
interface IBankTypeDAL
{
	public function GetAllBankType();
	
	public function AddBankType(banktype $banktype);
	
	public function UpdateBankType(banktype $banktype);
	
	public function DeleteBankType($id);
}