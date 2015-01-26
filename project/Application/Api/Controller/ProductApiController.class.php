<?php
namespace Api\Controller;
use Think\Controller\RestController;
require_once 'ProductConst.php';
require_once 'ShopProductConst.php';
require_once 'GeoHash.php';

class ProductApiController extends RestController{
	//返回所有产品
	public function getallproducts() {
		$products = M('product');
		$data = $products->select();
		if (!count($data)){
			$data = [];
		}
		$this->response($data, 'json');
	}
	
	//通过id查询产品
	public function getproductbyid() {
		$products = M('product');
		$id = intval(I('get.id',0));
		if ($id){
			$sql = ProductConst::PRODUCTID.'="'.$id.'"';
			$data = $products->where($sql)->find();
			if (!count($data)){
				$data = [];
			}
		} else {
			$data = [];
		}
		$this->response($data[0],'json');
		
	}
	
	//通过给定id号更新产品上下架
	public function updateproductissale() {
		$product = M('Product');
		$post = 'post.';
		$id = intval(I('get.id', 0));
		$issale = intval(I($post.ProductConst::ISSALE));
		if ($id) {
			$data[ProductConst::PRODUCTID] = $id;
			if ($issale){
				$data[ProductConst::ISSALE] = 1;
			}else {
				$data[ProductConst::ISSALE] = 0;
			}
			$product->save($data);
		}
		
	}
	
	//增加产品 
	public function addproduct() {
		$product = M('product');
		$data[ProductConst::PRODUCTNAME] = I('post.productname');
		$data[ProductConst::PIMGURL] = I('post.pimgurl');
		$data[ProductConst::ISSALE] = I('post.issale');
		$data[ProductConst::NUM] = I('post.num');
		$data[ProductConst::PRICE] = I('post.price');
		$data[ProductConst::DISCOUNT] = I('post.discount');
		
		$data[ProductConst::ATTRIBUTE] = I('post.attribute');
		$data[ProductConst::CATEGORYID] = I('post.categoryid');
		$data[ProductConst::UNIT] = I('post.unit');
		$data[ProductConst::UNITWEIGHT] = I('post.unitweight');
		//插入product表值
		$productid = $product->add($data);
		
		
		//插入shopproduct表值
		$shopproduct = M('shopproduct');
		$shopid = I('post.shopid');

		$data1[ShopProductConst::SHOPID] = $shopid;
		$data1[ShopProductConst::PRODUCTID] = $productid;
		
		$shopproduct->add($data1);
		
	}
	
	//根据指定id删除产品
	public function deleteproduct() {
		$products = M('product');
		$id = intval(I('get.id', 0));
		if ($id){
			$where['productid'] = $id;
			$products->where($where)->delete();
		}
	}
	
	//根据指定id修改产品信息
	public function updateproduct() {
		$products = M('product');
		$id  = intval(I('get.id', 0));
		if ($id){
			$data[ProductConst::PRODUCTID] = $id;
			if (I('post.productname') != null) {
			    $data[ProductConst::PRODUCTNAME] = I('post.productname');
			}
			if (I('post.pimgurl') != null) {
				$data[ProductConst::PIMGURL] = I('post.pimgurl');
			}
			if (I('post.issale') != null) {
				$data[ProductConst::ISSALE] = I('post.issale');
			}
			if (I('post.num') != null) {
				$data[ProductConst::NUM] = I('post.num');
			}
			if (I('post.price') != null) {
			    $data[ProductConst::PRICE] = I('post.price');
			}
			if (I('post.discount') != null) {
			    $data[ProductConst::DISCOUNT] = I('post.discount');
			}
			if (I('post.attribute') != null) {
				$data[ProductConst::ATTRIBUTE] = I('post.attribute');
			}
			if (I('post.categoryid') != null) {
				$data[ProductConst::CATEGORYID] = I('post.categoryid');
			}
			if (I('post.unit') != null) {
				$data[ProductConst::UNIT] = I('post.unit');
			}
			if (I('post.unitweight') != null) {
				$data[ProductConst::UNITWEIGHT] = I('post.unitweight');
			}
		}
		$products->save($data);
		
	}
}