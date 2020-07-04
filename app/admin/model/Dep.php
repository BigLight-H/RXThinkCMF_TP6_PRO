<?php


namespace app\admin\model;


use app\common\model\BaseModel;

/**
 * 部门-模型
 * @author 牧羊人
 * @since 2020/7/2
 * Class Dep
 * @package app\admin\model
 */
class Dep extends BaseModel
{
    // 设置数据表名
    protected $name = "dep";

    /**
     * 获取子级部门
     * @param int $pid 上级ID
     * @param bool $flag 是否获取子级
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     * @author 牧羊人
     * @since 2020/7/3
     */
    public function getChilds($pid = 0, $flag = false)
    {
        $list = [];
        $map = [
            'pid' => $pid,
            'mark' => 1,
        ];
        $result = $this->where($map)->order("sort asc")->select();
        if ($result) {
            foreach ($result as $val) {
                $id = (int)$val['id'];
                $info = $this->getInfo($id);
                if (!$info) {
                    continue;
                }
                if ($flag) {
                    $childList = $this->getChilds($id, 0);
                    $info['children'] = $childList;
                }
                $list[] = $info;
            }
        }
        return $list;
    }
}