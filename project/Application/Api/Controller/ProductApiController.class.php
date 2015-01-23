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
		if (count($data)){
			$this->response($data,'json');
		}
	}
	
	//通过id查询产品
	public function getproductbyid() {
		$products = M('product');
		$id = intval(I('get.id',0));
		if ($id){
			$sql = ProductConst::PRODUCTID.'="'.$id.'"';
			$data = $products->where($sql)->find();
			$this->response($data, 'json');
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
		}
		$products->save($data);
		
	}
}