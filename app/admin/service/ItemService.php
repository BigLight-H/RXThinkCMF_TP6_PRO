<?php


namespace app\admin\service;


use app\admin\model\Item;
use app\common\service\BaseService;

/**
 * 站点管理-服务类
 * @author 牧羊人
 * @since 2020/7/2
 * Class ItemService
 * @package app\admin\service
 */
class ItemService extends BaseService
{
    /**
     * 构造函数
     * @author 牧羊人
     * @since 2020/7/2
     * ItemService constructor.
     */
    public function __construct()
    {
        $this->model = new Item();
    }

    /**
     * 添加或编辑
     * @return array
     * @since 2020/7/2
     * @author 牧羊人
     */
    public function edit()
    {
        $data = request()->param();

        // 图片处理
        $image = trim($data['image']);
        if (!$data['id'] && !$image) {
            return message('请上传站点图片', false);
        }
        if (strpos($image, "temp")) {
            $data['image'] = save_image($image, 'item');
        } else {
            $data['image'] = str_replace(IMG_URL, "", $data['image']);
        }
        return parent::edit($data); // TODO: Change the autogenerated stub
    }
}