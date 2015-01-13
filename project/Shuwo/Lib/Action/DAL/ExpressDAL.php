<?php
require 'IExpressDAL.php';
class ExpressDAL implements IExpressDAL
{
	public  function GetAllExpress();
	
	public function AddExpress(Express $express);
	
	public function DeleteExprese($expressid);
	
	public function UpdateExpress(Express $express);
}