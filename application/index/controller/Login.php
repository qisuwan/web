<?php
namespace app\index\controller;

use think\Controller;
use think\Db;
class Login extends Controller{
	//登录页面
	public function index(){
		return view();
	}
	//登录检查
	public function check(){
		$data=json_decode($_POST["data"]);
		
		if(Db::query("select * from account where userName='$data->username' and password='$data->password'")){
			return "index\index";
		}else{
			return false;
		}
	}
	
	//空操作
	public function _empty(){
		$this->redirect('index\index');
	}
}
?>