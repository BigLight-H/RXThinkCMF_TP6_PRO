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

namespace app\common\middleware;

use Closure;

/**
 * 应用初始化
 *
 * @author 牧羊人
 * @since 2020-04-21
 */
class InitApp
{

    /**
     * 指定句柄
     *
     * @author 牧羊人
     * @since 2020-04-21
     */
    public function handle($request, Closure $next)
    {
        // 初始化系统常量
        $this->initSystemConstant();

        // 初始化消息中间件RabbitMQ常量
        $this->initRabbitMQ();

        // 初始化数据库常量
        $this->initDbInfo();
        return $next($request);
    }

    /**
     * 初始化系统常量
     *
     * @author 牧羊人
     * @since 2020-04-21
     */
    public function initSystemConstant()
    {
        // 基础常量
        define('ROOT_PATH', app()->getRootPath());
        define('APP_PATH', ROOT_PATH . "app");
        define('ROUTE_PATH', ROOT_PATH . "route");
        define('RUNTIME_PATH', ROOT_PATH . "runtime");
        define('EXTEND_PATH', ROOT_PATH . "extend");
        define('VENDOR_PATH', ROOT_PATH . "vendor");
        define('PUBLIC_PATH', ROOT_PATH . 'public');

        // 附件常量
        // 文件上传路径
        $upload_parh = \think\facade\Filesystem::getDiskConfig(config('filesystem.default'), 'root');
        define('ATTACHMENT_PATH', $upload_parh);
        define('IMG_PATH', ATTACHMENT_PATH . "/images");
        define('UPLOAD_TEMP_PATH', IMG_PATH . '/temp');

        // 系统配置
        define('SITE_NAME', env('system.sitename'));
        define('NICK_NAME', env('system.nickname'));
        define('SYSTEM_VERSION', env('system.version'));

        // 系统域名
        define('SITE_URL', env('domain.siteurl'));
        define('IMG_URL', env('domain.img_url'));
    }

    /**
     * 初始化RabbitMQ
     *
     * @author 牧羊人
     * @since 2020-04-21
     */
    public function initRabbitMQ()
    {

    }

    /**
     * 初始化数据库常量
     *
     * @author 牧羊人
     * @since 2020-04-21
     */
    public function initDbInfo()
    {
        // 数据表前缀
        define('DB_PREFIX', env('database.prefix', ''));
    }

}