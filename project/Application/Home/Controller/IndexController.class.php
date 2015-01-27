<?php
namespace Home\Controller;
use Think\Controller;
require_once 'Weixin.php';
require_once 'Xcrypt.php';
class IndexController extends Controller {
    public function index(){
      $weixin = new Weixin();
      $key =C("CRYPT_KEY");
      $xcrpt = new Xcrypt($key, 'cbc', 'auto');;
      if(cookie('utoken'))
      {
      	
      }
      else 
      {
      	$this->redirect("");
      }
    }
    
    public function authorize()
    {
    	
    }
}