<?php


namespace app\admin\service;


use app\admin\model\Position;
use app\common\service\BaseService;

/**
 * 岗位管理-服务类
 * @author 牧羊人
 * @since 2020/7/1
 * Class PositionService
 * @package app\admin\service
 */
class PositionService extends BaseService
{
    /**
     * 构造函数
     * PositionService constructor.
     */
    public function __construct()
    {
        $this->model = new Position();
    }
}