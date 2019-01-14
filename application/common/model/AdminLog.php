<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/1/10
 * Time: 15:25
 */

namespace app\common\model;

use think\Model;

class AdminLog extends Model
{
    protected $type=[
        'create_time'	 => 'datetime'
    ];
}