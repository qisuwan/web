<?php
namespace app\admin\controller;

use app\common\controller\Base;

class Index extends Base{
	protected $noLogin = ['login'];    //放入不需要检测是否登录的方法
	public function index(){
		// 服务器信息
        $server = [
            'os'                  => PHP_OS, // 服务器操作系统
            'sapi'                => PHP_SAPI, // 服务器软件
            'version'             => PHP_VERSION, // PHP版本
            'mysql'               => db()->query('select VERSION() as version'), // mysql 版本
            'root'                => $_SERVER['DOCUMENT_ROOT'], // 当前运行脚本所在的文档根目录
            'max_execution_time'  => ini_get('max_execution_time') . 's', // 最大执行时间
            'upload_max_filesize' => ini_get('upload_max_filesize'), // 文件上传限制
            'memory_limit'        => ini_get('memory_limit'), // 允许内存大小
            'date'                => date('Y-m-d H:i:s', time()), // 服务器时间
        ];
        return $this->fetch('index', ['shouye' => 'layui-this', 'server' => $server]);
	}

	public function login(){
        if($this->request->isPost()){
            $data = json_decode($_POST['data']);
            $result = model('admin')->where('username','eq',$data->username)->where('password','eq',md5($data->password))->find();
            if($result){
                if($result['status']==0){
                    return false;
                }else{
                    //保存状态
                    $admin = [
                        'id'  =>    $result['id'],
                        'name'    =>  $result['username']
                    ];
                    session('admin_user',$admin);
                    edit_extra_config('logtime',[
                        'last_login_time' => $result['last_login_time'],
                        'last_login_ip' =>  $result['last_login_ip'],
                        'login_count'   => $result['login_count'],
                    ]);
                    update_admin_login($result['login_count']);
                    insert_admin_log("成功登录系统");
                    return "index";
                }
            }else{
                return false;
            }
        }
        return $this->fetch('login');
    }

	public function changePassword(){
	    if($this->request->isPost()){
            $param = $this->request->param();
            // 验证条件
            $param['new_password'] != $param['rep_password'] && $this->error('两次密码不一致');
            $admin = model('admin')->where('id', session('admin_user.id'))->find();
            $admin['password'] != md5($param['password']) && $this->error('旧密码错误');
            $data = ['id' => session('admin_user.id'), 'password' => $param['new_password']];
            if (model('admin')->isUpdate()->save($data)) {
                insert_admin_log("修改密码");
                $this->success('更新成功', url('admin/index/index'));
            } else {
                $this->error($this->errorMsg);
            }
        }
        return $this->fetch('changePassword');
    }
    public function siteInfo(){
	    if($this->request->isPost()){
            $param = $this->request->param();
            if(edit_extra_config('website',$param)){
                insert_admin_log("修改网站信息");
                $this->success('更新成功',url('admin/index/index'));
            }else{
                $this->error($this->errorMsg);
            }
        }
        return $this->fetch('siteInfo');
    }

	//清除缓存
	public function clear()
    {
        clear_cache();
        insert_admin_log("清除缓存");
        $this->success('清除成功');
    }
}
?>