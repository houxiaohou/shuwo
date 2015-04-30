<?php

namespace Home\Controller;

use Think\Controller;

require_once 'Weixin.php';
require_once 'Xcrypt.php';
require_once 'UserConst.php';
class IndexController extends Controller {
	public function index() {
		
		$weixin = new Weixin ();
		$weixin->appid = C('SHUWO_APPID');
		$weixin->appsecret=C('SHUWO_APPSECRET');
		
		$access_token = $weixin->getGlobalAccessToken();
		
$jsonmenu = '{
      "button":[
      {
                           "type": "view", 
                           "name": "树窝水果", 
                           "url": "http://www.shuwow.com"
       },
       {
           "name":"帮助中心",
           "sub_button":[
            {
               "type":"click",
               "name":"买前必读",
               "key":"introduction"
            },
            {
               "type":"click",
               "name":"配送服务",
               "key":"delivery"
            },
            {
               "type":"click",
               "name":"支付方式",
               "key":"pay"
            },
            {
               "type":"click",
               "name":"售后服务",
               "key":"service"
            },
            {
               "type":"click",
               "name":"投诉建议",
               "key":"adivce"
            }]
       }]
 }';
		
		
		$url = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=".$access_token["access_token"];
		$weixin->https_request($url,$jsonmenu,"POST");
		
// 		                $bags= M("bag");
//             	    	$current = date('Y-m-d',strtotime('+1 days'));
//             	    	$expirdate = date('Y-m-d',strtotime('+7 days'));
//             	    	$expirdate = $expirdate." 23:59:59";
//             	    	$bagitem["start"] =$current;
//             	    	$bagitem["shop_id"] = 12;
//             	    	$bagitem["type"]=1;
//             	    	$bagitem["expires"]=$expirdate;
//             	    	$bagitem["used"] = 0;
//             	    	$bagitem["amount"] = 5;
//             	    	$bagitem["user_id"]= $auid;
//             	    	$bagid = $bags->add($bagitem);
		
		$auid = 1;
		$bagid = 15;
		$user = M("user");
		$bag = M("bag");
		$userinfo = $user->where("userid=".$auid)->find();
		$baginfo = $bag->where("id=".$bagid)->find();
		if(count($userinfo)&&count($baginfo)&&!empty($userinfo[UserConst::OPENID]))
		{
			             	    			$start =  date('Y-m-d',strtotime($baginfo["start"]));
			            	    			$expire =  date('Y-m-d',strtotime($baginfo["expires"]));
			            	    			$content = '恭喜您获得'.$baginfo["amount"].'元红包，可使用日期'.$start.'到'.$expire;
		           
        
            	    	$template = array (
            	    			'touser' => 'oeRy5s_WYCNDwfjpP7rmGhNpsMHE',
            	    			'template_id' =>'NjDObh6wXHfh4scgh29gxtmao5dYu-dtGEvR2sDk_-8',
            	    			'data' => array (
            	    					'first' => array (
            	    							'value' => urlencode ($content),
            	    							'color' => "#FF0000"
            	    					),
            	    					'orderTicketStore' => array (
            	    							'value' => urlencode ( "树窝水果商城购买水果" ),
            	    							'color' => "#009900"
            	    					),
            	    					'orderTicketRule' => array (
            	    							'value' => urlencode ("外送订单即可使用红包"),
            	    							'color' => "#009900"
            	    					),
            	    					'remark' => array (
            	    							'value' => urlencode ( "\\n信息来自树窝小店" ),
            	    							'color' => "#cccccc"
            	    					)
            	    			)
            	    	);
            	    	$weixin = new Weixin ();
            	    	$token = $weixin->getusersGlobalAccessToken();
            	    	$weixin->sendtemplatemsg ( urldecode ( json_encode ( $template ) ), $token );
		}

		
// 		$appid = C ( 'SHUWO_APPID' );
// 		$appsecret = C ( 'SHUWO_APPSECRET' );
// 		$weixin = new Weixin ();
// 		$weixin->appid = $appid;
// 		$weixin->appsecret = $appsecret;
// 		$url = $weixin->getwxurl(C('SHUWO_CALLBACK'));
// 		$key = C ( "CRYPT_KEY" );
// 		$xcrpt = new Xcrypt ( $key, 'cbc', $key );
// 		if (cookie ( 'utoken' )) {
// 			$value = cookie ( 'utoken' );
//             $data = $xcrpt->decrypt ( $value, 'base64' );
// 			if ($data) {
// 				$str = explode ( "#", $data );
// 				if ($str && count ( $str ) == 3)
// 				{
// 					$userid = intval ( $str [0] );
// 					if ($userid) {
// 						$user = M ( 'user' );
// 						$sql = "userid=" . $userid;
// 						$userinfo = $user->where ( $sql )->find ();
// 						if (! count ( $userinfo )) {
// 							cookie ( 'utoken',null );
// 							$redircturl = "Location:".$url;
// 							header($redircturl);
// 							exit;
// 						}
// 						else 
// 						{
// 							$this->display ();
// 						}

// 					}
// 			    }
// 			    else {
// 			    	$redircturl = "Location:".$url;
// 			    	header($redircturl);
// 			    	exit;
// 			    }
// 			} else {
// 				$redircturl = "Location:".$url;
// 				header($redircturl);
// 				exit;
				
// 				// 测试模拟代码
// 				//$this->redirect ( "authorize" );
// 			}
// 		} else {
//     		$redircturl = "Location:".$url;
//             header($redircturl);
//             exit;
			
// 			// 测试模拟代码
// 			//$this->redirect ( "authorize" );
// 		}
	}
	public function authorize() {
		$weixin = new Weixin ();
		$appid = C ( 'SHUWO_APPID' );
		$appsecret = C ( 'SHUWO_APPSECRET' );
		$weixin->appid = $appid;
		$weixin->appsecret = $appsecret;
		$key = C ( "CRYPT_KEY" );
		$xcrpt = new Xcrypt ( $key, 'cbc', $key );		
		$code = I('get.code');
		// 测试代码
// 		$code = "testcode";
// 		$token ['openid'] = "openid";
// 		$token ['access_token'] = "access_token";
// 		$userinfo ["openid"] = "openid";
// 		$userinfo ["nickname"] = "test";
// 		$userinfo ["sex"] = "1";
// 		$userinfo ["province"] = "上海";
// 		$userinfo ["city"] = "上海";
// 		$userinfo ["country"] = "中国";
// 		$userinfo ["headimgurl"] = "http://wx.qlogo.cn/mmopen/g3MonUZtNHkdmzicIlibx6iaFqAc56vxLSUfpb6n5WKSYVY0ChQKkiaJSgQ1dZuTOgvLLrhJbERQQ4eMsv84eavHiaiceqxibJxCfHe/46";
// 		$userinfo ["unionid"] = "uninonid";
		
		if ($code) {
			$token = $weixin->getTokenWithCode ( $code );
			if ($token) {
				$openid = $token ['openid'];
				$accessToken = $token ['access_token'];
				$userinfo = $weixin->getUser($openid, $accessToken);
				if ($userinfo) {
					$useropenid = $userinfo ['openid'];
					$user = M ( 'user' );
					$sql = "openid='" . $useropenid . "'";
					$data = $user->where ( $sql )->find ();
					if (count ( $data )) {
						$userid = $data [UserConst::USERID];
						$datetime = date ( 'Ymd', strtotime ( '+14 day' ) );
						$str = $userid . "#" . $datetime . "#new";
						$xcrptstr = $xcrpt->encrypt ( $str, 'base64' );
						cookie ( 'utoken', $xcrptstr, 1209600 );
					} else {
						$data [UserConst::OPENID] = $userinfo [UserConst::OPENID];
						$data [UserConst::UNIOID] = $userinfo [UserConst::UNIOID] ? $userinfo [UserConst::UNIOID] : "";
						$data [UserConst::NICKNAME] = $userinfo [UserConst::NICKNAME];
						$data [UserConst::SEX] = $userinfo [UserConst::SEX];
						$data [UserConst::PROVINCE] = $userinfo [UserConst::PROVINCE];
						$data [UserConst::CITY] = $userinfo [UserConst::CITY];
						$data [UserConst::COUNTRY] = $userinfo [UserConst::COUNTRY];
						$data [UserConst::HEADIMGURL] = $userinfo [UserConst::HEADIMGURL];
						$data [UserConst::MOBILE] = '';
						$data [UserConst::PASSWORD] = '';
						$data [UserConst::ROLES] = 0;
						$userid = $user->add ( $data );
						$datetime = date ( 'Ymd', strtotime ( '+14 day' ) );
						$str = $userid . "#" . $datetime . "#new";
						$xcrptstr = $xcrpt->encrypt ( $str, 'base64' );
						cookie ( 'utoken', $xcrptstr, 1209600 );
					}
					$this->redirect ( "index" );
				} else {
					E ( '获得微信用户信息异常' );
				}
			} else {
				E ( '获得access_token异常' );
			}
		} else {
			E ( '获得code异常' );
		}
	}
	
	public function shop() {
	    $appid = C ( 'SHOP_APPID' );
	    $appsecret = C ( 'SHOP_APPSECRET' );
	    $weixin = new Weixin ();
	    $weixin->appid = $appid;
	    $weixin->appsecret = $appsecret;
	    $url = $weixin->getwxurl ( C('SHOP_CALLBACK') );
	    $key = C ( "CRYPT_KEY" );
	    $xcrpt = new Xcrypt ( $key, 'cbc', $key );
	    if (cookie ( 'stoken' )) {
	        $value = cookie ( 'stoken' );
	        $data = $xcrpt->decrypt ( $value, 'base64' );
	        if ($data) {
	            $str = explode ( "#", $data );
	            if ($str && count ( $str ) >= 2) {
	                $userid = intval ( $str [0] );
	                if ($userid) {
	 					    $model = M('user');
                    		$sql = "userid=".$userid." AND shopid =".$str[1]." AND openid='".trim($str[2])."' AND roles=1" ;
                    		$info = $model->where($sql)->select();
	                    if (! count ( $info )) {
	                       	cookie ( 'stoken',null );
							$redircturl = "Location:".$url;
							header($redircturl);
							exit;
	                    }
	                    else 
	                    {
	                      $this->display ();
	                    }
	                }
	            }
	            else {
	            	$redircturl = "Location:".$url;
	            	header($redircturl);
	            	exit;
	            }
	        } else {
	            $redircturl = "Location:".$url;
	            header($redircturl);
	            exit;
	
	            // 测试模拟代码
               //$this->redirect ( "shopauthorize" );
	        }
	    } else {
	        $redircturl = "Location:".$url;
	        header($redircturl);
	        exit;
	        	
	        // 测试模拟代码
	        //$this->redirect ( "shopauthorize" );
	    }
	}
	public function shopauthorize() {
	    $weixin = new Weixin ();
	    $appid = C ( 'SHOP_APPID' );
	    $appsecret = C ( 'SHOP_APPSECRET' );
	    $weixin->appid = $appid;
	    $weixin->appsecret = $appsecret;
	    $key = C ( "CRYPT_KEY" );
	    $xcrpt = new Xcrypt ( $key, 'cbc', $key );
	    $code = I('get.code');
	    // 测试代码
// 	    $code = "testcode";
// 	    $token ['openid'] = "openid";
// 	    $token ['access_token'] = "access_token";
// 	    $userinfo ["openid"] = "shopopenid";
// 	    $userinfo ["nickname"] = "testshop";
// 	    $userinfo ["sex"] = "1";
// 	    $userinfo ["province"] = "上海";
// 	    $userinfo ["city"] = "上海";
// 	    $userinfo ["country"] = "中国";
// 	    $userinfo ["headimgurl"] = "http://wx.qlogo.cn/mmopen/g3MonUZtNHkdmzicIlibx6iaFqAc56vxLSUfpb6n5WKSYVY0ChQKkiaJSgQ1dZuTOgvLLrhJbERQQ4eMsv84eavHiaiceqxibJxCfHe/46";
// 	    $userinfo ["unionid"] = "shopuninonid";
	
	    if ($code) {
	        $token = $weixin->getTokenWithCode ( $code );
	        	
	        if ($token) {
	            $openid = $token ['openid'];
	            $accessToken = $token ['access_token'];
	            if (isset($openid)) {
	                $user = M ( 'user' );
	                $sql = "openid='" . $openid . "'";
	                $data = $user->where ( $sql )->find ();
	                if (count ( $data )) {
                        $userid = $data [UserConst::USERID];
	                    $shopid = $data [UserConst::SHOPID];
	                    $str = $userid . "#" . $shopid."#".$openid;
	                    $xcrptstr = $xcrpt->encrypt ( $str, 'base64' );
	                    cookie ( 'stoken', $xcrptstr, 1209600 );
	                    $this->redirect ( "shop" );
	                } else {
	                	E("未授权商户信息");
	                }
	            } else {
	                E ( '获得微信用户信息异常' );
	            }
	        } else {
	            E ( '获得access_token异常' );
	        }
	    } else {
	        E ( '获得code异常' );
	    }
	}
	public function admin(){
	    $this->display();
	}
	
	private function curl_request_async($url, $params, $type = 'POST')
	{
		foreach ($params as $key => &$val) {
			if (is_array($val))
				$val = implode(',', $val);
			$post_params [] = $key . '=' . urlencode($val);
		}
		$post_string = implode('&', $post_params);
	
		$parts = parse_url($url);
	
		$fp = fsockopen($parts ['host'], isset ($parts ['port']) ? $parts ['port'] : 80, $errno, $errstr, 30);
	
		// Data goes in the path for a GET request
		if ('GET' == $type)
			$parts ['path'] .= '?' . $post_string;
	
		$out = "$type " . $parts ['path'] . " HTTP/1.1\r\n";
		$out .= "Host: " . $parts ['host'] . "\r\n";
		$out .= "Content-Type: application/x-www-form-urlencoded\r\n";
		$out .= "Content-Length: " . strlen($post_string) . "\r\n";
		$out .= "Connection: Close\r\n\r\n";
		// Data goes in the request body for a POST request
		if ('POST' == $type && isset ($post_string))
			$out .= $post_string;
	
		fwrite($fp, $out);
		fclose($fp);
	}
}


