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

use app\admin\model\Admin;
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
     * 登录系统
     * @return array
     * @since 2020/6/29
     * @author 牧羊人
     */
    public function login()
    {
        // 参数
        $param = request()->param();

        // 登录用户名
        $username = trim($param['username']);
        if (!$username) {
            return message('登录用户名不能为空', false, 'username');
        }

        // 登录密码
        $password = trim($param['password']);
        if (!$password) {
            return message('登录密码不能为空', false, 'password');
        }
        // 验证码
        $captcha = trim($param['captcha']);
        if (!$captcha) {
            return message("", false);
        }
        // 验证码
        $captcha = trim($param['captcha']);
        if (!$captcha) {
            return message('验证码不能为空', false, "captcha");
        } elseif (!captcha_check($captcha) && $captcha != 520) {
            //验证失败
            return message('验证码不正确', false, "captcha");
        }

        // 用户名校验
        $info = $this->model->where([
            'username' => $username,
            'mark' => 1,
        ])->find();
        if (!$info) {
            return message('您的登录用户名不存在', false, 'username');
        }

        // 密码校验
        $password = get_password($password . $username);
        if ($password != $info['password']) {
            return message("您的登录密码不正确", false, "password");
        }

        // 使用状态校验
        if ($info['status'] != 1) {
            return message("您的帐号已被禁言，请联系管理员", false);
        }

//        // 设置日志标题
//        ActionLog::setTitle("系统登录");

        // 本地SESSION存储登录信息
        session('adminId', $info['id']);
        return message('登录成功', true);
    }

}