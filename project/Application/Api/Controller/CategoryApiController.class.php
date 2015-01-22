<?php
namespace Api\Controller;
use Think\Controller\RestController;
require_once 'CategoryConst.php';
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
      if(I('post.categoryname') != null )
      {
      	$data[CategoryConst::CATEGORYNAME]=I('post.categoryname');
      }
      if(I('post.attribute') != null )
      {
      	$data[CategoryConst::ATTRIBUTE]=I('post.attribute');
      }
      $category->add($data);
      $this->response($data,"json");
  }
 //更新种类
 public function updatecategory(){
     $category=M('category');
     $data[CategoryConst::CATEGORYID]=I('get.id');
     if(I('post.categoryname') != null){
     $data[CategoryConst::CATEGORYNAME]=I('post.categoryname');
     }
     if(I('post.attribute') != null ){
     $data[CategoryConst::ATTRIBUTE]=I('post.attribute');
     }
     $data=$category->save($data);
     $this->response($data,"json");
 }
 //删除种类
 public function deletecategory(){
     $category=M('category');
     $id=I('get.id');
     $category->where('categoryid  ='.$id)->delete();
    }
}