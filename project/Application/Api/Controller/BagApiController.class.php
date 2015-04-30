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

        $bagDao = M('bag');
        $start = I('get.start', 0);
        $count = I('get.count', 10);
        $condition = intval(I('get.condition', 0));
        $where = [];
        if ($condition == 1) {
            // 未使用
            $where[BagConst::USED] = 0;
        } elseif ($condition == 2) {
            // 已使用
            $where[BagConst::USED] = 1;
        }
        if (count($where) > 0) {
            $data = $bagDao->where($where)->order('id desc')->limit($start, $count)->select();
        } else {
            $data = $bagDao->where('id>0')->order('id desc')->limit($start, $count)->select();
        }
        $results = [];
        if (count($data)) {
            for ($i = 0; $i < count($data); $i++) {
                array_push($results, $this->bagInfo($data[$i]));
            }
        }
        $this->response($results, 'json');
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
        $bagWhere['user_id'] = array('in', $userIds);
        $data = M('bag')->where($bagWhere)->order('id desc')->select();
        $results = [];
        if (count($data)) {
            for ($j = 0; $j < count($userIds); $j++) {
                array_push($results, $this->bagInfo($data[$j]));
            }
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

}