<?php
require 'Model/Express.php';
interface IExpressDAL
{
	public  function GetAllExpress();
	
	public function AddExpress(Express $express);
	
	public function DeleteExprese($expressid);
	
	public function UpdateExpress(Express $express);
}