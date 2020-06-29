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

namespace app\admin\controller;

use app\admin\service\LoginService;
use app\common\controller\Backend;

/**
 * 后台登陆控制器
 *
 * @author 牧羊人
 * @since 2020-04-22
 */
class Login extends Backend
{
    /**
     * 初始化方法
     * @author 牧羊人
     * @since 2020/4/22
     */
    public function initialize()
    {
        parent::initialize();
        $this->service = new LoginService();
    }

    /**
     * 系统登录
     * @author 牧羊人
     * @since 2020/4/22
     */
    public function login()
    {
        $result = $this->service->login($this->param);
        $this->jsonReturn($result);
    }
}