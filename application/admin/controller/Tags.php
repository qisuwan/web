<?php
namespace app\admin\controller;

use app\common\controller\Base;
use think\Request;

class Tags extends Base{
	public function index(){
		return $this->fetch('index',[
		    'tags'  =>  'layui-this',
            'childTag'  =>  ''
        ]);
	}
	
	public function getTags(){
		$list = model('tags')->select();
		$arr=[
			"code"		=> 0,
			"msg"		=> "",
			"count" 	=> model('tags')->count(),
			"data"		=> $list
		];
		return $arr;
	}
	
	public function add(){
        if($this->request->isPost()) {
            $param = $this->request->except('id');
            if (model('tags')->data($param)->save()) {
                return true;
            } else {
                return false;
            }
        }
        return $this->fetch('save');
	}

	public function delete(){
	    if($this->request->isPost()){
            return model('tags')->where('id','IN',input('post.ids'))->delete();
        }
    }

    public function update(){
        if($this->request->isPost()) {
            if (model('tags')->isUpdate()->save(input('post.'))) {
                $this->success("添加成功", url("tags/index"));
            } else {
                $this->error($this->errorMsg);
            }
        }
        return $this->fetch('save',[
            'data'  =>  model('tags')->get(input('get.id'))
        ]);
    }
}
?>