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


use app\admin\model\ActionLog;
use app\common\service\BaseService;

/**
 * 行为日志-服务类
 * @author 牧羊人
 * @since 2020/7/3
 * Class ActionLogService
 * @package app\admin\service
 */
class ActionLogService extends BaseService
{
    /**
     * 构造函数
     * @author 牧羊人
     * @since 2020/7/3
     * ActionLogService constructor.
     */
    public function __construct()
    {
        $this->model = new ActionLog();
    }
}