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

namespace app\admin\command;

use think\console\Command;
use think\console\Input;
use think\console\input\Argument;
use think\console\input\Option;
use think\console\Output;

/**
 * 脚本指令
 *
 * 备注：1、php think hello
 *      2、php think hello 牧羊人
 *      3、php think hello 牧羊人 --city 南京市
 * @author 牧羊人
 * @since 2020-04-21
 */
class Hello extends Command
{

    /**
     * 任务配置
     */
    protected function configure()
    {
        // 任务描述
        $this->setName('hello')
            ->addArgument('name', Argument::OPTIONAL, "牧羊人")
            ->addOption('city', null, Option::VALUE_REQUIRED, '南京市')
            ->setDescription('Say Hello');
    }

    /**
     * 执行句柄
     *
     * @param Input $input
     * @param Output $output
     * @return int|null
     */
    protected function execute(Input $input, Output $output)
    {
        // 请求开始
        $output->writeln('请求开始：' . date('Y-m-d H:i:s'));

        // 处理过程
        $name = trim($input->getArgument('name'));
        $name = $name ?: 'thinkphp';
        if ($input->hasOption('city')) {
            $city = PHP_EOL . 'From ' . $input->getOption('city');
        } else {
            $city = '';
        }
        $output->writeln("Hello," . $name . '!' . $city);

        // 请求结束
        $output->writeln("请求结束:" . date('Y-m-d H:i:s'));
    }

}