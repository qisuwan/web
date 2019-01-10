<?php
namespace app\index\controller;

use think\Controller;
use think\Db;

class Index extends Controller
{
    public function index() {
        $data = Db::query("SELECT a.*,b.tag_name FROM weblog as a,tags as b WHERE a.tag_id=b.id LIMIT 10,2");
        return $this->fetch('index',['loglist' => $data]);
    }

    public function message() {
        if($this->request->isPost()){
            $param = $this->request->param();
            if (model('message')->data($param)->save()) {
                return true;
            } else {
                return false;
            }
        }
        return false;
    }
}
