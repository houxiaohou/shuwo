<?php

namespace Api\Controller;

use Think\Controller\RestController;

require_once 'UserConst.php';
require_once 'OrderConst.php';
require_once 'Authorize.php';

class UserApiController extends RestController
{

    public function allUsers()
    {
        // 根据所有用户列出订单数量
        $authorize = new Authorize ();
        $isAdmin = $authorize->Filter("admin");
        if (!$isAdmin) {
            $message ["msg"] = "Unauthorized";
            $this->response($message, 'json', '401');
            return;
        }
        $start = intval(I('get.start', 0));
        $count = intval(I('get.count', 5));
        $days = intval(I('get.days', -1)); // $days天前开始

        if ($days == -1) {
            // 查询全部
            $sql = 'select userid, count(userid) as count from orders group by userid order by count desc limit ' . $start . ', ' . $count;
        } else {
            $sql = 'select userid, count(userid) as count from orders where to_days(createdtime) >= to_days(now()) - ' . $days . ' group by userid order by count desc limit ' . $start . ', ' . $count;
        }

        $dao = M();
        $userDao = M('user');

        $users = [];
        $userInfo = $dao->query($sql);
        if ($userInfo) {
            for ($i = 0; $i < count($userInfo); $i++) {
                $user = $userDao->where('userid=' . $userInfo[$i]['userid'])->find();
                $d['order_num'] = $userInfo[$i]['count'];
                $d[UserConst::USERID] = $user[UserConst::USERID];
                $d[UserConst::CREATEDTIME] = $user[UserConst::CREATEDTIME];
                $d[UserConst::NICKNAME] = $user[UserConst::NICKNAME];
                $d[UserConst::HEADIMGURL] = $user[UserConst::HEADIMGURL];
                $d[UserConst::COUNTRY] = $user[UserConst::COUNTRY];
                $d[UserConst::PROVINCE] = $user[UserConst::PROVINCE];
                $d[UserConst::CITY] = $user[UserConst::CITY];
                array_push($users, $d);
            }
        }
        $this->response($users, 'json');
    }

    public function userOrders()
    {
        // 根据某个用户的所有订单
        $authorize = new Authorize ();
        $isAdmin = $authorize->Filter("admin");
        if (!$isAdmin) {
            $message ["msg"] = "Unauthorized";
            $this->response($message, 'json', '401');
            return;
        }
        $userid = intval(I('get.userid'));
        $where [OrderConst::USERID] = $userid;

        $orderDao = M('orders');
        $orders = $orderDao->where($where)->order('-createdtime')->select();

        $userDao = M('user');
        $user = $userDao->where('userid=' . $userid)->find();

        $data['orders'] = $orders;
        $data['user'] = $user;
        $this->response($data, 'json');
    }


}