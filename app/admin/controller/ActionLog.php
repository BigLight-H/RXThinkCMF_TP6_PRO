<?php


namespace app\admin\controller;


use app\admin\service\ActionLogService;
use app\common\controller\Backend;

/**
 * 行为日志-控制器
 * @author 牧羊人
 * @since 2020/7/3
 * Class Actionlog
 * @package app\admin\controller
 */
class ActionLog extends Backend
{
    /**
     * 初始化
     * @author 牧羊人
     * @since 2020/7/3
     */
    public function initialize()
    {
        parent::initialize(); // TODO: Change the autogenerated stub
        $this->model = new \app\admin\model\ActionLog();
        $this->service = new ActionLogService();
    }
}