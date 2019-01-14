<?php

// 应用公共文件
/*
 * 循环等级输出标签
 *@param array $array   所有元素的数组集
 *@param int $pid   开始遍历的等级，默认为0（根）
 * */
function list_tag($array,$pid=0,$level=1){
    static $list = [];
    foreach ($array as $key => $val){
        if($val['pid']==$pid){
            $val['level'] = $level;
            $list[] = $val;
            unset($array[$key]);
            list_tag($array,$val['id'],$level+1);
        }
    }
    return $list;
}

/**
*保存操作日志
*@param string $remark    日志备注*
*/
function insert_admin_log($remark)
{
    if (session('?admin_user')) {
        db('admin_log')->insert([
            'admin_id'    => session('admin_user.id'),
            'username'    => session('admin_user.name'),
            'useragent'   => request()->server('HTTP_USER_AGENT'),
            'ip'          => request()->ip(),
            'url'         => request()->url(true),
            'method'      => request()->method(),
            'type'        => request()->type(),
            'param'       => json_encode(request()->param()),
            'remark'      => $remark,
            'create_time' => date("Y-m-d H:i:s"),
        ]);
    }
}
/*
 * 获取用户登录信息
 *@param time $date 上次登录的时间  默认值设置为网站开站时间2019-01-01
 * */
function insert_user_log($date = "2019-01-01") {
    $time1 = date("Y-m-d",strtotime($date)); //上次登录的时间
    $time2 = date("Y-m-d");  //当前时间
    $val =  ceil((strtotime($time2) - strtotime($time1)) / 86400);  //两次时间差值
    //两次时间大于1天才进行插入日志
    if($val > 0) {
        db('user_log')->insert([
            'useragent' => request()->server('HTTP_USER_AGENT'),
            'ip' => request()->ip(),
            'url' => request()->url(true),
            'method' => request()->method(),
            'type' => request()->type(),
            'create_time' => date("Y-m-d H:i:s"),
        ]);
    }
}
/**
 * 清除系统缓存
 */
function clear_cache($directory = null)
{
    $directory = empty($directory) ? ROOT_PATH . 'runtime/cache/' : $directory;
    if (is_dir($directory) == false) {
        return false;
    }
    $handle = opendir($directory);
    while (($file = readdir($handle)) !== false) {
        if ($file != "." && $file != "..") {
            is_dir($directory . '/' . $file) ? clear_cache($directory . '/' . $file) : unlink($directory . '/' . $file);
        }
    }
    if (readdir($handle) == false) {
        closedir($handle);
        rmdir($directory);
    }
}
/*
 * 修改扩展的配置文件 (默认设置为只能修改extra/文件夹下的配置)
 * @param string $file  需要修改的扩展配置名（即配置文件名）
 * @param, array $array  修改的配置
 * @return  bool
 * */
function edit_extra_config($name,$array){
    try {
        if (is_array($array) && config("?$name")) {
            $file = APP_PATH . 'extra/' . $name . '.php';
            $conf = include $file;
            foreach ($array as $key => $value) {
                $conf[$key] = $value;
            }
            $time = date('Y/m/d H:i:s');
            $str = "<?php\r\n/**\r\n * 由" . session('admin_user.name') . "修改.\r\n * $time\r\n */\r\nreturn [\r\n";
            foreach ($conf as $key => $value) {
                $str .= "\t'$key' => '$value',";
                $str .= "\r\n";
            }
            $str .= "];";
            file_put_contents($file, $str);
            return true;
        } else {
            return false;
        }
    }catch (\Exception $e){
        return false;
    }
}

/*
 * 更新admin的上次的登录信息
 * @param  int  $count    登录次数
 * */
function update_admin_login($count) {
    if(session('?admin_user')){
        db('admin')->where('id',session('admin_user.id'))->update([
            'last_login_time'   =>    date('Y-m-d H:i:s'),
            'last_login_ip'     =>    request()->ip(),
            'login_count'       =>    $count + 1,
        ]);
    }
}

/*
 * 检查登录
 * */
function is_admin_login(){
    $admin = session('admin_user');
    if(empty($admin)){
        return 0;
    }else{
        return $admin['id'];
    }
}

