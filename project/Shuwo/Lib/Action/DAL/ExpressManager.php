<?php
require 'IExpressManager.php';
class ExpressManager implements IExpressManager
{
	public  function GetAllExpress();
	
	public function AddExpress(Express $express);
	
	public function DeleteExprese($expressid);
	
	public function UpdateExpress(Express $express);
}