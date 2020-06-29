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
use app\common\model\system\Admin;
use think\App;
use think\facade\Console;

class Test extends Backend
{
    public function __construct(App $app)
    {
        parent::__construct($app);
        $this->model = new Admin();
    }

    public function test()
    {
        phpinfo();
    }

    /**
     * 调用指令
     *
     * @return mixed
     */
    public function hello()
    {
        $name = "牧羊人";
        $output = Console::call('hello', [$name]);
        return $output->fetch();
    }

    /**
     * 测试方法
     */
    public function index()
    {
        // 测试分页查询
        $map = [
            'query' => [
                ['mark', '=', 1],
            ],
            'page' => 1,
            'perpage' => 10,
            'order' => ['admin_id asc', 'admin_name asc'],
        ];
        $result = $this->model->pageList($map, function ($info) {
            return [
                'admin_id' => $info['admin_id'],
                'admin_name' => $info['admin_name'],
            ];
        });
        print_r($result);
        exit;

        // 设置缓存
        $this->model->setCache("name", "牧羊人");
        // 获取缓存
        $cacheValue = $this->model->getCache("name");
        // 打印结果
        print_r($cacheValue);
        // 删除缓存
        $this->model->deleteCache("name");

        // 新增数据
        $admin = new Admin();
        $admin['admin_name'] = "牧羊人";
        $resut = $this->model->edit($admin);
        dump($resut ? "插入数据成功" : "插入数据失败");

        // 编辑数据
        $resut = $this->model->edit([
            'admin_id' => 23,
            'admin_name' => "牧羊人名称更新测试",
        ]);
        dump($resut ? "更新数据成功" : "更新数据失败");

        // 获取缓存数据
        $info = $this->model->getInfo(23);
        print_r($info);
        exit;

        // 删除记录
        $result = $this->model->drop(37);
        print_r($result);
        exit;

        // 获取记录总数
        $count = $this->model->getCount();
        print_r($count);
        exit;

        // 计算求和
        $sum = $this->model->getSum([], "admin_id");
        print_r($sum);
        exit;

        // 获取某个字段最大值
        $maxValue = $this->model->getMax([], "admin_id");
        print_r($maxValue);
        exit;

        // 获取某个字段的最小值
        $minValue = $this->model->getMin([], "admin_id");
        print_r($minValue);
        exit;

        // 获取某个字段的平均值
        $avgValue = $this->model->getAvg([], "admin_id");
        print_r($avgValue);
        exit;

        // 获取单条数据（直接查库）
        $info = $this->model->getOne([
            ['admin_id', '=', 28]
        ]);
        print_r($info);
        exit;

        // 根据ID获取单条数据（直接查库）
        $info = $this->model->getRow(28);
        print_r($info);
        exit;

        // 获取某一列的值
        $result = $this->model->getColumn([], "admin_id");
        print_r($result);
        exit;

        // 根据条件查询单条缓存记录
        $info = $this->model->getInfoByAttr([
            ['admin_name', '=', "牧羊人名称更新测试"],
        ], [], "admin_id desc");
        print_r($info);
        exit;

        // 查询数据列表（方法一）
        $map = [
            ['admin_name', '=', '牧羊人名称更新测试'],
        ];
        $result = $this->model->getList($map, "admin_id asc", "0,2", false);
        print_r($result);
        exit;

        // 查询数据列表（方法二）
        $query = [
            'query' => [
                ['admin_name', '=', "牧羊人名称更新测试"],
            ],
            'page' => 1,
            'perpage' => 2,
            'order' => ["admin_id asc"],
            'limit' => "0,2",
        ];
        $result = $this->model->getDataList($query, function ($info) {
            return [
                'admin_id' => $info['admin_id'],
                'admin_name' => $info['admin_name'],
            ];
        });
        print_r($result);
        exit;

        // 查询分页数据
        $query = [
            'query' => [
                ['admin_name', '=', "牧羊人名称更新测试"],
            ],
            'page' => 1,
            'perpage' => 2,
            'order' => ["admin_id asc"],
            'limit' => "0,2",
        ];
        $result = $this->model->pageData($query, function ($info) {
            return [
                'admin_id' => $info['admin_id'],
                'admin_name' => $info['admin_name'],
            ];
        });
        print_r($result);
        exit;

        // 获取数据表列表
        $result = $this->model->getTablesList();
        print_r($result);
        exit;

        // 判断某张表是否存在
        $result = $this->model->tableExists("ds_level");
        print_r($result);
        exit;

        // 删除指定表
        $result = $this->model->dropTable("ds_level");
        print_r($result);
        exit;

        // 获取指定表的列
        $result = $this->model->getFieldsList("ds_admin");
        print_r($result);
        exit;

        // 判断某个字段在表中是否存在
        $result = $this->model->fieldExists("ds_admin", "admin_id");
        print_r($result);
        exit;

        // 事务测试

        // 开启事务
        $this->model->startTrans();

        $resut = $this->model->edit([
            'admin_id' => 21,
            'admin_name' => "牧羊人名称更新测试123456",
        ]);
//        // 事务回滚
//        $this->model->rollback();
        // 提交事务
        $this->model->commit();


    }

}