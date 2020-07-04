<?php


namespace app\admin\service;


use app\admin\model\UserLevel;
use app\common\service\BaseService;

/**
 * 会员等级-服务类
 * @author 牧羊人
 * @since 2020/7/3
 * Class UserLevelService
 * @package app\admin\service
 */
class UserLevelService extends BaseService
{
    /**
     * 构造函数
     * @author 牧羊人
     * @since 2020/7/3
     * UserLevelService constructor.
     */
    public function __construct()
    {
        $this->model = new UserLevel();
    }
}