<?php
namespace app\index\controller;

use think\Controller;
use think\Db;

class Index extends Controller
{
    public function index() {
        $user = model('user_log')->where('ip',$this->request->ip())->order("create_time","desc")->find();
        $user == null ? insert_user_log() : insert_user_log($user['create_time']);
        $data = Db::query("SELECT a.*,b.tag_name FROM weblog as a,tags as b WHERE a.tag_id=b.id LIMIT 10,2");
        $user_ip = model('user_log')->distinct(true)->field('ip')->select();
        return $this->fetch('index',['loglist' => $data, 'count' => count($user_ip)]);
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
