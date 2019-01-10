<?php
namespace app\common\model;

use think\Model;

class Configm extends Model{
	protected $autoWriteTimestamp = true;
	protected $updateTime = false;
//	protected $readonly = ['id'];
	protected $type=[
	    'id'             => 'integer',
	    'status'        => 'integer',
		'create_time'	 => 'datetime'
	];
}
?>