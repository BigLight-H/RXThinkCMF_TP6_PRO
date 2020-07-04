<?php


namespace app\admin\service;


use app\admin\model\AdSort;
use app\common\service\BaseService;

/**
 * 广告位管理-服务类
 * @author 牧羊人
 * @since 2020/7/2
 * Class AdSortService
 * @package app\admin\service
 */
class AdSortService extends BaseService
{
    /**
     * 构造函数
     * @author 牧羊人
     * @since 2020/7/2
     * AdSortService constructor.
     */
    public function __construct()
    {
        $this->model = new AdSort();
    }
}