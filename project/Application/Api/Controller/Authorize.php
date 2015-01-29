<?php
namespace Api\Controller;
require_once 'Xcrypt.php';
class Authorize
{
	public function Filter($type)
	{
		$header = [];
		$utoken= null;
		if(function_exists('getallheaders'))
		{
			$header = getallheaders();
		}
		else
		{
			$header = $this->getallheaders();
		}
		foreach ($header as $name => $value)
		{
			if ($name == "Authorization")
			{
				$utoken = $value;
				break;
			}
		}
		if(!$utoken)
		{
			return false;
		}
		$key =C("CRYPT_KEY");
		$xcrpt = new Xcrypt($key, 'cbc', $key);
		
		
		$data = $xcrpt->decrypt($utoken,'base64');
		if($data)
		{
			$str = explode("_", $data);
			if($str&&count($str)==2)
			{
				$id = intval($str[0]);
				$sql ='';
				$info =[];
				if($id)
				{
					if($type == 'user')
					{
						$user = M('user');
						$sql = "userid=".$id;
						$info = $user->where($sql)->find();
					}
					if($type == 'shop')
					{
						$shop = M('shop');
						$sql = "shopid=".$id;
						$info = $shop->where($sql)->find();
					}
					if($type ==	'admin')
					{
						$shop = M('admin');
						$sql = "name=".$id."AND password=".$str[1];
						$info = $shop->where($sql)->find();
					}
					if(!count($info))
					{ 
						return  false;
					}
					return $id;
				}
				else
				{
					return  false;
				}
			}
			else
			{
				return  false;;
			}
		}
		else
		{
			return  false;
		}
	} 
	
	private function getallheaders()
	{
		$headers = '';
		foreach ($_SERVER as $name => $value)
		{
			if (substr($name, 0, 5) == 'HTTP_')
			{
				$headers[str_replace(' ', '-', ucwords(strtolower(str_replace('_', ' ', substr($name, 5)))))] = $value;
			}
		}
		return $headers;
	}
}