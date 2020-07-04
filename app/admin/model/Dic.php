<?php


namespace app\admin\model;


use app\common\model\BaseModel;

/**
 * 字典-模型
 * @author 牧羊人
 * @since 2020/7/2
 * Class Dic
 * @package app\admin\model
 */
class Dic extends BaseModel
{
    // 设置数据表名
    protected $name = "dic";

    /**
     * 获取缓存信息
     * @param int $id 记录ID
     * @return \app\common\model\数据信息|mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @author 牧羊人
     * @since 2020/7/2
     */
    public function getInfo($id)
    {
        $info = parent::getInfo($id); // TODO: Change the autogenerated stub
        if ($info) {
            // 字典类型
            $dicTypeMod = new DicType();
            $dicTypeInfo = $dicTypeMod->getInfo($info['type_id']);
            if ($dicTypeInfo) {
                $info['typeName'] = $dicTypeInfo['name'];
            }
        }
        return $info;
    }
}