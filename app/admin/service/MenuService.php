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


use app\admin\model\Menu;
use app\common\service\BaseService;

/**
 * 菜单管理-服务类
 * @author 牧羊人
 * @since: 2020/6/30
 * Class MenuService
 * @package app\admin\service
 */
class MenuService extends BaseService
{
    /**
     * 构造函数
     * MenuService constructor.
     */
    public function __construct()
    {
        $this->model = new Menu();
    }

    /**
     * 添加或编辑
     * @return array
     * @throws \think\db\exception\BindParamException
     * @author 牧羊人
     * @since 2020/7/3
     */
    public function edit()
    {
        // 请求参数
        $data = request()->param();
        $result = $this->model->edit($data);
        if (!$result) {
            return message("操作失败", false);
        }

        // 上级菜单设置隐藏和显示，默认同步更新子级菜单
        $menuList = $this->model->getChilds($result, true);
        foreach ($menuList as $val) {
            // 设置状态值
            $menuMod = new Menu();
            $v = [
                'id' => $val['id'],
                'status' => $data['status'],
                'is_public' => $data['is_public'],
            ];
            $menuMod->edit($v);

            // 获取子级
            $children = $val['children'];
            if (is_array($children) && !empty($children)) {
                foreach ($children as $vt) {
                    $item = [
                        'id' => $vt['id'],
                        'status' => $data['status'],
                        'is_public' => $data['is_public'],
                    ];
                    $menuMod = new Menu();
                    $menuMod->edit($item);

                    // 更新子级菜单
                    $children2 = $vt['children'];
                    foreach ($children2 as $vo) {
                        $subItem = [
                            'id' => $vo['id'],
                            'status' => $data['status'],
                            'is_public' => $data['is_public'],
                        ];
                        $menuMod = new Menu();
                        $menuMod->edit($subItem);
                    }
                }
            }
        }

        // 节点参数
        $func = isset($data['func']) ? $data['func'] : "";
        // URL地址
        $url = trim($data['url']);
        if ($data['type'] == 3 && $func && $url) {
            $item = explode("/", $url);
            if (count($item) == 3) {
                // 模块名
                $module = $item[1];
                $funcList = explode(",", $func);
                foreach ($funcList as $val) {
                    $data = [];
                    if ($val == 1) {
                        // 列表
                        $funcInfo = $menuMod->where("pid", $result)
                            ->where("name", "列表")
                            ->find();
                        $data = [
                            'id' => isset($funcInfo['id']) ? intval($funcInfo['id']) : 0,
                            'name' => "列表",
                            'url' => "/{$module}/list",
                            'permission' => "sys:{$module}:list",
                            'pid' => $result,
                            'type' => 4,
                            'status' => 1,
                            'is_public' => 2,
                            'sort' => $val,
                        ];
                    } else if ($val == 5) {
                        // 添加
                        $funcInfo = $menuMod->where("pid", $result)
                            ->where("name", "添加")
                            ->find();
                        $data = [
                            'id' => isset($funcInfo['id']) ? intval($funcInfo['id']) : 0,
                            'name' => "添加",
                            'url' => "/{$module}/edit",
                            'permission' => "sys:{$module}:add",
                            'pid' => $result,
                            'type' => 4,
                            'status' => 1,
                            'is_public' => 2,
                            'sort' => $val,
                        ];
                    } else if ($val == 10) {
                        // 修改
                        $funcInfo = $menuMod->where("pid", $result)
                            ->where("name", "修改")
                            ->find();
                        $data = [
                            'id' => isset($funcInfo['id']) ? intval($funcInfo['id']) : 0,
                            'name' => "修改",
                            'url' => "/{$module}/edit",
                            'permission' => "sys:{$module}:edit",
                            'pid' => $result,
                            'type' => 4,
                            'status' => 1,
                            'is_public' => 2,
                            'sort' => $val,
                        ];
                    } else if ($val == 15) {
                        // 删除
                        $funcInfo = $menuMod->where("pid", $result)
                            ->where("name", "删除")
                            ->find();
                        $data = [
                            'id' => isset($funcInfo['id']) ? intval($funcInfo['id']) : 0,
                            'name' => "删除",
                            'url' => "/{$module}/drop",
                            'permission' => "sys:{$module}:drop",
                            'pid' => $result,
                            'type' => 4,
                            'status' => 1,
                            'is_public' => 2,
                            'sort' => $val,
                        ];
                    } else if ($val == 20) {
                        // 详情
                        $funcInfo = $menuMod->where("pid", $result)
                            ->where("name", "详情")
                            ->find();
                        $data = [
                            'id' => isset($funcInfo['id']) ? intval($funcInfo['id']) : 0,
                            'name' => "详情",
                            'url' => "/{$module}/detail",
                            'permission' => "sys:{$module}:detail",
                            'pid' => $result,
                            'type' => 4,
                            'status' => 1,
                            'is_public' => 2,
                            'sort' => $val,
                        ];
                    } else if ($val == 25) {
                        // 状态
                        $funcInfo = $menuMod->where("pid", $result)
                            ->where("name", "状态")
                            ->find();
                        $data = [
                            'id' => isset($funcInfo['id']) ? intval($funcInfo['id']) : 0,
                            'name' => "状态",
                            'url' => "/{$module}/setStatus",
                            'permission' => "sys:{$module}:status",
                            'pid' => $result,
                            'type' => 4,
                            'status' => 1,
                            'is_public' => 2,
                            'sort' => $val,
                        ];
                    } else if ($val == 30) {
                        // 批量删除
                        $funcInfo = $menuMod->where("pid", $result)
                            ->where("name", "批量删除")
                            ->find();
                        $data = [
                            'id' => isset($funcInfo['id']) ? intval($funcInfo['id']) : 0,
                            'name' => "批量删除",
                            'url' => "/{$module}/batchDrop",
                            'permission' => "sys:{$module}:batchDrop",
                            'pid' => $result,
                            'type' => 4,
                            'status' => 1,
                            'is_public' => 2,
                            'sort' => $val,
                        ];
                    } else if ($val == 35) {
                        // 添加子级
                        $funcInfo = $menuMod->where("pid", $result)
                            ->where("name", "添加子级")
                            ->find();
                        $data = [
                            'id' => isset($funcInfo['id']) ? intval($funcInfo['id']) : 0,
                            'name' => "添加子级",
                            'url' => "/{$module}/addz",
                            'permission' => "sys:{$module}:addz",
                            'pid' => $result,
                            'type' => 4,
                            'status' => 1,
                            'is_public' => 2,
                            'sort' => $val,
                        ];
                    } else if ($val == 40) {
                        // 全部展开
                        $funcInfo = $menuMod->where("pid", $result)
                            ->where("name", "全部展开")
                            ->find();
                        $data = [
                            'id' => isset($funcInfo['id']) ? intval($funcInfo['id']) : 0,
                            'name' => "全部展开",
                            'url' => "/{$module}/expand",
                            'permission' => "sys:{$module}:expand",
                            'pid' => $result,
                            'type' => 4,
                            'status' => 1,
                            'is_public' => 2,
                            'sort' => $val,
                        ];
                    } else if ($val == 45) {
                        // 全部展开
                        $funcInfo = $menuMod->where("pid", $result)
                            ->where("name", "全部折叠")
                            ->find();
                        $data = [
                            'id' => isset($funcInfo['id']) ? intval($funcInfo['id']) : 0,
                            'name' => "全部折叠",
                            'url' => "/{$module}/collapse",
                            'permission' => "sys:{$module}:collapse",
                            'pid' => $result,
                            'type' => 4,
                            'status' => 1,
                            'is_public' => 2,
                            'sort' => $val,
                        ];
                    }
                    $menuMod = new Menu();
                    $menuMod->edit($data);
                }
            }
        }
        return message();
    }

    /**
     * 获取数据列表
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @since: 2020/6/30
     * @author 牧羊人
     */
    public function getList()
    {
        $list = $this->model->getList([], 'id asc');
        if ($list) {
            foreach ($list as &$val) {
                if (intval($val['type']) <= 2) {
                    $val['open'] = true;
                } else {
                    $val['open'] = false;
                }
            }
        }
        return message("操作成功", true, $list);
    }

}