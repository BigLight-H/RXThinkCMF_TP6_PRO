<?php


namespace app\admin\widget;


use think\facade\View;
use think\template\TagLib;

/**
 * 组件标签
 * @author 牧羊人
 * @since: 2020/6/30
 * Class Widget
 * @package app\admin\taglib
 */
class Widget extends TagLib
{

    // 自定义标签列表
    protected $tags = [
        // 非闭合(不需要/结尾)
        'query' => ['attr' => 'name', 'close' => 0],
        'add' => ['attr' => 'name,param', 'close' => 0],
        'edit' => ['attr' => 'name', 'close' => 0],
        'delete' => ['attr' => 'name', 'close' => 0],
        'detail' => ['attr' => 'name', 'close' => 0],
        'dall' => ['attr' => 'name', 'close' => 0],
        'expand' => ['attr' => 'name', 'close' => 0],
        'collapse' => ['attr' => 'name', 'close' => 0],
        'addz' => ['attr' => 'name', 'close' => 0],
        'btn' => ['attr' => 'name', 'close' => 0],
        'submit' => ['attr' => 'name,type', 'close' => 0],
    ];

    /**
     * 查询按钮组件
     * @param $tag 标签参数
     * @return string
     * @author 牧羊人
     * @since: 2020/6/30
     */
    public function tagQuery($tag)
    {
        // 取消模板布局
        app()->view->layout(false);
        // 标签名称
        $funcName = trim($tag['name']);
        $funcAuth = 'sys:' . strtolower(CONTROLLER_NAME) . ":index";
        View::assign("funcAuth", $funcAuth);
        View::assign("funcName", $funcName);
        return View::fetch("widget/func/query");
    }

    /**
     * 添加按钮组件
     * @param $tag 标签参数
     * @return mixed
     * @author 牧羊人
     * @since: 2020/6/30
     */
    public function tagAdd($tag)
    {
        // 取消模板布局
        app()->view->layout(false);
        // 节点名称
        $funcName = trim($tag['name']);
        // 节点参数
        $param = isset($tag['$param']) ? $tag['$param'] : [];
        View::assign("param", json_encode($param));
        return $this->tagFunc("add", 'layui-icon-add-1', $funcName);
    }

    /**
     * 编辑按钮组件
     * @param $tag 标签参数
     * @return string
     * @author 牧羊人
     * @since: 2020/6/30
     */
    public function tagEdit($tag)
    {
        // 取消模板布局
        app()->view->layout(false);
        // 节点名称
        $funcName = trim($tag['name']);
        $funcAuth = 'sys:' . strtolower(CONTROLLER_NAME) . ":edit";
        View::assign("funcAuth", $funcAuth);
        View::assign("funcName", $funcName);
        return View::fetch("widget/func/edit");
    }

    /**
     * 删除按钮组件
     * @param $tag 标签参数
     * @return string
     * @author 牧羊人
     * @since: 2020/6/30
     */
    public function tagDelete($tag)
    {
        // 取消模板布局
        app()->view->layout(false);
        // 节点名称
        $funcName = trim($tag['name']);
        $funcAuth = 'sys:' . strtolower(CONTROLLER_NAME) . ":drop";
        View::assign("funcAuth", $funcAuth);
        View::assign("funcName", $funcName);
        return View::fetch("widget/func/drop");
    }

    /**
     * 详情标签组件
     * @param $tag 标签参数
     * @return string
     * @author 牧羊人
     * @since 2020/7/3
     */
    public function tagDetail($tag)
    {
        // 取消模板布局
        app()->view->layout(false);
        // 节点名称
        $funcName = trim($tag['name']);
        $funcAuth = 'sys:' . strtolower(CONTROLLER_NAME) . ":detail";
        View::assign("funcAuth", $funcAuth);
        View::assign("funcName", $funcName);
        return View::fetch("widget/func/detail");
    }

    /**
     * 批量删除组件
     * @param $tag 标签参数
     * @return mixed|string
     * @author 牧羊人
     * @since: 2020/6/30
     */
    public function tagDall($tag)
    {
        // 取消模板布局
        app()->view->layout(false);
        // 节点名称
        $funcName = trim($tag['name']);
        return $this->tagFunc("batchDrop", 'layui-icon-delete', $funcName, "layui-btn-danger");
    }

    /**
     * 全部展开
     * @param $tag 标签参数
     * @return mixed
     * @author 牧羊人
     * @since 2020/7/2
     */
    public function tagExpand($tag)
    {
        // 取消模板布局
        app()->view->layout(false);
        // 节点名称
        $funcName = trim($tag['name']);
        return $this->tagFunc("expand", 'layui-icon-shrink-right', $funcName, "layui-btn-normal");
    }

    /**
     * 全部折叠
     * @param $tag 标签参数
     * @return mixed
     * @author 牧羊人
     * @since 2020/7/2
     */
    public function tagCollapse($tag)
    {
        // 取消模板布局
        app()->view->layout(false);
        // 节点名称
        $funcName = trim($tag['name']);
        return $this->tagFunc("collapse", 'layui-icon-spread-left', $funcName, "layui-btn-warm");
    }

    /**
     * 添加子级
     * @param $tag 标签参数
     * @return mixed
     * @author 牧羊人
     * @since 2020/7/2
     */
    public function tagAddz($tag)
    {
        // 取消模板布局
        app()->view->layout(false);
        // 节点名称
        $funcName = trim($tag['name']);
        return $this->tagFunc("addz", 'layui-icon-add-1', $funcName, "layui-btn-normal", 2);
    }

    /**
     * 自定义按钮
     * @param $tag 标签参数
     * @return mixed
     * @author 牧羊人
     * @since 2020/7/2
     */
    public function tagBtn($tag)
    {
        // 取消模板布局
        app()->view->layout(false);
        // 节点标识
        $funcEvent = trim($tag['event']);
        // 节点Icon
        $funcIcon = trim($tag['icon']);
        // 节点名称
        $funcName = trim($tag['name']);
        // 节点背景色
        $funcColor = isset($tag['color']) ? trim($tag['color']) : 'layui-btn-normal';
        // 按钮类型
        $funcType = isset($tag['type']) ? intval($tag['type']) : 2;
        return $this->tagFunc($funcEvent, $funcIcon, $funcName, $funcColor, $funcType);
    }

    /**
     * 自定义按钮
     * @param $funcAct 节点标识
     * @param $funcIcon 节点Icon
     * @param $funcName 节点名称
     * @param string $funcColor 节点背景色
     * @param int $funcType 点类型：1大按钮 2小按钮
     * @param array $param 节点参数
     * @return mixed
     * @since: 2020/6/30
     * @author 牧羊人
     */
    public function tagFunc($funcAct, $funcIcon, $funcName, $funcColor = '', $funcType = 1, $param = [])
    {
        // 取消模板布局
        app()->view->layout(false);
        $funcAuth = 'sys:' . lcfirst(CONTROLLER_NAME) . ":" . $funcAct;
        View::assign("funcAuth", $funcAuth);
        View::assign("funcAct", $funcAct);
        View::assign("funcIcon", $funcIcon);
        View::assign("funcName", $funcName);
        View::assign("funcColor", $funcColor);
        View::assign("funcType", $funcType);
        if (!empty($param)) {
            View::assign("param", json_encode($param));
        }
        return View::fetch("widget/func/func");
    }

    /**
     * 提交按钮组件
     * @param $tag 标签参数
     * @return string
     * @author 牧羊人
     * @since: 2020/6/30
     */
    public function tagSubmit($tag)
    {
        // 取消模板布局
        app()->view->layout(false);
        // 节点名称
        $name = trim($tag['name']);
        // 节点类型
        $type = isset($tag['type']) ? intval($tag['param']) : 1;
        $itemList = explode(',', $name);
        if (is_array($itemList)) {
            foreach ($itemList as $val) {
                $item = explode('|', $val);
                View::assign('button_' . $item[0], $item[0]);
                View::assign('button_' . $item[0] . '_title', $item[1]);
            }
        }
        View::assign("button_type", $type);
        return View::fetch("widget/submit_btn");
    }

}