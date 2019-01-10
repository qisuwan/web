<?php
namespace app\test\controller;

use think\Controller;
use think\Db;

class Dbtest extends Controller{
    public function index(){

    }
    public function form(){
        if($this->request->isPost())
        {
            dump($this->request->param());
        }
        return $this->fetch('index');
    }
}
?>

