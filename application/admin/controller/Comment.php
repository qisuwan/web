<?php
namespace app\admin\controller;
	
use app\common\controller\Base;
	
class Comment extends Base{
	//评论查看页
	public function index(){
		$this->assign('comment','layui-this');
		return view('index');
	}
	//获取留言信息
	public function getinfo(){
		$limit = input('get.limit');
		$start = (input('get.page')-1)*$limit;
		$list = model('comment')->all();
		$arr=[
			"code"		=> 0,
			"msg"		=> "",
			"count" 	=> model('comment')->count(),
			"data"		=> $list
		];
		return $arr;
	}

    public function delete(){
        return model('comment')->where("id",'IN',input('post.ids'))->delete();
    }
}
?>