<?php
namespace Home\Controller;
use Think\Controller;
require_once 'Weixin.php';
class IndexController extends Controller {
    public function index(){
       $weixin = new  Weixin();
       $token = $weixin->getGlobalAccessToken();
       echo $token;
    }
    
    public function authorize()
    {
    	
    }
}