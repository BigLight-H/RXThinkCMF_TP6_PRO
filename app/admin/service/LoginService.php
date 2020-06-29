<?php
// +----------------------------------------------------------------------
// | RXThinkCMF框架 [ RXThinkCMF ]
// +----------------------------------------------------------------------
// | 版权所有 2017~2020 南京RXThinkCMF研发中心
// +----------------------------------------------------------------------
// | 官方网站: http://www.rxthink.cn
// +----------------------------------------------------------------------
// | Author: 牧羊人 <1175401194@qq.com>
// +----------------------------------------------------------------------

namespace app\admin\service;

use app\common\model\system\Admin;
use app\common\service\BaseService;

/**
 * 系统登录服务
 *
 * @author 牧羊人
 * @since 2020-04-21
 */
class LoginService extends BaseService
{

    /**
     * 构造函数
     * LoginService constructor.
     */
    public function __construct()
    {
        $this->model = new Admin();
    }

    /**
     * 系统登录
     * @param $param 参数
     * @return array
     * @author 牧羊人
     * @since 2020/4/22
     */
    public function login($param)
    {
        // 登录用户名验证
        if (!$param['admin_name']) {
            return message(MESSAGE_PARAMETER_MISSING);
        }
        // 登录密码验证
        if (!$param['admin_password']) {
            return message(MESSAGE_PARAMETER_MISSING);
        }
        // 根据用户名获取用户信息

        $jwt = new \Jwt();
        $token = $jwt->getToken(1);
        return message("登录成功");
    }

}