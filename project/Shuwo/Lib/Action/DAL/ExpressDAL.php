<?php
require 'IExpressDAL.php';
class ExpressDAL implements IExpressDAL
{
	public  function GetAllExpress();
	
	public function AddExpress(expressModel $express);
	
	public function DeleteExprese($expressid);
	
	public function UpdateExpress(expressModel $express);
}