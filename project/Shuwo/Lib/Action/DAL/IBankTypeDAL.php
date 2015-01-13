<?php

interface IBankTypeDAL
{
	public function GetAllBankType();
	
	//插入banktype
	//banktype：banktype对象
	//return bankytypeid 
	public function AddBankType(BankType $banktype);
	
	//
	public function UpdateBankType(BankType $banktype);
	
	public function DeleteBankType($id);
}