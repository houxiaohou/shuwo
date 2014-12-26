<?php
require 'Model/express.php';
interface IExpressDAL
{
	public  function GetAllExpress();
	
	public function AddExpress(express $express);
	
	public function DeleteExprese($expressid);
	
	public function UpdateExpress(express $express);
}