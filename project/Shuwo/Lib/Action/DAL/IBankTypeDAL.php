<?php

interface IBankTypeDAL
{
	public function GetAllBankType();
	
	//插入banktype
	//banktype：banktype对象
	//return bankytypeid 
	public function AddBankType(banktypeModel $banktype);
	
	//
	public function UpdateBankType(banktypeModel $banktype);
	
	public function DeleteBankType($id);
}