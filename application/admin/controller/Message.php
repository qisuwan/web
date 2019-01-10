<?php
namespace app\admin\controller;

use app\common\controller\Base;
	
class Message extends Base{
	//留言查看页
	public function index(){
		$this->assign('message','layui-this');
		return view('index');
	}
	//获取留言信息
	public function getinfo(){
		$limit = input('get.limit');
		$start = (input('get.page')-1)*$limit;
		$list = model('message')->all();
		$arr=[
			"code"		=> 0,
			"msg"		=> "",
			"count" 	=> model('message')->count(),
			"data"		=> $list
		];
		return $arr;
	}

	public function delete(){
        return model('message')->where("id",'IN',input('post.ids'))->delete();
    }
}
?>