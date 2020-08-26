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

use app\admin\model\ActionLog;
use app\admin\service\LoginService;
use app\common\controller\Backend;
use think\View;

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
     * 登录首页
     * @return mixed
     * @author 牧羊人
     * @date 2019/4/18
     */
    public function index()
    {
        // 取消模板布局
        $this->app->view->layout(false);
        return \think\facade\View::fetch();
    }

    /**
     * 系统登录
     * @return mixed
     * @author 牧羊人
     * @date 2019/4/18
     */
    public function login()
    {
        if (IS_POST) {
            $result = $this->service->login();
            return $result;
        }
    }

    /**
     * 退出系统
     * @author 牧羊人
     * @since 2020/6/29
     */
    public function logout()
    {
        // 清空SESSION
        session('adminId', null);
        // 记录退出日志
        ActionLog::setTitle("系统退出");
        ActionLog::record();
        // 跳转登录页
        return redirect(url('/login/index'));
    }

}