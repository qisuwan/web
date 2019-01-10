<?php
namespace app\common\model;

use app\common\model\Configm;

class Comment extends Configm{
	//对应关联
	public function blog(){
		return $this->belongsTo('Weblog','weblogId','id');
	}
}
?>