<?php


namespace app\admin\service;


use app\admin\model\Article;
use app\common\service\BaseService;

/**
 * 文章管理-服务类
 * @author 牧羊人
 * @since 2020/7/4
 * Class ArticleService
 * @package app\admin\service
 */
class ArticleService extends BaseService
{
    /**
     * 构造函数
     * @author 牧羊人
     * @since 2020/7/4
     * ArticleService constructor.
     */
    public function __construct()
    {
        $this->model = new Article();
    }

    /**
     * 添加或编辑
     * @return array
     * @since 2020/7/4
     * @author 牧羊人
     */
    public function edit()
    {
        $data = request()->param();
        // 封面处理
        $cover = trim($data['cover']);
        if (strpos($cover, "temp")) {
            $data['cover'] = save_image($cover, 'article');
        } else {
            $data['cover'] = str_replace(IMG_URL, "", $data['cover']);
        }
        // 文章图集
        $imgsList = trim($data['imgs']);
        if ($imgsList) {
            $imgArr = explode(',', $imgsList);
            foreach ($imgArr as $key => $val) {
                if (strpos($val, "temp")) {
                    //新上传图片
                    $img_str[] = save_image($val, 'article');
                } else {
                    //过滤已上传图片
                    $img_str[] = str_replace(IMG_URL, "", $val);
                }
            }
        }
        $data['imgs'] = serialize($img_str);
        //内容处理
        save_image_content($data['content'], $data['title'], "article");
        return parent::edit($data); // TODO: Change the autogenerated stub
    }
}