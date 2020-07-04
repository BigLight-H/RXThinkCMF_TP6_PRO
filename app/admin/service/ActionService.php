<?php


namespace app\admin\service;


use app\admin\model\Action;
use app\common\service\BaseService;

/**
 * 用户行为-服务类
 * @author 牧羊人
 * @since 2020/7/3
 * Class ActionService
 * @package app\admin\service
 */
class ActionService extends BaseService
{
    /**
     * 构造函数
     * @author 牧羊人
     * @since 2020/7/3
     * ActionService constructor.
     */
    public function __construct()
    {
        $this->model = new Action();
    }
}