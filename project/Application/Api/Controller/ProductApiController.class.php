<?php
namespace Api\Controller;
use Think\Controller\RestController;
require_once 'ProductConst.php';
require_once 'BAL\GeoHash.php';

class ProductApiController extends RestController{
	//返回所有产品
	public function getallproducts() {
		$products = M('product');
		$data = $products->select();
		$this->response($data,'json');
	}
	
	//通过id查询产品
	public function getproductbyid() {
		$products = M('product');
		$id = I('get.id');
		$sql = ProductConst::PRODUCTID.'="'.$id.'"';
		$data = $products->where($sql)->find();
		$this->response($data, 'json');
	}
	
	//增加产品 
	public function addproduct() {
		$product = M('product');
		$data[ProductConst::PRODUCTNAME] = I('post.pname');
		$data[ProductConst::PRICE] = I('post.price');
		$data[ProductConst::DISCOUNTPRICE] = I('post.dprice');
		$data[ProductConst::ISSALE] = I('post.issale');
		$data[ProductConst::NUM] = I('post.num');
	
		$id = $product->add($data);
		$ranchar = rand(97, 122).rand(97, 122);
		$productid = intval($ranchar.$id);
		$data['productid'] = $productid;
		$product->where('productid='.$id)->setField('productid', $productid);
		$this->response($data, 'json');
	}
	
	//根据指定id删除产品
	public function deleteproduct() {
		$products = M('product');
		$id = $_GET['pid'];
		$where['productid'] = $id;
		$products->where($where)->delete();
	}
	
	//根据指定id修改产品信息
	public function updateproduct() {
		$products = M('product');
		$data['productid'] = $_GET['id'];
		if (I('post.pname') != null) {
		    $data[ProductConst::PRODUCTNAME] = I('post.pname');
		}
		if (I('post.price') != null) {
		    $data[ProductConst::PRICE] = I('post.price');
		}
		if (I('post.dprice') != null) {
		    $data[ProductConst::DISCOUNTPRICE] = I('post.dprice');
		}
		if (I('post.issale') != null) {
		    $data[ProductConst::ISSALE] = I('post.issale');
		}
		if (I('post.num') != null) {
		    $data[ProductConst::NUM] = I('post.num');
		}
		$products->save($data);
		
	}
}