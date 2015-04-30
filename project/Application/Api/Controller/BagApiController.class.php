<?php
namespace Api\Controller;

use Think\Controller\RestController;

require_once 'BagConst.php';
require_once 'Authorize.php';
require_once 'UserConst.php';
require_once 'OrderConst.php';

class BagApiController extends RestController
{

    /**
     * admin列出所有红包
     */
    public function listAllBagsByAdmin()
    {
        $authorize = new Authorize ();
        $isAdmin = $authorize->Filter('admin');
        if (!$isAdmin) {
            $message ["msg"] = "Unauthorized";
            $this->response($message, 'json', '401');
            return;
        }

        $start = intval(I('get.start', 0));
        $count = intval(I('get.count', 10));
        // 查询全部
        $sql = 'select user_id, count(user_id) as count from bag group by user_id order by count desc limit ' . $start . ', ' . $count;
        $dao = M();
        $users = [];
        $userInfo = $dao->query($sql);
        if ($userInfo) {
            for ($i = 0; $i < count($userInfo); $i++) {
                array_push($users, $this->bagUser($userInfo[$i]['user_id']));
            }
        }
        $this->response($users, 'json');
    }

    /**
     * 用户id获取用户信息
     * @param $userId
     * @return mixed
     */
    private function bagUser($userId)
    {
        $userDao = M('user');
        $user = $userDao->where('userid=' . $userId)->find();
        $d['bag_num'] = $this->countUserBagNum($userId);
        $d['used_num'] = $this->countUserUsedBagNum($userId);
        $d['available_num'] = $this->countUserAvailableBagNum($userId);
        $d[UserConst::USERID] = $user[UserConst::USERID];
        $d[UserConst::NICKNAME] = $user[UserConst::NICKNAME];
        $d[UserConst::HEADIMGURL] = $user[UserConst::HEADIMGURL];
        return $d;
    }

    /**
     * 用户红包总数
     * @param $userId
     * @return mixed
     */
    private function countUserBagNum($userId)
    {
        $sql = 'select count(*) as count from bag where user_id = ' . $userId;
        $dao = M();
        $data = $dao->query($sql);
        return $data[0]['count'];
    }

    /**
     * 用户使用过的红包数
     * @param $userId
     * @return mixed
     */
    private function countUserUsedBagNum($userId)
    {
        $sql = 'select count(*) as count from bag where used = 1 and user_id = ' . $userId;
        $dao = M();
        $data = $dao->query($sql);
        return $data[0]['count'];
    }

    /**
     * 用户可用红包数
     * @param $userId
     * @return mixed
     */
    private function countUserAvailableBagNum($userId)
    {
        $sql = 'select count(*) as count from bag where used = 0 and to_days(expires) >= to_days(now()) and user_id = ' . $userId;
        $dao = M();
        $data = $dao->query($sql);
        return $data[0]['count'];
    }

    /**
     * 根据条件列出用户所有可用红包
     */
    public function listUserAvailableBags()
    {
        $get = "get.";
        $authorize = new Authorize ();
        $userId = $authorize->Filter('user');
        if (!intval($userId)) {
            $message ["msg"] = "Unauthorized";
            $this->response($message, 'json', '401');
            return;
        }

        $currenttime = date('Y-m-d');
        $bagDao = M('bag');
        $type = intval(I($get . BagConst::TYPE, 0)); // 1 - 外送，2 - 自提

        if ($type != 0) {
            $data = $bagDao->where("(type = " . $type . " and date(expires) >='" . $currenttime . "' and date(start)<='" . $currenttime . "' and user_id =" . $userId . " and used=0) or (used=0 and isever =1)")->order('expires')->select();
        } else {
            $data = $bagDao->where("(date(expires) >='" . $currenttime . "' and date(start)<='" . $currenttime . "' and user_id =" . $userId . " and used=0) or (used=0 and isever=1)")->order('expires')->select();
        }
        if (!count($data)) {
            $data = [];
        } else {
            for ($i = 0; $i < count($data); $i++) {
                $data[$i]['expired'] = 0;
            }
        }
        $this->response($data, 'json');

    }

    /**
     * 根据手机号码获取用户红包列表
     */
    public function queryBagsByPhone()
    {
        $authorize = new Authorize ();
        $isAdmin = $authorize->Filter('admin');
        if (!$isAdmin) {
            $message ["msg"] = "Unauthorized";
            $this->response($message, 'json', '401');
            return;
        }
        $phone = I('post.phone');
        $orderDao = M('orders');
        $where['phone'] = $phone;

        $userIds = [];
        $orders = $orderDao->where($where)->select();
        for ($i = 0; $i < count($orders); $i++) {
            $order = $orders[$i];
            if (!in_array($order[OrderConst::USERID], $userIds)) {
                array_push($userIds, $order[OrderConst::USERID]);
            }
        }
        $results = [];
        for ($j = 0; $j < count($userIds); $j++) {
            array_push($results, $this->bagUser($userIds[$j]));
        }
        $this->response($results, 'json');
    }

    /**
     * 列出用户过期的红包
     */
    public function listUserExpiredBags()
    {
        $get = "get.";
        $authorize = new Authorize ();
        $userId = $authorize->Filter("user");
        if (!intval($userId)) {
            $message ["msg"] = "Unauthorized";
            $this->response($message, 'json', '401');
            return;
        }
        $currenttime = date('Y-m-d');
        $bagDao = M('bag');
        $data = $bagDao->where("date(expires) <'" . $currenttime . "' and user_id =" . $userId)->order('expires desc')->select();
        if (!count($data)) {
            $data = [];
        }
        $this->response($data, 'json');
    }

    /**
     * 获取红包信息
     * @param $bag
     * @return mixed
     */
    private function bagInfo($bag)
    {
        $userDao = M('user');
        $user = $userDao->where('userid=' . $bag['user_id'])->find();
        $d[BagConst::USER_ID] = $user[UserConst::USERID];
        $d[UserConst::NICKNAME] = $user[UserConst::NICKNAME];
        $d[UserConst::HEADIMGURL] = $user[UserConst::HEADIMGURL];
        $d[UserConst::BLOCK] = $user[UserConst::BLOCK];

        $d[BagConst::ID] = $bag[BagConst::ID];
        $d[BagConst::USED] = $bag[BagConst::USED];
        $d[BagConst::AMOUNT] = $bag[BagConst::AMOUNT];
        $d[BagConst::EXPIRES] = $bag[BagConst::EXPIRES];
        $d[BagConst::TYPE] = $bag[BagConst::TYPE];
        $d[BagConst::START] = $bag[BagConst::START];

        return $d;
    }

    /**
     * 根据使用情况列出用户使用过的红包
     */
    public function listUserUsedBags()
    {
        $authorize = new Authorize ();
        $userId = $authorize->Filter("user");
        if (!intval($userId)) {
            $message ["msg"] = "Unauthorized";
            $this->response($message, 'json', '401');
            return;
        }
        $currenttime = date('Y-m-d');
        $bagDao = M('bag');
        $data = $bagDao->where("(date(expires) <'" . $currenttime . "' or used = 1) and user_id =" . $userId)->order('expires desc')->select();
        if (!count($data)) {
            $data = [];
        } else {
            for ($i = 0; $i < count($data); $i++) {
                if ($data[$i]['expires'] < $currenttime) {
                    // 过期的
                    $data[$i]['expired'] = 1;
                } else {
                    $data[$i]['expired'] = 0;
                }
            }
        }
        $this->response($data, 'json');
    }

    //
    public function searchexpiringbags()
    {
        $get = "get.";
        $count = I("get.num", 0);
        $authorize = new Authorize ();
        $auid = $authorize->Filter('admin');
        if ($auid) {
            $current = date("Y-m-d", strtotime("-1 day"));
            $bags = M("bag");
            $temgdata = $bags->where()->select();
        }

    }
    

    public function sendbagtouser() {
    	$post = "post.";
    	$authorize = new Authorize ();
    	$auid = $authorize->Filter ( "admin" );
    	if (true) {
    		$bag = M ( "bag" );
    		$userid = I ( "post.userids" );
    		$userids = explode ( ".", $userid );
    		for($i = 0; $i < count ( $userids ); $i ++) {
    			$current = date ( 'Y-m-d' );
    			$expirdate = date ( 'Y-m-d', strtotime ( '+6 days' ) );
    			$expirdate = $expirdate . " 23:59:59";
    			$bagitem [BagConst::START] = $current;
    			$bagitem [BagConst::SHOP_ID] = 0;
    			$bagitem [BagConst::TYPE] = 1;
    			$bagitem [BagConst::EXPIRES] = $expirdate;
    			$bagitem [BagConst::USED] = 0;
    			$bagitem [BagConst::AMOUNT] = 5;
    			$bagitem [BagConst::USER_ID] = $userids[$i];
    			$bagitem [BagConst::ISEVER] = 0;
    			$bagitem [BagConst::ISOUT] = 0;
    			if ($bag->add ( $bagitem ) === false) {
    				$this->response("error",json);
    			}
    		}
    		$this->response("success",json);
    	} else {
    		$message ["msg"] = "Unauthorized";
    		$this->response ( $message, 'json', '401' );
    		return;
    	}
    }

}