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


use app\admin\model\Role;
use app\common\service\BaseService;

/**
 * 角色管理-服务类
 * @author 牧羊人
 * @since 2020/7/2
 * Class RoleService
 * @package app\admin\service
 */
class RoleService extends BaseService
{
    /**
     * 构造函数
     * @author 牧羊人
     * @since 2020/7/2
     * RoleService constructor.
     */
    public function __construct()
    {
        $this->model = new Role();
    }
}