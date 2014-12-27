<?php
require '../../Model/expressModel.class.php';
interface IExpressDAL
{
	public  function GetAllExpress();
	
	public function AddExpress(expressModel $express);
	
	public function DeleteExprese($expressid);
	
	public function UpdateExpress(expressModel $express);
}