<?php
// require_once "Shuwo/Lib/Action/DAL/ShopDAL.php";
require_once "Shuwo/Lib/Action/BAL/GeoHash.php";
class AdminAction extends Action {
    /*
     * 显示查询页面
     */
	public function shop(){
		$db=M('shop');
		$where='';//查询条件
		$arr=$db->where($where)->select();
		$this->assign('arr',$arr);
		$this->display();
	}
	/*
	 * 数据删除类
	 */
	public function del(){
		$db=M('shop');
		$id=$_GET['id'];//用url获得get传参的用户id
		if($db->delete($id)){ //判断数据是否删除成功
			$this->success("数据删除成功");
		}else{
			$this->error("数据删除失败");
		}
	}
	/*
	 * 显示修改页面
	 */
	public function shopedit(){
		$id=$_GET['id'];//用url获得get传参的用户id
 		$db=M('shop');//连接数据库
 		$arr=$db->find($id);
 		$this->assign('data',$arr);
 		$this->display();
	}
	/*
	 * 数据修改类
	 */
	public function update(){
		$db=M('shop');
		$data['ShopID']=$_POST['ShopID'];
        $data['ShopAddress']=$_POST['ShopAddress'];
        $data['ShopName']=$_POST['ShopName'];
        $data['ContactName']=$_POST['ContactName'];
        $data['ContactPhone']=$_POST['ContactPhone'];
        $data['Latitude']=$_POST['Latitude'];
        $data['Longitude']=$_POST['Longitude'];
        $data['City']=$_POST['City'];
        $data['Distinct']=$_POST['Distinct'];
        $data['Province']=$_POST['Province'];
		if($db->save($data)){
			$this->success("数据修改成功",'shop');
		}else{
   			$this->error("数据修改失败");
		}
    }
    /*
     * 数据添加类
     */
    public function create(){
         $geoHash  = new Geohash();  
        $latitude=$_POST['Latitude'];
        $longitude=$_POST['Longitude'];
        $geoHashCode = $geoHash->encode($latitude,$longitude);         
        $db=M('shop');//链接数据库
        $db->ShopID=$_POST['ShopID'];
        $db->ShopAddress=$_POST['ShopAddress'];
        $db->ShopName=$_POST['ShopName'];
        $db->ContactName=$_POST['ContactName'];
        $db->ContactPhone=$_POST['ContactPhone'];
        $db->Latitude=$latitude;
        $db->Longitude=$longitude;
        $db->GeoHash = $geoHashCode;
        $db->City=$_POST['City'];
        $db->Distinct=$_POST['Distinct'];
        $db->Province=$_POST['Province'];
        if($db->add()){
            $this->success('数据添加成功','shop');
        }else{
            $this->error("数据添加失败");
        }
//            $shop = new Shop();
//            $shop->ShopID=$_POST['ShoID'];
//            $shop->ShopName=$_POST['ShopName'];
//            $geoHashCode=$shop->latitude=$_POST['Latitude'];
//            $longitude=$shop->longitude=$_POST['Longitude'];         
//            $shop->ShopAddress=$_POST['ShopAddress'];
//            $shop->ContactName=$_POST['ContactName'];
//            $shop->ContactPhone=$_POST['ContactPhone'];
//            $shop->Latitude=$latitude;
//            $shop->Longitude=$longitude;
//            $shop->GeoHash = $geoHashCode;
//            $shop->City=$_POST['City'];
//            $shop->Distinct=$_POST['Distinct'];
//            $shop->Province=$_POST['Province'];
//            $shopDAL = new ShopDAL();
//            $shopDAL->InsertShop($shop);
 
    }
    /*
     * 编写search方法，实现搜索
     */
//     public function search(){
//         $db=M('shop');
//         if(isset($_POST['name']) && $_POST['name']!=null){
//             $where['ProductName']=array('like',"%{$_POST['name']}%");
//         }
//         $arr=$db->where($where)->select();
//         $this->assign('name',$arr);
//         $this->display('shop');
//     }
}