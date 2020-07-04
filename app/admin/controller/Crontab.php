<?php


namespace app\admin\controller;


use app\admin\service\CrontabService;
use app\common\controller\Backend;
use think\facade\View;

/**
 * 定时任务-控制器
 * @author 牧羊人
 * @since 2020/7/4
 * Class Crontab
 * @package app\admin\controller
 */
class Crontab extends Backend
{
    /**
     * 初始化
     * @author 牧羊人
     * @since 2020/7/4
     */
    public function initialize()
    {
        parent::initialize(); // TODO: Change the autogenerated stub
        $this->model = new \app\admin\model\Crontab();
        $this->service = new CrontabService();
    }

    /**
     * 数据列表页
     * @return mixed
     * @since 2020/7/4
     * @author 牧羊人
     */
    public function index()
    {
        // 任务类型
        View::assign("typeList", config("admin.crontab_type"));
        return parent::index(); // TODO: Change the autogenerated stub
    }

    /**
     * 添加或编辑
     * @return mixed
     * @since 2020/7/4
     * @author 牧羊人
     */
    public function edit()
    {
        // 任务类型
        View::assign("typeList", config("admin.crontab_type"));
        return parent::edit(); // TODO: Change the autogenerated stub
    }
}