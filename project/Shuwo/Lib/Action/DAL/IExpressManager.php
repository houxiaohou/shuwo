<?php
require 'Model/Express.php';
interface IExpressManager
{
	public  function GetAllExpress();
	
	public function AddExpress(Express $express);
	
	public function DeleteExprese($expressid);
	
	public function UpdateExpress(Express $express);
}