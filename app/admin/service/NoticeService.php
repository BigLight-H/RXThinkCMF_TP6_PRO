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


use app\admin\model\Notice;
use app\common\service\BaseService;

/**
 * 通知公告-服务类
 * @author 牧羊人
 * @since 2020/7/5
 * Class NoticeService
 * @package app\admin\service
 */
class NoticeService extends BaseService
{
    /**
     * 构造函数
     * @author 牧羊人
     * @since 2020/7/5
     * NoticeService constructor.
     */
    public function __construct()
    {
        $this->model = new Notice();
    }

    /**
     * 获取数据列表
     * @return array
     * @since 2020/7/5
     * @author 牧羊人
     */
    public function getList()
    {
        $param = request()->param();
        // 查询条件
        $map = [];
        // 通知来源
        $source = isset($param['source']) ? trim($param['source']) : 0;
        if ($source) {
            $map[] = ['source', '=', "$source"];
        }
        return parent::getList($map); // TODO: Change the autogenerated stub
    }

    /**
     * 添加或编辑
     * @return array
     * @since 2020/7/5
     * @author 牧羊人
     */
    public function edit()
    {
        // 参数
        $data = request()->param();
        // 发布状态
        $status = intval($data['status']);
        if ($status == 3) {
            $data['publish_time'] = strtotime($data['publish_time']);
        }
        return parent::edit($data); // TODO: Change the autogenerated stub
    }
}