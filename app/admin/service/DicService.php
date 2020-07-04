<?php


namespace app\admin\service;


use app\admin\model\Dic;
use app\common\service\BaseService;

/**
 * 字典管理-服务类
 * @author 牧羊人
 * @since 2020/7/2
 * Class DicService
 * @package app\admin\service
 */
class DicService extends BaseService
{
    /**
     * 构造函数
     * @author 牧羊人
     * @since 2020/7/2
     * DicService constructor.
     */
    public function __construct()
    {
        $this->model = new Dic();
    }
}