<?php


namespace app\admin\service;


use app\admin\model\Dep;
use app\common\service\BaseService;

/**
 * 部门管理-服务类
 * @author 牧羊人
 * @since 2020/7/2
 * Class DepService
 * @package app\admin\service
 */
class DepService extends BaseService
{
    /**
     * 构造函数
     * @author 牧羊人
     * @since 2020/7/2
     * DepService constructor.
     */
    public function __construct()
    {
        $this->model = new Dep();
    }
}