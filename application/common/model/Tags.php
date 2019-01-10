<?php
namespace app\common\model;

use app\common\model\Configm;

class Tags extends Configm{
	public function weblog(){
		return $this->hasMany('Weblog','tag_id','id');
	}
}
?>