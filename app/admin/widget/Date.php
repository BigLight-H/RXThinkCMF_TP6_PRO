<?php


namespace app\admin\widget;


use think\facade\View;
use think\template\TagLib;

/**
 * 日期标签组件
 * @author 牧羊人
 * @since 2020/7/3
 * Class Date
 * @package app\admin\taglib
 */
class Date extends TagLib
{
    // 自定义标签列表
    protected $tags = [
        'select' => ['attr' => 'param,value', 'close' => 0],
    ];

    /**
     * 日期选择标签
     * @param $tag 标签参数
     * @return string
     * @author 牧羊人
     * @since 2020/7/4
     */
    public function tagSelect($tag)
    {
        // 组件参数
        $param = trim($tag['param']);
        // 组件值
        $value = $tag['value'];
        // 拆解参数
        $item = explode("|", $param);
        // 组件名称
        $name = trim($item[0]);
        // 提示语
        $tips = trim($item[1]);
        // 日期类型
        $type = trim($item[2]);

        // 绑定数据
        View::assign("dateName", $name);
        View::assign("dateTips", $tips);
        View::assign("dateType", $type);
        View::assign("dateValue", "{" . $value . "}");
        // 渲染模板
        return View::fetch("widget/date_select");
    }
}