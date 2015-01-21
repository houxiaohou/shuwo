<?php
namespace Api\Controller;
use Think\Controller\RestController;
require_once 'CategoryConst.php';
require_once 'GeoHash.php';
class CategoryApiController extends RestController {

//返回所有店铺
public function getallcategorys() {
		$category =M("category");
		$data =$category->select();
		$this->response($data,"json");
    }  
//通过ID查询种类
public function getcategorybyid(){
        $category=M("category");
        $categoryid  = I('get.id');
        $sql = CategoryConst::CATEGORYID.'="'.$categoryid.'"';
        $data = $category->where($sql)->find();
        $this->response($data,"json");
    }   
 //添加种类
  public function addcategory(){
      $category =M("category");
      if(I('post.name') != null ){
      $data[CategoryConst::CATEGORYNAME]=I('post.name');
      }
      if(I('post.atr') != null ){
      $data[CategoryConst::ATTRIBUTE]=I('post.atr');
      }
      $category->add($data);
      $this->response($data,"json");
  }
 //更新种类
 public function updatecategory(){
     $category=M('category');
     $data[CategoryConst::CATEGORYID]=I('get.id');
     if(I('post.name') != null){
     $data[CategoryConst::CATEGORYNAME]=I('post.name');
     }
     if(I('post.atr') != null ){
     $data[CategoryConst::ATTRIBUTE]=I('post.atr');
     }
     $category->save($data);
     $this->response($data,"json");
 }
 //删除种类
 public function deletecategory(){
     $category=M('category');
     $id=I('get.id');
     $category->delete($id);
     $this->response($id,"json");
    }
}