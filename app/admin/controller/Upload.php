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

namespace app\admin\controller;

use app\common\controller\Backend;

/**
 * 文件上传控制器
 *
 * @author 牧羊人
 * @since 2020-04-21
 */
class Upload extends Backend
{
    /**
     * 上传图片（支持多图片上传）
     * 备注：1、单文件：file
     *      2、多文件：file[],file[]
     *
     * @author 牧羊人
     * @since 2020-04-21
     */
    public function uploadImage()
    {
        // 错误提示语
        $error = "";
        // 上传图片
        $result = upload_image('file', '', $error);
        if (!$result) {
            return message($error);
        }
        // 多图片上传处理
        $list = [];
        if (is_array($result)) {
            foreach ($result as $val) {
                $list[] = IMG_URL . $val;
            }
        } else {
            $list = IMG_URL . $result;
        }
        return message("上传成功", true, $list);
    }

    /**
     * 上传文件(支持多文件上传)
     * 备注：1、单文件：file
     *      2、多文件：file[],file[]
     *
     * @author 牧羊人
     * @since 2020-04-21
     */
    public function uploadFile()
    {
        $error = "";
        // 上传文件(非图片)
        $result = upload_file('file', '', $error);
        if (!$result) {
            return message($error);
        }
        $list = [];
        if (is_array($result)) {
            foreach ($result as $val) {
                $list[] = IMG_URL . $val;
            }
        } else {
            $list = IMG_URL . $result;
        }
        return message("上传成功", true, $list);
    }

}