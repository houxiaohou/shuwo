<?php
namespace Home\Controller;

class Weixin
{
	public    $appid = "";  
    public    $appsecret = "";
    public    $redirect_rul ='';
    
    public function getGlobalAccessToken()
    {
    	//构造Get请求URL
    	$url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=".$this->appid."&secret=".$this->appsecret;
    	//通过CURL提交GET请求
    	$result = $this->https_request($url);
 
    	//解码JSON数据
    	$strjson=json_decode($result,true);
    	if ($strjson['errcode']||!$strjson) {
    		return false;
    	}
    	return $strjson;
    }
    
    //通过全局access token 获得用户信息
    public  function getUserbyglobaltoken($openId)
    {
    	if(!isset($openId)){
    		return false;
    	}
		//得到全局token
		$accessToken = $this->getGlobalAccessToken();
		//构造Get请求URL
		$url = "https://api.weixin.qq.com/cgi-bin/user/info?access_token={$accessToken}&openid={$openId}";
		//通过CURL提交GET请求
		$result = $this->https_request($url);
		//解码JSON数据
		$strjson=json_decode($result,true);
		if ($strjson['errcode']||!$strjson) {
				return false;
		}
		return  $strjson;
	}
	
	//通过code换取网页授权access_token和用户openid(微信auth2.0 受权)
	public function getTokenWithCode($code){
		if(!isset($code)){
			return false;
		}
		$url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=".$this->appid."&secret=".$this->appsecret."&code=".$code."&grant_type=authorization_code";
		$Token = $this->https_request($url);
		$data = json_decode($Token, true);
		if ($data['errcode']||!$data) {
				return false;
		}
		return $data;
	}
	
	public function getUser($openid,$token)
	{
		if(!isset($openid)||!isset($token))
		{
			return false;
		}
		$url = "https://api.weixin.qq.com/sns/userinfo?access_token=".$token."&openid=".$openid."&lang=zh_CN";
		$Token = $this->https_request($url);
		$data = json_decode($Token, true);
		if ($data['errcode']||!$data) {
			return false;
		}
		return $data;
	}
	
	//刷新access token
    public function refreshToken($refresh_token) {
        if(empty($refresh_token)){
            return false;
        }
        	$url = 'https://api.weixin.qq.com/sns/oauth2/refresh_token?appid='.$this->appid.'&grant_type=refresh_token&refresh_token='.$refresh_token;
        	$Token = $this->https_request($url);
        	$data = json_decode($Token, true);
    		if ($data['errcode']||!$data) {
				return false;
			}
        return $data;
       }
       
		public function https_request($url, $data = null, $method = 'GET')
		{
			$curl = curl_init();
			curl_setopt($curl, CURLOPT_URL, $url);
				curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
				curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
				if($method != 'GET'){
				if (!empty($data)){
				curl_setopt($curl, CURLOPT_POST, 1);
				curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
				}
				}
				curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
				$result = curl_exec($curl);
				curl_close($curl);
				return $result;
		}
	
		public function getwxurl($redirct_url = "",$scope = "snsapi_base")
		{
			$redirct_url = $redirct_url === ""?$this->redirect_rul:urlencode($redirct_url);
			$wxurl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=".$this->appid."&redirect_uri=".$redirct_url."&response_type=code&scope=".$scope."&state=STATE#wechat_redirect";
			return $wxurl;
	    }
}