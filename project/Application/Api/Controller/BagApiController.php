<?php
namespace Api\Controller;

use Think\Controller\RestController;

class BagApiController extends RestController
{

    /**
     * 根据条件列出用户所有可用红包
     */
    public function listUserAvailableBags()
    {

        $authorize = new Authorize ();
        $userId = $authorize->Filter("user");
        if (!intval($userId)) {
            $message ["msg"] = "Unauthorized";
            $this->response($message, 'json', '401');
            return;
        }

        $bagDao = M('bag');
        $type = I('get.type'); // 1 - 外送，2 - 自提

        // TODO 根据条件查询，列出可用的红包

    }

    /**
     * 列出用户已使用的红包
     */
    public function listUserExpiredBags()
    {

    }

    /**
     * 根据使用情况列出用户红包
     */
    public function listUserBagsByUsedOrNot()
    {

    }

}