<?php
require "Model/BankType.php";
interface IBankTypeManager
{
	public function GetAllBankType();
	
	public function AddBankType(BankType $banktype);
	
	public function UpdateBankType(BankType $banktype);
	
	public function DeleteBankType($id);
}