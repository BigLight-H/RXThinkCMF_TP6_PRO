<?php


namespace app\admin\controller;


use app\BaseController;

/**
 * 空控制器
 * @author 牧羊人
 * @since 2020/7/4
 * Class Error
 * @package app\admin\controller
 */
class Error extends BaseController
{
    /**
     * 初始化
     * @author 牧羊人
     * @since 2020/7/4
     */
    protected function initialize()
    {
        parent::initialize(); // TODO: Change the autogenerated stub
    }

    /**
     * 错误页面
     * @return mixed
     * @since 2020/7/4
     * @author 牧羊人
     */
    public function index()
    {
        return $this->render("public/404");
    }
}