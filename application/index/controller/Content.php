<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/1/4
 * Time: 9:31
 */

namespace app\index\controller;

use think\Controller;
use think\Db;

class Content extends Controller
{
    public function index() {
        $data = Db::query("SELECT a.*,b.tag_name FROM weblog as a,tags as b WHERE a.tag_id=b.id LIMIT 9");
        $mess = model('message')->all();
        $user_ip = model('user_log')->distinct(true)->field('ip')->select();
        return $this->fetch('index',[
            'title' => '内容',
            'loglist' => $data,
            'mess'  => $mess,
            'count' => count($user_ip),
        ]);
    }
    public function message() {
        return $this->fetch('mess',['target'=> url('index/message')]);
    }
    public function comment($id) {
        if($this->request->isPost()) {
            $param = $this->request->param();
            $param['weblog_id'] = $id;
            if (model('comment')->data($param)->save()) {
                return true;
            } else {
                return false;
            }
        }
        return $this->fetch('mess');
    }

    public function show($id) {
        $data = Db::query("SELECT a.*,b.tag_name FROM weblog as a,tags as b WHERE a.tag_id=b.id AND a.id='$id'");
        $mess = model('comment')->where('weblog_id',$id)->select();
        $user_ip = model('user_log')->distinct(true)->field('ip')->select();
        return $this->fetch("show",['data' => $data[0], 'mess' => $mess, 'count' => count($user_ip)]);
    }
}