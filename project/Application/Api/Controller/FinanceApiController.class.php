<?php
namespace Api\Controller;

use Think\Controller\RestController;

require_once 'BagConst.php';
require_once 'Authorize.php';
require_once 'UserConst.php';
require_once 'ShopConst.php';
require_once 'OrderConst.php';

class FinanceApiController extends RestController
{

    public function shopFinance()
    {
        $authorize = new Authorize ();
        $isAdmin = $authorize->Filter('admin');
        if (!$isAdmin) {
            $message ["msg"] = "Unauthorized";
            $this->response($message, 'json', '401');
            return;
        }

        $date = intval(I('get.date'));

        $date = date('Y-m-d', $date / 1000);

        $shops = M('shop')->order('shopid desc')->select();

        $results = [];
        for ($i = 0; $i < count($shops); $i++) {
            $shopid = $shops[$i][ShopConst::SHOPID];

            $d['id'] = $shopid;
            $d['shop_name'] = $shops[$i]['spn'];
            $d['contact'] = $shops[$i]['contacts'];

            // 总订单数，总补贴金额
            $sql = 'select count(*) as total, COALESCE(sum(discount),0) as discount from orders where shopid = ' . $shopid . ' and orderstatus = 3 and to_days(createdtime) = to_days("' . $date . '")';
            $data = M('orders')->query($sql);
            $d['total_num'] = $data[0]['total'];
            $d['discount'] = $data[0]['discount'];

            // 红包补贴数目
            $sql = 'select count(*) as total from orders where shopid = ' . $shopid . ' and orderstatus = 3 and to_days(createdtime) = to_days("' . $date . '") and bag_id > 0';
            $data = M('orders')->query($sql);
            $d['discount_num'] = $data[0]['total'];

            // 外送单数
            $sql = 'select count(*) as total from orders where shopid = ' . $shopid . ' and orderstatus = 3 and to_days(createdtime) = to_days("' . $date . '") and ispickup = 0';
            $data = M('orders')->query($sql);
            $d['pickup_num'] = $data[0]['total'];

            array_push($results, $d);
        }
        $this->response($results, 'json');
    }

}