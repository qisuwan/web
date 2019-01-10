<?php
namespace app\common\model;

use app\common\model\Configm;

class Admin extends Configm{
	
	public function setPasswordAttr($value){
		return md5($value);
	}
}
?>