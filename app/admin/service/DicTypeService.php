<?php
// +----------------------------------------------------------------------
// | RXThinkCMF框架 [ RXThinkCMF ]
// +----------------------------------------------------------------------
// | 版权所有 2017~2020 南京RXThinkCMF研发中心
// +----------------------------------------------------------------------
// | 官方网站: http://www.rxthink.cn
// +----------------------------------------------------------------------
// | Author: 牧羊人 <1175401194@qq.com>
// +----------------------------------------------------------------------

namespace app\admin\service;


use app\admin\model\DicType;
use app\common\service\BaseService;

/**
 * 字典类型-服务类
 * @author 牧羊人
 * @since 2020/7/2
 * Class DicTypeService
 * @package app\admin\service
 */
class DicTypeService extends BaseService
{
    /**
     * 构造函数
     * @author 牧羊人
     * @since 2020/7/2
     * DicTypeService constructor.
     */
    public function __construct()
    {
        $this->model = new DicType();
    }
}