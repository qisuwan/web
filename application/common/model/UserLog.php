<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/1/10
 * Time: 15:27
 */

namespace app\common\model;

use think\Model;

class UserLog extends Model
{
    protected $type=[
        'create_time'	 => 'datetime'
    ];
}