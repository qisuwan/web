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
*@param string $remark    日志备注
*/
function insert_admin_log($remark)
{
    if (session('?admin_auth')) {
        db('adminLog')->insert([
            'admin_id'    => session('admin_user.id'),
            'username'    => session('admin_user.username'),
            'useragent'   => request()->server('HTTP_USER_AGENT'),
            'ip'          => request()->ip(),
            'url'         => request()->url(true),
            'method'      => request()->method(),
            'type'        => request()->type(),
            'param'       => json_encode(request()->param()),
            'remark'      => $remark,
            'create_time' => time(),
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
 * 修改扩展的配置文件
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

function is_admin_login(){
    $admin = session('admin_user');
    if(empty($admin)){
        return 0;
    }else{
        return $admin['id'];
    }
}