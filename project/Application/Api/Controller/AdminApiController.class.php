<?php
namespace Api\Controller;
use Think\Controller\RestController;
require_once 'AdminConst.php';
class AdminApiController extends RestController {
    /*
     * 返回所有用户
     */
    public function getalladmin() {
        $category =M("admin");
        $data =$category->select();
        if(!count($data)){
            $data = [];
        }
        $this->response($data,"json");
    }
    /*
     * 添加用户
     */
    public function addadmin(){
        $admin =M("admin");
        if(I('post.name') != null )
        {
            $data[AdminConst::NAME]=I('post.name');
        }
        if(I('post.password') != null )
        {
            $data[AdminConst::PASSWORD]=I('post.password');
        }
        $admin->add($data);
        $this->response($data,"json");
    }
    /*
     * 更新用户
     */
    public function updateadmin(){
        $admin =M("admin");
        $id=intval(I('get.id',0));
        if($id)
        {
            $data[AdminConst::ID]=$id;
        }
        if(I('post.name') != null )
        {
            $data[AdminConst::NAME]=I('post.name');
        }
        if(I('post.password') != null )
        {
            $data[AdminConst::PASSWORD]=I('post.password');
        }
        $data=$admin->save($data);
        $this->response($data,"json");
    }
}