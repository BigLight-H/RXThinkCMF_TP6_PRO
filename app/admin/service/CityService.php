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


use app\admin\model\City;
use app\common\service\BaseService;

/**
 * 城市管理-服务类
 * @author 牧羊人
 * @since 2020/7/3
 * Class CityService
 * @package app\admin\service
 */
class CityService extends BaseService
{
    /**
     * 构造函数
     * @author 牧羊人
     * @since 2020/7/3
     * CityService constructor.
     */
    public function __construct()
    {
        $this->model = new City();
    }

    /**
     * 获取城市列表
     * @return array
     * @since 2020/7/3
     * @author 牧羊人
     */
    public function getList()
    {
        // 查询条件
        $map = [
            ['pid', '>=', 1],
        ];
        $list = $this->model->getAll($map);
        //返回结果
        $message = array(
            "msg" => '操作成功',
            "code" => 0,
            "data" => $list,
            "count" => count($list),
        );
        return $message;
    }
}