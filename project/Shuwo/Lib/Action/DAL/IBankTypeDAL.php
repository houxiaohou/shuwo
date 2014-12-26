<?php
require "Model/BankType.php";
interface IBankTypeDAL
{
	public function GetAllBankType();
	
	public function AddBankType(BankType $banktype);
	
	public function UpdateBankType(BankType $banktype);
	
	public function DeleteBankType($id);
}