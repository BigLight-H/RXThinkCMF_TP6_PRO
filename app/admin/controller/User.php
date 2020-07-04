<?php


namespace app\admin\controller;


use app\admin\service\UserService;
use app\common\controller\Backend;
use think\facade\View;

/**
 * 会员-控制器
 * @author 牧羊人
 * @since 2020/7/3
 * Class User
 * @package app\admin\controller
 */
class User extends Backend
{
    /**
     * 初始化
     * @author 牧羊人
     * @since 2020/7/3
     */
    public function initialize()
    {
        parent::initialize(); // TODO: Change the autogenerated stub
        $this->model = new \app\admin\model\User();
        $this->service = new UserService();
    }

    /**
     * 添加或编辑
     * @return mixed
     * @since 2020/7/3
     * @author 牧羊人
     */
    public function edit()
    {
        // 设备类型
        View::assign("typeList", config("admin.user_device"));
        // 用户来源
        View::assign("sourceList", config("admin.user_source"));
        // 性别
        View::assign("genderList", config("admin.gender_list"));
        return parent::edit([
//            'status' => 1,
        ]); // TODO: Change the autogenerated stub
    }
}