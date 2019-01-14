<?php
namespace app\admin\controller;

use app\common\controller\Base;
use think\Db;
use think\Request;

class Weblog extends Base{
    //首页显示
	public function index(){
		$this->assign('logs','layui-this');
		return view();
	}
	//获取文章信息
	public function getLog(){
		$limit = input('get.limit');
		$start = (input('get.page')-1)*$limit;
		$list = Db::query("SELECT a.*,b.tag_name FROM weblog as a,tags as b WHERE a.tag_id=b.id ORDER BY a.id DESC LIMIT $start,$limit");
		$arr=[
			"code"		=> 0,
			"msg"		=> "",
			"count" 	=> model('weblog')->count(),
			"data"		=> $list
		];
		return $arr;
	}
	//跳转到发布文章界面
	public function addLog(){
		return $this->fetch('save',[
		    'title' =>  '发布文章',
		    'tag'  =>  model('Tags')->all(),
            'logs'  =>  'layui-this',
            'target'   =>   'add'
        ]);
	}
	//改变文章状态
    public function change(){
	    $id = input('get.id/d');
	    $status = model('weblog')->where("id",$id)->value('status');
	    if($status == 1){
            $status=0;
        }else{
	        $status=1;
        }
        if (model("weblog")->isUpdate()->save(['status'=> $status],['id'=>$id])) {
            insert_admin_log("更改文章状态");
            return true;
        } else {
            return false;
        }
    }
    //批量改变文章状态
    public  function changeAll(){
	    if (model('weblog')->where("id",'IN',input('post.ids'))->update(['status'=>input('post.val')])) {
            insert_admin_log("更改文章状态");
            return true;
        } else {
	        return false;
        }
    }

    public function delete(){
	    if (model('weblog')->where("id",'IN',input('post.ids'))->delete()) {
            insert_admin_log("删除文章");
            return true;
        } else {
	        return false;
        }
    }
    public function add(){
	    if($this->request->isPost()) {
            $param = Request::instance()->except("id","post");
            if (model('weblog')->data($param)->save()) {
                insert_admin_log("发布文章");
                $this->success("发布成功", url("weblog/index"));
            } else {
                $this->error($this->errorMsg);
            }
        }
    }
    public function update(){
	    if($this->request->isPost()) {
            if (model('weblog')->isUpdate()->save(input('post.'))) {
                insert_admin_log("修改文章");
                $this->success("修改成功", url("weblog/index"));
            } else {
                $this->error($this->errorMsg);
            }
        }
        return $this->fetch('save',[
            'title' => '修改文章',
            'tag'   =>  model('Tags')->all(),
            'logs'  =>  'layui-this',
            'target'   =>   'update',
            'data'  =>  model('weblog')->get(input('get.id'))
        ]);
    }
}
?>