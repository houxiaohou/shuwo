<?php
namespace Home\Controller;

define ( "TOKEN", "shuwoweixin" );

require_once 'Weixin.php';
require_once 'UserConst.php';
require_once 'BDConst.php';
require_once 'BagConst.php';
class shuwowechatcallback {
	public function valid() {
		$echoStr = $_GET ["echostr"];
		$signature = $_GET ["signature"];
		$timestamp = $_GET ["timestamp"];
		$nonce = $_GET ["nonce"];
		$token = TOKEN;
		$tmpArr = array (
				$token,
				$timestamp,
				$nonce
		);
		sort ( $tmpArr );
		$tmpStr = implode ( $tmpArr );
		$tmpStr = sha1 ( $tmpStr );
		if ($tmpStr == $signature) {
			echo $echoStr;
			exit ();
		}
	}

	// 响应消息
	public function responseMsg() {
		$postStr = $GLOBALS ["HTTP_RAW_POST_DATA"];
		if (! empty ( $postStr )) {
			$postObj = simplexml_load_string ( $postStr, 'SimpleXMLElement', LIBXML_NOCDATA );
			$RX_TYPE = trim ( $postObj->MsgType );

			// 消息类型分离
			switch ($RX_TYPE) {
				case "event" :
					$result = $this->receiveEvent ( $postObj );
					break;
				case "text" :
					$result = $this->receiveText ( $postObj );
					break;
				default :
					$result = "unknown msg type: " . $RX_TYPE;
					break;
			}
			echo $result;
		} else {
			echo "";
			exit ();
		}
	}

	// 接收事件消息
	private function receiveEvent($object) {
		$content = "";
		switch ($object->Event) {
			case "subscribe" :
				$content = "欢迎关注树窝水果 ";
				$openid = trim($object->FromUserName);
				if(!empty($openid))
				{
				    $user = M("user");
				    $userinfo = $user->where("openid='".$openid."'")->select();
				    if(!count($userinfo))
				    {
				    	    $weixin = new Weixin();
				    	    $token = $weixin->getusersGlobalAccessToken();
				    	    $userdata = $weixin->getinfobyglobaltoken($openid, $token);
				    	    if(count($userdata))
				    	    {
				    	    	$data [UserConst::OPENID] = $userdata [UserConst::OPENID];
				    	    	$data [UserConst::UNIOID] = $userdata [UserConst::UNIOID] ? $userinfo [UserConst::UNIOID] : "";
				    	    	$data [UserConst::NICKNAME] = $userdata [UserConst::NICKNAME];
				    	    	$data [UserConst::SEX] = $userdata [UserConst::SEX];
				    	    	$data [UserConst::PROVINCE] = $userdata [UserConst::PROVINCE];
				    	    	$data [UserConst::CITY] = $userdata [UserConst::CITY];
				    	    	$data [UserConst::COUNTRY] = $userdata [UserConst::COUNTRY];
				    	    	$data [UserConst::HEADIMGURL] = $userdata [UserConst::HEADIMGURL];
				    	    	$data [UserConst::MOBILE] = '';
				    	    	$data [UserConst::PASSWORD] = '';
				    	    	$data [UserConst::ROLES] = 0;
				    	    	$userid = $user->add ( $data );
				    	    	if($userid)
				    	    	{
				    	    		$bags = M("bag");
				    	    		$current = date('Y-m-d',strtotime('+1 days'));
				    	    		$expirdate = date('Y-m-d',strtotime('+7 days'));
				    	    		$expirdate = $expirdate." 23:59:59";
				    	    		$bagitem[BagConst::START] =$current;
				    	    		$bagitem[BagConst::SHOP_ID] = 0;
				    	    		$bagitem[BagConst::TYPE]=1;
				    	    		$bagitem[BagConst::EXPIRES]=$expirdate;
				    	    		$bagitem[BagConst::USED] = 0;
				    	    		$bagitem[BagConst::AMOUNT] = 10;
				    	    		$bagitem[BagConst::USER_ID]= 0;
				    	    		$bagitem[BagConst::ISEVER] = 1;
				    	    		$bagitem[BagConst::ISOUT]=1;
				    	    		$bagid = $bags->add($bagitem);
	                                if($bagid)
	                                {
	                                	$content.="-您已获得红包:".$bagitem[BagConst::AMOUNT].'元,可永久使用';
	                                }
				    	    	}
				    	    }
				    }
				}
				
				break;
			case "unsubscribe" :
				$content = "取消关注";
				break;
				// case "SCAN":
				// $content = "扫描场景 ".$object->EventKey;
				// break;
			case "CLICK" :
				switch ($object->EventKey) {
					case "introduction" :
						$content = "1.树窝水果合作的店铺，是基于您所在位置，挑选您身边优质的水果店铺，以和店内相同的价格免费配送 
								    2.您在下单后，水果店会根据您的订单迅速称重，并将详细的重量及价格反馈给您 
								    3.水果送达后，如果有品质较差的水果，您可以挑出后再称重付款 
								    4.请务必填写正确的电话号码和详细的送货地址（例如：银翔路515弄705室），方便送水果人员及时送达 
								    5.首次购买立减10元，后续的优惠方式以水果店公告为准，送货员会在收款时直接减去优惠的价格";
						break;
					case "delivery" :
							$content = "配送条件 1.每单起送价以每个水果店内公告为准 
									    2.订单达到起送价后，树窝水果平台上所有商品都免费配送 
									            配送时间 1.水果店营业时间为8:00-22:00，具体时间以水果店内公告为准 
									    2.下单成功后，送水果人员会在您选择的送货时间内快速送达";
							break;
							case "pay" :
								$content = "1.货到付款，当面验水果，若有品质较差的水果可以拒收 
										2.网上支付方式会在不久后开放使用 （新用户首次购买减十元活动，送水果人员会在收款时直接减去十元）";
								break;
								case "service" :
									$content = "1.水果当面检查验收，不满意的水果可以让送果园退回，并减去相应价格
											    2.若送水果人员不予配合，可致电树窝水果客服进行投诉，我们会认真对待您的投诉与建议";
									break;
									case "advice" :
										$content = "若在下单后 1.水果店未能及时确认订单或长时间未送达 2.水果有任何品质问题 （任何造成您不满意的问题，您都可以通过以下方式投诉，我们会及时处理您的问题） 投诉方式： 1.可直接在本公众账号下留言，客服收到消息后会答复您 2.您还可以直接拨打树窝客服热线：021-31277422 （希望您给树窝提出您宝贵的建议，帮助树窝更好得服务于您，采用的意见我们会送出代金券做奖励";
										break;
					default :
						$content = "点击菜单：" . $object->EventKey;
						break;
				}
				break;
			case "VIEW" :
				$content = "跳转链接 " . $object->EventKey;
				break;
			default :
				$content = "receive a new event: " . $object->Event;
				break;
		}
		$result = $this->transmitText ( $object, $content );
		return $result;
	}

	// 接收文本消息
	private function receiveText($object) {
		$keyword = trim ( $object->Content );
		$content = $keyword;
		$result = $this->transmitText ( $object, $content );

		return $result;
	}
	// 回复文本消息
	private function transmitText($object, $content) {
		$xmlTpl = "<xml>
<ToUserName><![CDATA[%s]]></ToUserName>
<FromUserName><![CDATA[%s]]></FromUserName>
<CreateTime>%s</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[%s]]></Content>
</xml>";
		$result = sprintf ( $xmlTpl, $object->FromUserName, $object->ToUserName, time (), $content );
		return $result;
	}

	// 回复图片消息
	private function transmitImage($object, $imageArray) {
		$itemTpl = "<Image>
    <MediaId><![CDATA[%s]]></MediaId>
</Image>";

		$item_str = sprintf ( $itemTpl, $imageArray ['MediaId'] );

		$xmlTpl = "<xml>
		<ToUserName><![CDATA[%s]]></ToUserName>
		<FromUserName><![CDATA[%s]]></FromUserName>
		<CreateTime>%s</CreateTime>
		<MsgType><![CDATA[image]]></MsgType>
		$item_str
		</xml>";

		$result = sprintf ( $xmlTpl, $object->FromUserName, $object->ToUserName, time () );
		return $result;
	}

	// 回复语音消息
	private function transmitVoice($object, $voiceArray) {
		$itemTpl = "<Voice>
		<MediaId><![CDATA[%s]]></MediaId>
</Voice>";

		$item_str = sprintf ( $itemTpl, $voiceArray ['MediaId'] );

		$xmlTpl = "<xml>
		<ToUserName><![CDATA[%s]]></ToUserName>
		<FromUserName><![CDATA[%s]]></FromUserName>
		<CreateTime>%s</CreateTime>
		<MsgType><![CDATA[voice]]></MsgType>
		$item_str
		</xml>";

		$result = sprintf ( $xmlTpl, $object->FromUserName, $object->ToUserName, time () );
		return $result;
	}

	// 回复视频消息
	private function transmitVideo($object, $videoArray) {
		$itemTpl = "<Video>
	<MediaId><![CDATA[%s]]></MediaId>
    <ThumbMediaId><![CDATA[%s]]></ThumbMediaId>
    <Title><![CDATA[%s]]></Title>
    <Description><![CDATA[%s]]></Description>
</Video>";

		$item_str = sprintf ( $itemTpl, $videoArray ['MediaId'], $videoArray ['ThumbMediaId'], $videoArray ['Title'], $videoArray ['Description'] );

		$xmlTpl = "<xml>
		<ToUserName><![CDATA[%s]]></ToUserName>
		<FromUserName><![CDATA[%s]]></FromUserName>
		<CreateTime>%s</CreateTime>
		<MsgType><![CDATA[video]]></MsgType>
		$item_str
		</xml>";

		$result = sprintf ( $xmlTpl, $object->FromUserName, $object->ToUserName, time () );
		return $result;
	}

	// 回复图文消息
	private function transmitNews($object, $newsArray) {
		if (! is_array ( $newsArray )) {
			return;
		}
		$itemTpl = "    <item>
	<Title><![CDATA[%s]]></Title>
	<Description><![CDATA[%s]]></Description>
        <PicUrl><![CDATA[%s]]></PicUrl>
        <Url><![CDATA[%s]]></Url>
    </item>
";
		$item_str = "";
		foreach ( $newsArray as $item ) {
			$item_str .= sprintf ( $itemTpl, $item ['Title'], $item ['Description'], $item ['PicUrl'], $item ['Url'] );
		}
		$xmlTpl = "<xml>
		<ToUserName><![CDATA[%s]]></ToUserName>
		<FromUserName><![CDATA[%s]]></FromUserName>
		<CreateTime>%s</CreateTime>
		<MsgType><![CDATA[news]]></MsgType>
		<ArticleCount>%s</ArticleCount>
		<Articles>
		$item_str</Articles>
		</xml>";

		$result = sprintf ( $xmlTpl, $object->FromUserName, $object->ToUserName, time (), count ( $newsArray ) );
		return $result;
}

// 回复音乐消息
private function transmitMusic($object, $musicArray) {
	$itemTpl = "<Music>
	<Title><![CDATA[%s]]></Title>
	<Description><![CDATA[%s]]></Description>
	<MusicUrl><![CDATA[%s]]></MusicUrl>
	<HQMusicUrl><![CDATA[%s]]></HQMusicUrl>
</Music>";

	$item_str = sprintf ( $itemTpl, $musicArray ['Title'], $musicArray ['Description'], $musicArray ['MusicUrl'], $musicArray ['HQMusicUrl'] );

	$xmlTpl = "<xml>
	<ToUserName><![CDATA[%s]]></ToUserName>
	<FromUserName><![CDATA[%s]]></FromUserName>
	<CreateTime>%s</CreateTime>
	<MsgType><![CDATA[music]]></MsgType>
	$item_str
	</xml>";

	$result = sprintf ( $xmlTpl, $object->FromUserName, $object->ToUserName, time () );
	return $result;
}

// 回复多客服消息
private function transmitService($object) {
	$xmlTpl = "<xml>
	<ToUserName><![CDATA[%s]]></ToUserName>
			<FromUserName><![CDATA[%s]]></FromUserName>
			<CreateTime>%s</CreateTime>
			<MsgType><![CDATA[transfer_customer_service]]></MsgType>
</xml>";
	$result = sprintf ( $xmlTpl, $object->FromUserName, $object->ToUserName, time () );
	return $result;
}
}