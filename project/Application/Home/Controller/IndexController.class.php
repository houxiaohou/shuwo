<?php
namespace Home\Controller;
use Think\Controller;
require_once 'Weixin.php';
require_once 'Xcrypt.php';
require_once 'UserConst.php';
class IndexController extends Controller {
    public function index(){
      $weixin  = new Weixin();
      $url = $weixin->getwxurl("http://www.shuwow.com/Home/authorize");
      $key =C("CRYPT_KEY");
      $xcrpt = new Xcrypt($key, 'cbc', 'auto');
      if(cookie('utoken'))
      {
      	$value  = cookie('utoken');
      	$data = $xcrpt->decrypt($value,'base64');
      	if($data)
      	{
      		
      		$this->redirect("authorize");
      	}
      	else
      	{
				//$redircturl = "Location:".$url;
				//header($redircturl);
				//exit;

      			//测试模拟代码
      			$this->redirect("authorize");
      	}
      }
      else 
      {
			//$redircturl = "Location:".$url;
			//header($redircturl);
			//exit;

      	//测试模拟代码
		$this->redirect("authorize");
      }
    }
    
    public function authorize()
    {
    	$weixin  = new Weixin();
    	$key =C("CRYPT_KEY");
    	$xcrpt = new Xcrypt($key, 'cbc', 'auto');
    	$weixin->appid ='';
    	$weixin->appsecret='';
//     	$code  = I('get.code');

//测试代码    	
$code ="testcode";
$token['openid'] = "openid";
$token['access_token'] = "access_token";
$userinfo["openid"] = "openid";
$userinfo["nickname"] = "test";
$userinfo["sex"] ="1";
$userinfo["province"] = "上海";
$userinfo["city"]="上海";
$userinfo["country"]="中国";
$userinfo["headimgurl"] ="http://wx.qlogo.cn/mmopen/g3MonUZtNHkdmzicIlibx6iaFqAc56vxLSUfpb6n5WKSYVY0ChQKkiaJSgQ1dZuTOgvLLrhJbERQQ4eMsv84eavHiaiceqxibJxCfHe/46";
$userinfo["unionid"] = "uninonid";
//
    	if($code)
    	{
    		//$token = $weixin->getTokenWithCode($code);
    		if ($token)
    		{
    			$openid = $token['openid'];
    			$accessToken = $token['access_token'];
    			//$userinfo = $weixin->getUser($openid, $accessToken);
    			if($userinfo)
    			{
    			    $useropenid =$userinfo['openid'];
    			    $user = M('user');
    			    $sql = "openid='".$useropenid."'";
    			    $data  = $user->where($sql)->find();
    			    if(count($data))
    			    {
    			    	$userid = $data[UserConst::USERID];
    			        $datetime = date('Ymd',strtotime('+14 day'));
    			        $str = $userid."_".$datetime;
    			        $xcrptstr = $xcrpt->encrypt($str,'base64');
    			        cookie('utoken',$xcrptstr,1209600);
    			    }
    			    else
    			    {
    			    	$data[UserConst::OPENID] = $userinfo[UserConst::OPENID];
    			    	$data[UserConst::UNIOID] = $userinfo[UserConst::UNIOID]?$userinfo[UserConst::UNIOID]:"";
    			    	$data[UserConst::NICKNAME] =$userinfo[UserConst::NICKNAME];
    			    	$data[UserConst::SEX] = $userinfo[UserConst::SEX];
    			    	$data[UserConst::PROVINCE] = $userinfo[UserConst::PROVINCE];
    			    	$data[UserConst::CITY] = $userinfo[UserConst::CITY];
    			    	$data[UserConst::COUNTRY]  =$userinfo[UserConst::COUNTRY];
    			    	$data[UserConst::HEADIMGURL] = $userinfo[UserConst::HEADIMGURL];
    			    	$data[UserConst::MOBILE] ='';
    			    	$data[UserConst::PASSWORD] = '';
    			    	$userid = $user->add($data);
    			    	$datetime = date('Ymd',strtotime('+14 day'));
    			    	$str = $userid."_".$datetime;
    			    	$xcrptstr = $xcrpt->encrypt($str,'base64');
    			    	cookie('utoken',$xcrptstr,1209600);
    			    }
    			    $this->redirect("index");
    			}
    			else
    			{
    				$this->error();
    			}
    		}
    		else 
    		{
    			$this->error();
    		}
    	}
    	else 
    	{
    		$this->error();
    	}
    }
}