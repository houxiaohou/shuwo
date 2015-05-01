<?php

namespace Api\Controller;

use Think\Controller\RestController;

require_once 'OrderConst.php';
require_once 'BDConst.php';
require_once 'ProductConst.php';
require_once 'OrderProductConst.php';
require_once 'ShippingaddressConst.php';
require_once 'Authorize.php';
require_once 'Weixin.php';
require_once 'ShopConst.php';
require_once 'BagConst.php';
require_once 'UserConst.php';

class OrderApiController extends RestController
{
    /*
     * 查询所有的订单
     */
    public function getallorder()
    {
        $authorize = new Authorize ();
        $isAdmin = $authorize->Filter("admin");
        if ($isAdmin) {
            $order = M("orders");
            $start = I('get.start', 0);
            $count = I('get.count', 5);

            $orderdata = $order->order('-createdtime')->limit($start, $count)->select();
            $data = $this->orderdetail($orderdata, $count);
            $this->response($data, 'json');
        } else {
            $message ["msg"] = "Unauthorized";
            $this->response($message, 'json', '401');
        }
    }

    /*
     * 根据GET传的id查询对应的订单
     */
    public function getorderbyid()
    {
        $order = M('orders');
        $product = M('product');
        $orderproduct = M('orderproduct');

        $id = I('get.id', 0);
        $where [OrderConst::ORDERID] = $id;
        $orderdata = $order->where($where)->find();

        $authorize = new Authorize ();
        $isAdmin = $authorize->Filter("admin");
        if (!$isAdmin) {
            $shopId = $authorize->Filter("shop");
            if ($shopId != $orderdata [OrderConst::SHOPID]) {
                $userId = $authorize->Filter("user");
                if ($userId != $orderdata [OrderConst::USERID]) {
                    $message ["msg"] = "Unauthorized";
                    $this->response($message, 'json', '401');
                }
            }
        }

        $authorize = new Authorize ();
        $isAdmin = $authorize->Filter("admin");
        if (!$isAdmin) {
            $shopId = $authorize->Filter("shop");
            if ($shopId != $orderdata [OrderConst::SHOPID]) {
                $userId = $authorize->Filter("user");
                if ($userId != $orderdata [OrderConst::USERID]) {
                    $message ["msg"] = "Unauthorized";
                    $this->response($message, 'json', '401');
                }
            }
        }

        if ($id) {
            if ($orderdata != null) {
                $data [OrderConst::ORDERID] = $orderdata [OrderConst::ORDERID];
                $data [OrderConst::CREATEDTIME] = $orderdata [OrderConst::CREATEDTIME];
                $data [OrderConst::ORDERSTATUS] = $orderdata [OrderConst::ORDERSTATUS];
                $data [OrderConst::USERNAME] = $orderdata [OrderConst::USERNAME];
                $data [OrderConst::ADDRESS] = $orderdata [OrderConst::ADDRESS];
                $data [OrderConst::PHONE] = $orderdata [OrderConst::PHONE];
                $data [OrderConst::NOTES] = $orderdata [OrderConst::NOTES];
                $data [OrderConst::SHOPID] = $orderdata [OrderConst::SHOPID];
                $data [OrderConst::DLTIME] = $orderdata [OrderConst::DLTIME];
                $data [OrderConst::ISFIRST] = $orderdata [OrderConst::ISFIRST];
                $data [OrderConst::DISCOUNT] = $orderdata [OrderConst::DISCOUNT];
                $data [OrderConst::DISTANCE] = $orderdata [OrderConst::DISTANCE];
                $data [OrderConst::ISPICKUP] = $orderdata [OrderConst::ISPICKUP];
                $data [OrderConst::ISDELIVERY] = $orderdata [OrderConst::ISDELIVERY];

                if ($orderdata [OrderConst::RTOTALPRICE] >= 0 && $data [OrderConst::ORDERSTATUS] == 1) {
                    $data ['price'] = $orderdata [OrderConst::RTOTALPRICE];
                } else {
                    $data ['price'] = $orderdata [OrderConst::TOTALPRICE];
                }

                if ($orderdata [OrderConst::RTOTALPRICEBEFORE] >= 0 && $orderdata [OrderConst::ORDERSTATUS] == 1) {
                    $data ['beforeprice'] = $orderdata [OrderConst::RTOTALPRICEBEFORE];
                } else {
                    $data ['beforeprice'] = $orderdata [OrderConst::TOTALPRICEBEFORE];
                }
                $where_order_product [OrderProductConst::ORDERID] = $orderdata [OrderConst::ORDERID];
                $orderproductdata = $orderproduct->where($where_order_product)->field('id,productid,quantity,realweight,realprice')->select();
                $count_order_product = count($orderproductdata);
                for ($j = 0; $j < $count_order_product; $j++) {
                    $data_order_product [$j] ['orderproductid'] = $orderproductdata [$j] [OrderProductConst::ID];
                    $data_order_product [$j] ['quantity'] = $orderproductdata [$j] [OrderProductConst::QUANTITY];
                    $data_order_product [$j] ['realprice'] = $orderproductdata [$j] [OrderProductConst::REALPRICE];
                    $data_order_product [$j] ['realweight'] = $orderproductdata [$j] [OrderProductConst::REALWEIGHT];
                    $where_product [ProductConst::PRODUCTID] = $orderproductdata [$j] [OrderProductConst::PRODUCTID];
                    $productdata = $product->where($where_product)->field('productname,unit,attribute,unitweight')->find();
                    $data_order_product [$j] ['productname'] = $productdata ['productname'];
                    $data_order_product [$j] ['unit'] = $productdata ['unit'];
                    $data_order_product [$j] ['attribute'] = $productdata ['attribute'];
                    $data_order_product [$j] ['unitweight'] = $productdata ['unitweight'];
                }
                $data ['productdetail'] = $data_order_product;
            } else {
                $data = [];
            }
        } else {
            $data = [];
        }
        $this->response($data, 'json');
    }

    /**
     * 修改订单的配送方式，仅限管理员
     */
    public function deliveryorder()
    {
        $authorize = new Authorize ();
        $isAdmin = $authorize->Filter("admin");
        if (!$isAdmin) {
            $message ["msg"] = "Unauthorized";
            $this->response($message, 'json', '401');
        }
        $poststr = "post.";
        $orderid = I($poststr . OrderConst::ORDERID);
        $address = I($poststr . OrderConst::ADDRESS);
        $ispickup = I($poststr . OrderConst::ISPICKUP);
        $order = M('orders');
        if (intval($ispickup) == 1) {
            // 到店自提
            $result = $order->where("orderid = '" . $orderid . "'")->setField(OrderConst::ISPICKUP, 1);
        } else {
            // 送货到地址
            $result = $order->where("orderid = '" . $orderid . "'")->setField(OrderConst::ADDRESS, $address);
        }
        $result = $order->where("orderid = '" . $orderid . "'")->setField(OrderConst::ISDELIVERY, 0);
        $data['success'] = $result;
        $data['orderid'] = $orderid;
        $this->response($data, 'json');
    }

    /*
     * 获取当前用户的订单
     */
    public function getordersbyuser()
    {
        $authorize = new Authorize ();
        $userid = $authorize->Filter("user");
        if ($userid) {
            $status = I('get.status', -1);
            $start = I('get.start', 0);
            $count = I('get.count', 5);
            $order = M('orders');

            $where [OrderConst::USERID] = $userid;
            if (intval($start) > -1) {
                switch (intval($status)) {
                    case 0 :
                    case 1 :
                    case 2 :
                        $where [OrderConst::ORDERSTATUS] = $status;
                        break;
                    default :
                        break;
                }
            }

            $orderdata = $order->where($where)->order('-createdtime')->limit($start, $count)->select();
            $data = [];
            if ($orderdata && count($orderdata) > 0) {
                $data = $this->orderdetail($orderdata, $count);
            }
            $this->response($data, 'json');
        } else {
            $message ["msg"] = "Unauthorized";
            $this->response($message, 'json', '401');
        }
    }

    /*
     * 获取当前店铺的订单
     */
    public function getordersbyshop()
    {
        $authorize = new Authorize ();
        $auid = $authorize->Filter('admin,shop');
        if ($auid) {
            if (intval($auid)) {
                $shopid = $auid;
            } else {
                $shopid = I('get.shopid');
            }
            $status = I('get.status', -1);
            $ispickup = I('get.ispickup', 0);
            $start = I('get.start');
            $count = I('get.count');
            $order = M('orders');

            if (intval($ispickup) == 0) {
                $where_order [OrderConst::ISPICKUP] = 0;
            }

            $where_order [OrderConst::SHOPID] = $shopid;
            if (intval($status) > -1) {
                switch (intval($status)) {
                    case 0 :
                    case 1 :
                    case 2 :
                        $where_order [OrderConst::ORDERSTATUS] = $status;
                        break;
                    case 3 :
                        $where_order [OrderConst::ORDERSTATUS] = $status;
                        break;
                    default :
                        break;
                }
            }
            $orderdata = $order->where($where_order)->order('-createdtime')->limit($start, $count)->select();
            $data = $this->orderdetail($orderdata, $count);
            $this->response($data, 'json');
        } else {
            $message ["msg"] = "Unauthorized";
            $this->response($message, 'json', '401');
        }
    }

    /*
     * 删除订单
     */
    public function deleteorder()
    {
        $id = intval(I('get.id', 0));
        if ($id) {
            $order = M("orders");
            $where [OrderConst::ORDERID] = $id;
            $order->where($where)->delete();
        }
    }

    /*
     * 创建新订单
     */
    public function createorder()
    {
        $currentdate = date('Y-m-d');
        $order = M('orders');
        $shop = M('shop');
        $dns = OrderConst::COUNT;
        // 生成16位唯一订单号
        $orderid = date('Ymd') . substr(implode(NULL, array_map('ord', str_split(substr(uniqid(), 7, 13), 1))), 0, 8);
        $data [OrderConst::ORDERID] = $orderid;
        // 新生成的订单状态默认为0，为1时下单成功，为2时订单取消
        $data [OrderConst::ORDERSTATUS] = 0;
        $authorize = new Authorize ();
        $userid = $authorize->Filter("user");
        $data [OrderConst::USERID] = $userid;
        $userData = M('user')->where('userid=' . $userid)->find();
        if (intval($userData['block']) == 1) {
            $message['success'] = 0;
            $message['error'] = 'blocked';
            $this->response($message, 'json');
            return;
        }
        if ($userid) {
            $poststr = 'post.';
            $orders = M('orders');
            if ($orders->where("userid = {$userid}")->find()) {
                $data [OrderConst::ISFIRST] = 0;
            } else {
                $data [OrderConst::DISCOUNT] = $dns;
                $data [OrderConst::ISFIRST] = 1;
            }


            $data [OrderConst::SHOPID] = I('post.shopid');
            $where_shop [ShopConst::SHOPID] = $data [OrderConst::SHOPID];
            $shopdetail = $shop->where($where_shop)->find();
            //获取店铺经纬度
            $shoplat = $shopdetail[ShopConst::LATITUDE];
            $shoplng = $shopdetail[ShopConst::LONGITUDE];


            // 根据传过来的bag_id查询bag是否可用，如果bag不可用，返回success=0，error='bag_unavailable'
            $bagId = intval(I($poststr.OrderConst::BAG_ID));
            $bagDao = M('bag');
            if ($bagId) {
                // 用户选了红包
                $bagCondition[BagConst::USER_ID] = $userid;
                $bagCondition[BagConst::ID] = $bagId;
                $bagCondition[BagConst::USED] = 0;
                $bag = $bagDao->where($bagCondition)->find();
                if (!count($bag)) {
                     $message['success'] = 0;
            		 $message['error'] = 'bag_unavailable';
            		 $this->response($message, 'json');
                      return;
                }
                else 
                {
                	$data[OrderConst::BAG_ID] = $bag[BagConst::ID];
                	$data[OrderConst::BAG_AMOUNT] = $bag[BagConst::AMOUNT];
                }
            }


            $data [OrderConst::LATITUDE] = doubleval(I($poststr . OrderConst::LATITUDE, 0));
            $data [OrderConst::LONGITUDE] = doubleval(I($poststr . OrderConst::LONGITUDE, 0));
            $data [OrderConst::ISPICKUP] = intval(I($poststr . OrderConst::ISPICKUP, 0));

            $distance = intval($this->getDistance($shoplat, $shoplng, $data [OrderConst::LATITUDE], $data [OrderConst::LONGITUDE]));
            $data[OrderConst::DISTANCE] = $distance;
            if ($data [OrderConst::ISPICKUP] == 1) {
                $data [OrderConst::ISDELIVERY] = 0;
            } else {
                if ($distance < 100) {
                    $data [OrderConst::ISDELIVERY] = 1;
                    $data [OrderConst::ISPICKUP] = 1;
                    $data[OrderConst::BAG_ID] = 0;
                    $data[OrderConst::BAG_AMOUNT] = 0;
                    
                } else {
                    if ($data [OrderConst::LATITUDE] == 0) {
                        // 经纬度为0，默认到店自提
                        $data [OrderConst::ISDELIVERY] = 1;
                        $data [OrderConst::ISPICKUP] = 1;
                        $data[OrderConst::BAG_ID] = 0;
                        $data[OrderConst::BAG_AMOUNT] = 0;
                    } else {
                        $data [OrderConst::ISDELIVERY] = 0;
                    }
                }
            }
            
            if($data [OrderConst::ISDELIVERY] == 0 && $bagId)
            {
            	$bagDao->where("id=".$bagId)->setField("used",1);
            }

            // 获取店铺的优惠信息
            $shop_isdiscount = $shopdetail [ShopConst::ISDISCOUNT];
            $shop_discount = $shopdetail [ShopConst::DISCOUNT];

            // 订单的支付状态默认为0待支付，为1时支付成功，为2时支付失败
            $data [OrderConst::PAYSTATUS] = 0;
            $where1 [ShippingaddressConst::SAID] = I('post.said');
            // 根据获得的said访问shippingaddress表得到相应的address和phone
            $shippingaddress = M('shippingaddress');
            $shippingaddressdata = $shippingaddress->where($where1)->find();

            if (count($shippingaddressdata)) {
                $data [OrderConst::ADDRESS] = $shippingaddressdata [ShippingaddressConst::ADDRESS];
                $data [OrderConst::PHONE] = $shippingaddressdata [ShippingaddressConst::MOBILE];
                $data [OrderConst::USERNAME] = $shippingaddressdata [ShippingaddressConst::USERNAME];
            }
            $data [OrderConst::CREATEDTIME] = date("Y-m-d H:i:s", time());
            $data [OrderConst::DLTIME] = I('post.dltime');
            $data [OrderConst::NOTES] = I('post.notes');

            $product = M('product');
            $orderproduct = M('orderproduct');
            $totalprice = 0;

            $orderdetail_json = $_POST ['orderdetail'];
            $orderdetails = json_decode($orderdetail_json, true);

            $count = count($orderdetails);
            for ($i = 0; $i < $count; $i++) {
                $productid = $orderdetails [$i] ['productid'];
                $quantity = $orderdetails [$i] ['quantity'];

                $data1 [OrderProductConst::ORDERID] = $orderid;
                $data1 [OrderProductConst::PRODUCTID] = $productid;
                $data1 [OrderProductConst::QUANTITY] = $quantity;

                // 根据产品id从product表中获得对应产品的数据，存储在一个关系数组中
                $where [ProductConst::PRODUCTID] = $productid;
                $productdata = $product->where($where)->find();
                $price = $productdata [ProductConst::PRICE];
                $discount = $productdata [ProductConst::DISCOUNT];
                $attribute = $productdata [ProductConst::ATTRIBUTE];
                $unitweight = $productdata [ProductConst::UNITWEIGHT];
                if ($discount) {
                    $price = $discount;
                }
                switch ($attribute) {
                    // attribute为1， 按数量销售，按重量计价
                    case 1 :
                        $productprice = $quantity * $unitweight / 500 * $price;
                        break;
                    // attribute为2， 按重量销售，按重量计价
                    case 2 :
                        $productprice = $quantity * 250 / 500 * $price;
                        break;
                    // attribute为3， 按数量销售，按数量计价
                    case 3 :
                        $productprice = $quantity * $price;
                        break;
                }
                $totalprice += $productprice;
                // 将每个产品的价格(含预估)写入orderproduct表中的realprice字段
                $data1 [OrderProductConst::REALPRICE] = $productprice;
                $orderproduct->add($data1);
            }
            $data [OrderConst::TOTALPRICEBEFORE] = $totalprice;

            if(intval($data[OrderConst::BAG_AMOUNT])>0 && $bagId)
            {
            	
            	$totalprice -= intval($data[OrderConst::BAG_AMOUNT]);
            	$data [OrderConst::DISCOUNT] = $data[OrderConst::BAG_AMOUNT];
            }

            $data [OrderConst::TOTALPRICE] = $totalprice;
            $data2 = [];
            if (!empty ($data [OrderConst::ADDRESS]) && !empty ($data [OrderConst::PHONE]) && !empty ($data [OrderConst::USERNAME])) {

                $order->add($data);
                $data2 ['orderid'] = $orderid;
                $data2 ['conflict'] = $data[OrderConst::ISDELIVERY];
                // 构造模板消息
                $orderdeliery = '(外送)';
                if ($data [OrderConst::ISPICKUP] == 1 || $data[OrderConst::DISTANCE] < 50) {
                    $orderdeliery = '(自提)';
                }


                $shopid = intval($data [OrderConst::SHOPID]);
                if ($shopid) {
                    $user = M("user");

                    $userinfo = $user->where('shopid=' . $shopid)->select();

                    $current = date('y年m月d日 H:i');
                    $contact = $data [OrderConst::USERNAME] . " 电话" . $data [OrderConst::PHONE];
                    $address = "发货地址: " . $data [OrderConst::ADDRESS] . "   配送时间: " . $data [OrderConst::DLTIME];
                    $orderNum = "订单编号：" . $orderid;

                    $ordertype = "新的订单" . $orderdeliery;
                    if ($data [OrderConst::DISCOUNT] > 0 && $data [OrderConst::BAG_ID] >0) {
                        $ordertype = "红包减免" . $data [OrderConst::DISCOUNT] . "元" . $orderdeliery;
                    } 

                    if (count($userinfo)) {
                        for ($i = 0; $i < count($userinfo); $i++) {
                            if (!empty ($userinfo [$i] ["openid"])) {
                                $template = array(
                                    'touser' => $userinfo [$i] ["openid"],
                                    'template_id' => C('NEWORDER_TEMPID'),
                                    'url' => "http://www.shuwow.com/Home/Index/shop",
                                    'topcolor' => "#009900",
                                    'data' => array(
                                        'first' => array(
                                            'value' => urlencode($orderNum),
                                            'color' => "#FF0000"
                                        ),
                                        'tradeDateTime' => array(
                                            'value' => urlencode($current),
                                            'color' => "#009900"
                                        ),
                                        'orderType' => array(
                                            'value' => urlencode($ordertype),
                                            'color' => "#009900"
                                        ),
                                        'customerInfo' => array(
                                            'value' => urlencode($contact),
                                            'color' => "#009900"
                                        ),
                                        'orderItemName' => array(
                                            'value' => urlencode("发货地址&配送时间")
                                        ),
                                        'orderItemData' => array(
                                            'value' => urlencode($address),
                                            'color' => "#009900"
                                        ),
                                        'remark' => array(
                                            'value' => urlencode("\\n信息来自树窝小店"),
                                            'color' => "#cccccc"
                                        )
                                    )
                                );
                                $weixin = new Weixin ();
                                $token = $weixin->getshopGlobalAccessToken();
                                $weixin->sendtemplatemsg(urldecode(json_encode($template)), $token);
                            }
                        }
                    }
                }

                $url = U("WeixinqueueApi/sendorderinfotobd/", '', '', true);
                $params = [
                    "shopid" => $shopid,
                    "orderid" => $orderid
                ];
                $this->curl_request_async($url, $params);
            }
            $this->response($data2, 'json');
        } else {
            $message ["msg"] = "Unauthorized";
            $this->response($message, 'json', '401');
        }
    }

    public function getWeight()
    {
        $weixin = new Weixin ();
        $orderproduct = M('orderproduct');
        $product = M('product');
        $rtotalprice = 0; // 真实总价
        $counts = OrderConst::COUNT;
        $weightdetail_json = $_POST ['weightdetail'];
        $weightdetail = json_decode($weightdetail_json, true);

        /**
         * 如果两个商家管理员先后确认订单，会造成用户确认收货的订单被修改成已确认的状态
         */
        $orderproductid = $weightdetail [0] ['orderproductid'];
        $oid = $orderproduct->where('id=' . $orderproductid)->find()['orderid'];
        $orderData = M('orders')->where('orderid=' . $oid)->find();
        $status = intval($orderData[OrderConst::ORDERSTATUS]);
        if ($status != 0) {
            // 订单状态不是待确认
            $message ['success'] = 0;
            $message ['error'] = '已经确认';
            $this->response($message, 'json');
            return;
        }
        $count = count($weightdetail);

        for ($i = 0; $i < $count; $i++) {
            $orderproductid = $weightdetail [$i] ['orderproductid'];
            $weight = $weightdetail [$i] ['weight'];

            // 获取每个orderproductid对应的产品的realprice(含估计)
            $where [OrderProductConst::ID] = $orderproductid;
            $realprice = $orderproduct->where($where)->getField(OrderProductConst::REALPRICE);

            // 如果重量不为0，插入到orderproduct表的realweight字段中
            if (intval($weight) >= 0) {
                $data [OrderProductConst::REALWEIGHT] = $weight;
                // 根据orderproductid从orderproduct表中获得对应的productid 和orderid
                $where2 [OrderProductConst::ID] = $orderproductid;
                $orderproductdata = $orderproduct->where($where2)->find();
                $productid = $orderproductdata [OrderProductConst::PRODUCTID];
                $orderid = $orderproductdata [OrderProductConst::ORDERID];

                // 根据productid从product表中获得对应产品的数据，存储在一个关系数组中
                $where3 [ProductConst::PRODUCTID] = $productid;
                $productdata = $product->where($where3)->find();
                $price = $productdata [ProductConst::PRICE];
                $discount = $productdata [ProductConst::DISCOUNT];

                if ($discount) {
                    $price = $discount;
                }
                if ($productdata [ProductConst::ATTRIBUTE] == 1 || $productdata [ProductConst::ATTRIBUTE] == 2) {
                    $realprice = $weight * $price / 500;
                } else {
                    $realprice = $weight * $price;
                }
                $data [OrderProductConst::REALPRICE] = $realprice;

                $orderproduct->where($where)->save($data);

                // 计算真实总价
                $rtotalprice += $realprice;
            }
        }
        // 将真实总价写入对应的order表中的rtotalprice字段中
        $order = M('orders');
        $shop = M('shop');
        $where4 [OrderConst::ORDERID] = $orderid;

//         // 获取订单优惠信息
//         $shop_id = $order->where($where4)->getField('shopid');
//         $whereshop [ShopConst::SHOPID] = $shop_id;
//         $shopdetail = $shop->where($whereshop)->find();
//         $shop_isdiscount = $shopdetail [ShopConst::ISDISCOUNT];
//         $shop_discount = $shopdetail [ShopConst::DISCOUNT];

//         // 获取是否首购
//         $order_isfirst = $order->where($where4)->getField('isfirst');
        $order->where($where4)->setField('rtotalpricebefore', $rtotalprice);

        if ($rtotalprice > 0) {
            if(intval($orderData[OrderConst::BAG_AMOUNT])>0)
            {
            	$rtotalprice -= intval($orderData[OrderConst::BAG_AMOUNT]);
            }
            
        }

        
        if ($rtotalprice <= 0) {
            $rtotalprice = 0;
        }

        $order->where($where4)->setField('rtotalprice', $rtotalprice);
        // 将订单状态由0变成1(订单确认)
        if ($order->where($where4)->setField('orderstatus', 1)) {
            $userid = $order->where($where4)->getField("userid");
            if (intval($userid)) {
                $user = M("user");
                $userinfo = $user->where('userid=' . $userid)->find();
                if (count($userinfo) && !empty ($userinfo ['openid'])) {
                    $current = date('y年m月d日H:i');
                    $msg = "您所购买的水果,商家已于" . $current . "称重";
                    $realtotal = $order->where($where4)->getField('rtotalprice');
                    $totalprice = "实际价格:" . $realtotal . "元";
                    if (count($userinfo) && !empty ($userinfo ["openid"])) {
                        $template = array(
                            'touser' => trim($userinfo ["openid"]),
                            'template_id' => C('ORDERSTATUS_TEMPID'),
                            'url' => "http://www.shuwow.com/Home/Index/index/#/order",
                            'topcolor' => "#009900",
                            'data' => array(
                                'first' => array(
                                    'value' => urlencode($msg),
                                    'color' => "#FF0000"
                                ),
                                'OrderSn' => array(
                                    'value' => urlencode($orderid),
                                    'color' => "#009900"
                                ),
                                'OrderStatus' => array(
                                    'value' => urlencode($totalprice),
                                    'color' => "#009900"
                                ),
                                'remark' => array(
                                    'value' => urlencode("\\n信息来自树窝小店"),
                                    'color' => "#cccccc"
                                )
                            )
                        );
                        $token = $weixin->getusersGlobalAccessToken();
                        $weixin->sendtemplatemsg(urldecode(json_encode($template)), $token);
                    }
                }
            }
        }
    }

    /*
     * 撤销订单
     */
    public function cancelorder()
    {
        $order = M('orders');
        $id = I('post.id', 0);
        $ordernotes = I('post.ordernotes', '');
        $authorize = new Authorize ();
        $auid = $authorize->Filter("admin,shop");
        if (!$auid) {
            $message ["msg"] = "Unauthorized";
            $this->response($message, 'json', '401');
        } else {
            if (intval($auid)) {
                if ($auid != $order->where("orderid=" . $id)->getField("shopid")) {
                    $message ["msg"] = "Unauthorized";
                    $this->response($message, 'json', '401');
                }
            }
        }
        if ($id) {
            if ($order->where("orderid=" . $id)->setField("orderstatus", 2) && $order->where("orderid=" . $id)->setField("ordernotes", $ordernotes)) {
                $userid = $order->where("orderid=" . $id)->getField("userid");
                if (intval($userid)) {
                    $user = M("user");
                    $phone = '暂无';
                    $shopname = '';
                    if (intval($auid)) {
                        $shop = M('shop');
                        $shopid = $auid;
                        $shop = $shop->where("shopid=" . $shopid)->find();
                        $shopname = $shop ['spn'];
                        $phone = $shop ['phone'];
                    }
                    $userinfo = $user->where('userid=' . $userid)->find();

                    if (count($userinfo) && !empty ($userinfo ['openid'])) {
                        $current = date('y年m月d日H:i');
                        $msg = $shopname . "已于" . $current . "取消订单";
                        $errormsg = "订单取消原因:" . $ordernotes . " 商家电话:" . $phone;
                        if (count($userinfo) && !empty ($userinfo ["openid"])) {
                            $template = array(
                                'touser' => trim($userinfo ["openid"]),
                                'template_id' => C('ORDERSTATUS_TEMPID'),
                                'url' => "http://www.shuwow.com/Home/Index/index/#/order",
                                'topcolor' => "#009900",
                                'data' => array(
                                    'first' => array(
                                        'value' => urlencode($msg),
                                        'color' => "#FF0000"
                                    ),
                                    'OrderSn' => array(
                                        'value' => urlencode($id),
                                        'color' => "#009900"
                                    ),
                                    'OrderStatus' => array(
                                        'value' => urlencode($errormsg),
                                        'color' => "#009900"
                                    ),
                                    'remark' => array(
                                        'value' => urlencode("\\n信息来自树窝小店"),
                                        'color' => "#cccccc"
                                    )
                                )
                            );
                            $weixin = new Weixin ();
                            $token = $weixin->getusersGlobalAccessToken();
                            $weixin->sendtemplatemsg(urldecode(json_encode($template)), $token);
                        }
                    }
                }
            }
        } else {
            $message ["msg"] = "Unauthorized";
            $this->response($message, 'json', '401');
        }
    }

    // 用户确认订单
    public function orderconfirm()
    {
    	
    	$totalbags = 4;
        $authorize = new Authorize ();
        $auid = $authorize->Filter('user');
        if (intval($auid)) {
            $poststr = "post.";
            $data = [];
            $orderid = I($poststr . OrderConst::ORDERID);
            $order = M('orders');
            $bags = M("bag");
            $orderdata = $order->where("orderid=".$orderid)->find();
            if(count($orderdata))
            {
            	if ($order->where("orderid = '" . $orderid . "' AND userid=" . $auid)->setField("orderstatus", 3) !== false) {
                    //加入送红包
            	    $userid = $orderdata[OrderConst::USERID];
            		$bagcount = $bags->where("user_id = ".$userid)->select();
            	    if (count($bagcount)<$totalbags)
            	    {
            	    	$current = date('Y-m-d',strtotime('+1 days'));
            	    	$expirdate = date('Y-m-d',strtotime('+7 days'));
            	    	$expirdate = $expirdate." 23:59:59";
            	    	$bagitem[BagConst::START] =$current;
            	    	$bagitem[BagConst::SHOP_ID] = $orderdata[Orderconst::SHOPID];
            	    	$bagitem[BagConst::TYPE]=1;
            	    	$bagitem[BagConst::EXPIRES]=$expirdate;
            	    	$bagitem[BagConst::USED] = 0;
            	    	$bagitem[BagConst::AMOUNT] = 5;
            	    	$bagitem[BagConst::USER_ID]= $auid;
            	    	$bagitem[BagConst::ISEVER] = 0;
            	    	$bagitem[BagConst::ISAOUT]=1;
            	    	$bagid = $bags->add($bagitem);
            	    	if($bagid)
            	    	{
            	    		$url = U("WeixinqueueApi/sendbagtouser/", '', '', true);
            	    		$params = [
            	    				"userid" => $auid,
            	    				"bagid" => $bagid
            	    				];
            	    		$this->curl_request_async($url, $params);
            	    	}
            	  }
            		$data = $orderid;
            	}
            }
            $this->response($url, "json");
        } else {
            $message ["msg"] = "Unauthorized";
            $this->response($message, 'json', '401');
        }

    }

    //管理员根据状态查询订单
    public function filterOrder()
    {
        $authorize = new Authorize ();
        $isAdmin = $authorize->Filter("admin");
        if (!$isAdmin) {
            $message ["msg"] = "Unauthorized";
            $this->response($message, 'json', '401');
        }
        $order = M("orders");
        $status = I('get.status', -1);
        $shopId = I('get.shopId', -1);
        $start = I('get.start', 0);
        $count = I('get.count', 5);

        $status = intval($status);
        $shopId = intval($shopId);

        if ($status == -2) {
            // 筛选差异订单
            $where_order[OrderConst::ISDELIVERY] = 1;
        } elseif ($status == -3) {
            // 上门自提
            $where_order[OrderConst::ISPICKUP] = 1;
        } elseif ($status == -4) {
            // 送货上门
            $where_order[OrderConst::ISPICKUP] = 0;
        } elseif ($status == -1) {

        } else {
            $where_order [OrderConst::ORDERSTATUS] = intval($status);
        }
        if ($shopId != -1) {
            $where_order[OrderConst::SHOPID] = $shopId;
        }

        if (!empty($where_order)) {
            $orderdata = $order->where($where_order)->order('-createdtime')->limit($start, $count)->select();
        } else {
            $orderdata = $order->order('-createdtime')->limit($start, $count)->select();
        }
        $data = $this->orderdetail($orderdata, $count);
        if (!count($data)) {
            $data = [];
        }
        $this->response($data, 'json');
    }

    private function orderdetail($orderdata, $count)
    {
        $orderproduct = M('orderproduct');
        $product = M('product');
        $data = [];
        for ($i = 0; $i < $count; $i++) {
            $data_order_product = [];
            if ($orderdata [$i] [OrderConst::ORDERID] == null) {
                break;
            } else {
                $data [$i] [OrderConst::ORDERID] = $orderdata [$i] [OrderConst::ORDERID];
                $data [$i] [OrderConst::CREATEDTIME] = $orderdata [$i] [OrderConst::CREATEDTIME];
                $data [$i] [OrderConst::ORDERSTATUS] = $orderdata [$i] [OrderConst::ORDERSTATUS];
                $data [$i] [OrderConst::USERNAME] = $orderdata [$i] [OrderConst::USERNAME];
                $data [$i] [OrderConst::ADDRESS] = $orderdata [$i] [OrderConst::ADDRESS];
                $data [$i] [OrderConst::PHONE] = $orderdata [$i] [OrderConst::PHONE];
                $data [$i] [OrderConst::NOTES] = $orderdata [$i] [OrderConst::NOTES];
                $data [$i] [OrderConst::SHOPID] = $orderdata [$i] [OrderConst::SHOPID];
                $data [$i] [OrderConst::DLTIME] = $orderdata [$i] [OrderConst::DLTIME];
                $data [$i] [OrderConst::ISFIRST] = $orderdata [$i] [OrderConst::ISFIRST];
                $data [$i] [OrderConst::DISCOUNT] = $orderdata [$i] [OrderConst::DISCOUNT];

                $data [$i] [OrderConst::DISTANCE] = $orderdata [$i] [OrderConst::DISTANCE];
                $data [$i] [OrderConst::ISPICKUP] = $orderdata [$i] [OrderConst::ISPICKUP];
                $data [$i] [OrderConst::ISDELIVERY] = $orderdata [$i] [OrderConst::ISDELIVERY];

                if ($orderdata [$i] [OrderConst::RTOTALPRICE] >= 0 && $orderdata [$i] [OrderConst::ORDERSTATUS] == 1) {
                    $data [$i] ['price'] = $orderdata [$i] [OrderConst::RTOTALPRICE];
                } else {
                    $data [$i] ['price'] = $orderdata [$i] [OrderConst::TOTALPRICE];
                }
                if ($orderdata [$i] [OrderConst::RTOTALPRICEBEFORE] >= 0 && $orderdata [$i] [OrderConst::ORDERSTATUS] == 1) {
                    $data [$i] ['beforeprice'] = $orderdata [$i] [OrderConst::RTOTALPRICEBEFORE];
                } else {
                    $data [$i] ['beforeprice'] = $orderdata [$i] [OrderConst::TOTALPRICEBEFORE];
                }

                if ($orderdata [$i] [OrderConst::ORDERNOTES] != null) {
                    $data [$i] [OrderConst::ORDERNOTES] = $orderdata [$i] [OrderConst::ORDERNOTES];
                }
                $where_order_product [OrderProductConst::ORDERID] = $orderdata [$i] [OrderConst::ORDERID];
                $orderproductdata = $orderproduct->where($where_order_product)->field('id,productid,quantity,realweight,realprice')->select();
                $count2 = count($orderproductdata);
                for ($j = 0; $j < $count2; $j++) {
                    $data_order_product [$j] ['orderproductid'] = $orderproductdata [$j] [OrderProductConst::ID];
                    $data_order_product [$j] ['quantity'] = $orderproductdata [$j] [OrderProductConst::QUANTITY];
                    $data_order_product [$j] ['realprice'] = $orderproductdata [$j] [OrderProductConst::REALPRICE];
                    $data_order_product [$j] ['realweight'] = $orderproductdata [$j] [OrderProductConst::REALWEIGHT];
                    $where_product [ProductConst::PRODUCTID] = $orderproductdata [$j] [OrderProductConst::PRODUCTID];
                    $productdata = $product->where($where_product)->field('productname,unit,attribute,unitweight,price,discount')->find();
                    $data_order_product [$j] ['productname'] = $productdata ['productname'];
                    $data_order_product [$j] ['price'] = $productdata ['price'];
                    $data_order_product [$j] ['unit'] = $productdata ['unit'];
                    $data_order_product [$j] ['attribute'] = $productdata ['attribute'];
                    $data_order_product [$j] ['unitweight'] = $productdata ['unitweight'];
                    if (intval($data_order_product [$j] ['discount'])) {
                        $data_order_product [$j] ['discount'] = $productdata ['discount'];
                    } else {
                        $data_order_product [$j] ['discount'] = $productdata ['price'];
                    }
                }
            }
            $data [$i] ['productdetail'] = $data_order_product;
        }
        return $data;
    }


    private function getDistance($lat1, $lng1, $lat2, $lng2)
    {

        $earthRadius = 6367000; // approximate radius of earth in meters
        $lat1 = ($lat1 * pi()) / 180;
        $lng1 = ($lng1 * pi()) / 180;
        $lat2 = ($lat2 * pi()) / 180;
        $lng2 = ($lng2 * pi()) / 180;

        $calcLongitude = $lng2 - $lng1;
        $calcLatitude = $lat2 - $lat1;
        $stepOne = pow(sin($calcLatitude / 2), 2) + cos($lat1) * cos($lat2) * pow(sin($calcLongitude / 2), 2);
        $stepTwo = 2 * asin(min(1, sqrt($stepOne)));
        $calculatedDistance = $earthRadius * $stepTwo;

        return round($calculatedDistance);
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