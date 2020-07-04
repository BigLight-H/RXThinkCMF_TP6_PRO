<?php


namespace app\admin\widget;


use think\facade\View;
use think\template\TagLib;

/**
 * 图标标签组件
 * @author 牧羊人
 * @since 2020/7/3
 * Class Icon
 * @package app\admin\taglib
 */
class Icon extends TagLib
{
    // 自定义标签列表
    protected $tags = [
        'picker' => ['attr' => 'name', 'close' => 0],
    ];

    /**
     * 图标选择组件
     * @param $tag 标签参数
     * @return string
     * @author 牧羊人
     * @since 2020/7/3
     */
    public function tagPicker($tag)
    {
        // 取消模板布局
        app()->view->layout(false);
        // 组件名称
        $name = trim($tag['name']);
        // 组件值
        $value = $tag['value'];
        // 绑定数据源
        View::assign("iconName", $name);
        View::assign("iconValue", "<?php echo $value?>");
        return View::fetch("widget/icon_picker");
    }
}