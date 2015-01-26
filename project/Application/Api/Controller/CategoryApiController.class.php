<?php
namespace Api\Controller;
use Think\Controller\RestController;
require_once 'CategoryConst.php';
class CategoryApiController extends RestController {

//返回所有种类
public function getallcategorys() {
		$category =M("category");
		$data =$category->select();
		if(!count($data)){
        $data = [];
		}
		$this->response($data,"json");
    }  
//通过ID查询种类
public function getcategorybyid(){
        $category=M("category");
        $categoryid  = intval(I('get.id',0));
        if(!count(categoryid)){         
         $data = [];             
        }
        $sql = CategoryConst::CATEGORYID.'="'.$categoryid.'"';
        $data = $category->where($sql)->find();
        if(!count($data)){
            $data = [];
        }
        $this->response($data[0], "json");
    }   
 //添加种类
  public function addcategory(){
      $category =M("category");
      if(I('post.categoryname') != null )
      {
      	$data[CategoryConst::CATEGORYNAME]=I('post.categoryname');
      }
      $category->add($data);
      $this->response($data,"json");
  }
 //更新种类
 public function updatecategory(){
     $category=M('category');
     $id=intval(I('get.id',0));
     if($id){
     $data[CategoryConst::CATEGORYID]=$id;
     }
     if(I('post.categoryname') != null){
     $data[CategoryConst::CATEGORYNAME]=I('post.categoryname');
     }
     $data=$category->save($data);
     $this->response($data,"json");
 }
 //删除种类
 public function deletecategory(){
     $category=M('category');
     $id=intval(I('get.id',0));
     if($id){
     $categoryid=$category->where('categoryid  ='.$id)->delete();
     if($categoryid){
         $product=M('product');
         $product->where('categoryid  ='.$id)->delete();
        }
     }
   }
}