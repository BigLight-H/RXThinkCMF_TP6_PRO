<?php


namespace app\admin\service;


use app\admin\model\Level;
use app\common\service\BaseService;

/**
 * 职级管理-服务类
 * @author 牧羊人
 * @since: 2020/6/30
 * Class LevelService
 * @package app\admin\service
 */
class LevelService extends BaseService
{
    /**
     * 构造函数
     * LevelService constructor.
     */
    public function __construct()
    {
        $this->model = new Level();
    }

}