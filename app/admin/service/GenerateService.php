<?php


namespace app\admin\service;


use app\common\service\BaseService;
use think\facade\Db;

class GenerateService extends BaseService
{
    /**
     * 构造函数
     * @author 牧羊人
     * @since 2020/7/15
     * GenerateService constructor.
     */
    public function __construct()
    {
    }

    /**
     * 获取数据表列表
     * @return array
     * @since 2020/7/15
     * @author 牧羊人
     */
    public function getList()
    {
        $list = Db::query('SHOW TABLE STATUS');
        $list = array_map('array_change_key_case', $list);

        return $message = array(
            "msg" => '操作成功',
            "code" => 0,
            "data" => $list,
            "count" => 10,
        );
    }

    /**
     * 一键生成模块文件
     * @return array
     * @since 2020/7/15
     * @author 牧羊人
     */
    public function generate()
    {
        // 参数
        $param = request()->param();
        // 数据表名
        $name = getter($param, "name");
        if (!$name) {
            return message("数据表名称不能为空", false);
        }
        if ($name != 'think_demo') {
            return message("演示环境禁止操作", false);
        }
        // 数据表名称
        $tableName = str_replace(DB_PREFIX, null, $name);
        // 模型名称
        $moduleName = str_replace(' ', null, ucwords(strtolower(str_replace('_', ' ', $tableName))));
        // 控制器名称
        $controllerName = ucfirst(strtolower(str_replace('_', '', $tableName)));

        // 数据表描述
        $comment = getter($param, "comment");
        if (!$comment) {
            return message("数据表名称不能为空", false);
        }
        // 去除表描述中的`表`
        if (strpos($comment, "表") !== false) {
            $comment = str_replace("表", null, $comment);
        }
        // 去除表描述中的`管理`
        if (strpos($comment, "管理") !== false) {
            $comment = str_replace("管理", null, $comment);
        }
        // 作者花名
        $author = "牧羊人";

        // 生成模型
        $this->generateModel($author, $moduleName, $comment, $tableName);
        // 生成服务类
        $this->generateService($author, $moduleName, $comment, $tableName);
        // 生成控制器
        $this->generateController($author, $controllerName, $comment);
        // 生成列表文件
        $this->generateIndex($comment, $tableName);
        // 生成表单文件
        $this->generateEdit($tableName);
        // 生成JS文件
        $this->generateJs($author, strtolower(str_replace('_', '', $tableName)), $comment, $tableName);

        return message("模块生成成功");
    }

    /**
     * 生成模型
     * @param $author 作者
     * @param $moduleName 模块名
     * @param $moduleTitle 模块标题
     * @param $tableName 数据表名
     * @author 牧羊人
     * @since 2020/7/15
     */
    public function generateModel($author, $moduleName, $moduleTitle, $tableName)
    {
        // 判断是否有图片
        $moduleImage = false;
        // 获取数据列表
        $columnList = $this->getColumnList(DB_PREFIX . "{$tableName}");
        if ($columnList) {
            foreach ($columnList as &$val) {
                // 图片字段处理
                if (strpos($val['columnName'], "cover") !== false ||
                    strpos($val['columnName'], "avatar") !== false ||
                    strpos($val['columnName'], "image") !== false ||
                    strpos($val['columnName'], "logo") !== false ||
                    strpos($val['columnName'], "pic") !== false) {
                    $val['columnImage'] = true;
                    $moduleImage = true;
                }
            }
        }
        // 参数
        $param = [
            'author' => $author,
            'since' => date('Y/m/d', time()),
            'moduleName' => $moduleName,
            'moduleTitle' => $moduleTitle,
            'tableName' => $tableName,
            'columnList' => $columnList,
            'moduleImage' => $moduleImage,
        ];
        // 存储目录
        $FILE_PATH = APP_PATH . '/admin/model/';
        if (!is_dir($FILE_PATH)) {
            // 创建目录并赋予权限
            mkdir($FILE_PATH, 0777, true);
        }
        // 文件名
        $filename = $FILE_PATH . "/{$moduleName}.php";
        // 拆解参数
        extract($param);
        // 开启缓冲区
        ob_start();
        // 引入模板文件
        require(APP_PATH . '/admin/view/tpl/model.tpl.php');
        // 获取缓冲区内容
        $out = ob_get_clean();
        // 打开文件
        $f = fopen($filename, 'w');
        // 写入内容
        fwrite($f, "<?php " . $out);
        // 关闭
        fclose($f);
    }

    /**
     * 生成服务类
     * @param $author 作者
     * @param $moduleName 模块名
     * @param $moduleTitle 模块标题
     * @param $tableName 数据表
     * @since 2020/7/15
     * @author 牧羊人
     */
    public function generateService($author, $moduleName, $moduleTitle, $tableName)
    {
        // 判断是否有图片
        $moduleImage = false;
        // 获取数据列表
        $columnList = $this->getColumnList(DB_PREFIX . "{$tableName}");
        if ($columnList) {
            foreach ($columnList as &$val) {
                // 图片字段处理
                if (strpos($val['columnName'], "cover") !== false ||
                    strpos($val['columnName'], "avatar") !== false ||
                    strpos($val['columnName'], "image") !== false ||
                    strpos($val['columnName'], "logo") !== false ||
                    strpos($val['columnName'], "pic") !== false) {
                    $val['columnImage'] = true;
                    $moduleImage = true;
                }
            }
        }
        // 参数
        $param = [
            'author' => $author,
            'since' => date('Y/m/d', time()),
            'moduleName' => $moduleName,
            'moduleTitle' => $moduleTitle,
            'columnList' => $columnList,
            'moduleImage' => $moduleImage,
        ];
        // 存储目录
        $FILE_PATH = APP_PATH . '/admin/service/';
        if (!is_dir($FILE_PATH)) {
            // 创建目录并赋予权限
            mkdir($FILE_PATH, 0777, true);
        }
        // 文件名
        $filename = $FILE_PATH . "/{$moduleName}Service.php";
        // 拆解参数
        extract($param);
        // 开启缓冲区
        ob_start();
        // 引入模板文件
        require(APP_PATH . '/admin/view/tpl/service.tpl.php');
        // 获取缓冲区内容
        $out = ob_get_clean();
        // 打开文件
        $f = fopen($filename, 'w');
        // 写入内容
        fwrite($f, "<?php " . $out);
        // 关闭
        fclose($f);
    }

    /**
     * 生成控制器
     * @param $author 作者
     * @param $moduleName 模块名
     * @param $moduleTitle 模块标题
     * @since 2020/7/15
     * @author 牧羊人
     */
    public function generateController($author, $moduleName, $moduleTitle)
    {
        // 参数
        $param = [
            'author' => $author,
            'since' => date('Y/m/d', time()),
            'moduleName' => $moduleName,
            'moduleTitle' => $moduleTitle,
        ];
        // 存储目录
        $FILE_PATH = APP_PATH . '/admin/controller/';
        if (!is_dir($FILE_PATH)) {
            // 创建目录并赋予权限
            mkdir($FILE_PATH, 0777, true);
        }
        // 文件名
        $filename = $FILE_PATH . "/{$param['moduleName']}.php";
        // 拆解参数
        extract($param);
        // 开启缓冲区
        ob_start();
        // 引入模板文件
        require(APP_PATH . '/admin/view/tpl/controller.tpl.php');
        // 获取缓冲区内容
        $out = ob_get_clean();
        // 打开文件
        $f = fopen($filename, 'w');
        // 写入内容
        fwrite($f, "<?php " . $out);
        // 关闭
        fclose($f);
    }

    /**
     * 生成列表文件
     * @param $moduleTitle 模块标题
     * @param $tableName 数据表名
     * @author 牧羊人
     * @since 2020/7/15
     */
    public function generateIndex($moduleTitle, $tableName)
    {
        // 获取数据列表
        $columnList = $this->getColumnList(DB_PREFIX . "{$tableName}");
        $queryList = [];
        if ($columnList) {
            foreach ($columnList as $val) {
                // 下拉筛选
                if (isset($val['columnValue'])) {
                    $queryList[] = $val;
                }
                // 名称
                if ($val['columnName'] == "name") {
                    $queryList[] = $val;
                }
                // 标题
                if ($val['columnName'] == "title") {
                    $queryList[] = $val;
                }
            }
        }

        // 参数
        $param = [
            'moduleTitle' => $moduleTitle,
            'queryList' => $queryList,
        ];
        // 存储目录
        if (strpos($tableName, "_") !== false) {
            $tableName = str_replace('_', null, $tableName);
        }
        $FILE_PATH = APP_PATH . '/admin/view/' . strtolower($tableName);
        if (!is_dir($FILE_PATH)) {
            // 创建目录并赋予权限
            mkdir($FILE_PATH, 0777, true);
        }
        // 文件名
        $filename = $FILE_PATH . "/index.html";
        // 拆解参数
        extract($param);
        // 开启缓冲区
        ob_start();
        // 引入模板文件
        require(APP_PATH . '/admin/view/tpl/index.tpl.php');
        // 获取缓冲区内容
        $out = ob_get_clean();
        // 打开文件
        $f = fopen($filename, 'w');
        // 写入内容
        fwrite($f, $out);
        // 关闭
        fclose($f);
    }

    /**
     * 生成表单编辑页
     * @param $tableName 数据表名
     * @since 2020/7/15
     * @author 牧羊人
     */
    public function generateEdit($tableName)
    {
        // 获取数据列表
        $columnList = $this->getColumnList(DB_PREFIX . "{$tableName}");
        // 剔除非表单呈现字段
        $arrayList = [];
        $tempList = [];
        $rowList = [];
        $columnSplit = false;
        if ($columnList) {
            foreach ($columnList as $val) {
                // 记录ID
                if ($val['columnName'] == "id") {
                    continue;
                }
                // 创建人
                if ($val['columnName'] == "create_user") {
                    continue;
                }
                // 创建时间
                if ($val['columnName'] == "create_time") {
                    continue;
                }
                // 更新人
                if ($val['columnName'] == "update_user") {
                    continue;
                }
                // 更新时间
                if ($val['columnName'] == "update_time") {
                    continue;
                }
                // 有效标识
                if ($val['columnName'] == "mark") {
                    continue;
                }
                // 图片字段处理
                if (strpos($val['columnName'], "cover") !== false ||
                    strpos($val['columnName'], "avatar") !== false ||
                    strpos($val['columnName'], "image") !== false ||
                    strpos($val['columnName'], "logo") !== false ||
                    strpos($val['columnName'], "pic") !== false) {
                    $val['columnUpload'] = true;
                    $tempList[] = $val;
                    continue;
                }
                // 多行文本输入框
                if (strpos($val['columnName'], "note") !== false ||
                    strpos($val['columnName'], "content") !== false ||
                    strpos($val['columnName'], "description") !== false ||
                    strpos($val['columnName'], "intro") !== false) {
                    $val['columnRow'] = true;
                    $rowList[] = $val;
                    continue;
                }
                // 由于目前时间字段采用int类型，所以这里根据字段描述模糊确定是否是时间选择
                if (strpos($val['columnComment'], "时间") !== false) {
                    $val['dataType'] = 'datetime';
                } elseif (strpos($val['columnComment'], "日期") !== false) {
                    $val['dataType'] = 'date';
                }
                $arrayList[] = $val;
            }
        }
        if (count($arrayList) + count($tempList) + count($rowList) > 5) {
            $dataList = [];
            // 分两个一组
            $dataList = array_chunk($arrayList, 2);
            // 图片
            if (count($tempList) > 0) {
                array_unshift($dataList, $tempList);
            }
            // 多行文本
            if (count($rowList) > 0) {
                foreach ($rowList as $val) {
                    $dataList[][] = $val;
                }
            }
            $columnList = $dataList;
            $columnSplit = true;
        } else {
            $dataList = $arrayList;
            // 图片
            if (count($tempList) > 0) {
                array_unshift($dataList, $tempList);
            }
            // 多行文本
            if (count($rowList) > 0) {
                foreach ($rowList as $val) {
                    $dataList[][] = $val;
                }
            }
            $columnList = $dataList;
            $columnSplit = false;
        }

        // 参数
        $param = [
            'columnList' => $columnList,
        ];
        // 存储目录
        if (strpos($tableName, "_") !== false) {
            $tableName = str_replace('_', null, $tableName);
        }
        $FILE_PATH = APP_PATH . '/admin/view/' . strtolower($tableName);
        if (!is_dir($FILE_PATH)) {
            // 创建目录并赋予权限
            mkdir($FILE_PATH, 0777, true);
        }
        // 文件名
        $filename = $FILE_PATH . "/edit.html";
        // 拆解参数
        extract($param);
        // 开启缓冲区
        ob_start();
        // 引入模板文件
        if ($columnSplit) {
            require(APP_PATH . '/admin/view/tpl/edit2.tpl.php');
        } else {
            require(APP_PATH . '/admin/view/tpl/edit.tpl.php');
        }
        // 获取缓冲区内容
        $out = ob_get_clean();
        // 打开文件
        $f = fopen($filename, 'w');
        // 写入内容
        fwrite($f, $out);
        // 关闭
        fclose($f);
    }

    /**
     * 生成JS文件
     * @param $author 作者
     * @param $moduleName 模块名
     * @param $moduleTitle 模块标题
     * @param $tableName 数据表名
     * @author 牧羊人
     * @since 2020/7/15
     */
    public function generateJs($author, $moduleName, $moduleTitle, $tableName)
    {
        // 获取数据列表
        $columnList = $this->getColumnList(DB_PREFIX . "{$tableName}");
        if ($columnList) {
            foreach ($columnList as &$val) {
                // 图片字段处理
                if (strpos($val['columnName'], "cover") !== false ||
                    strpos($val['columnName'], "avatar") !== false ||
                    strpos($val['columnName'], "image") !== false ||
                    strpos($val['columnName'], "logo") !== false ||
                    strpos($val['columnName'], "pic") !== false) {
                    $val['columnImage'] = true;
                }
            }
        }
        // 参数
        $param = [
            'author' => $author,
            'since' => date('Y/m/d', time()),
            'moduleTitle' => $moduleTitle,
            'columnList' => $columnList,
            'columnSplit' => count($columnList) > 11 ? true : false,
        ];
        // 存储目录
        $FILE_PATH = PUBLIC_PATH . '/static/admin/module/';
        if (!is_dir($FILE_PATH)) {
            // 创建目录并赋予权限
            mkdir($FILE_PATH, 0777, true);
        }
        // 文件名
        $filename = $FILE_PATH . "/think_" . strtolower($moduleName) . ".js";
        // 拆解参数
        extract($param);
        // 开启缓冲区
        ob_start();
        // 引入模板文件
        require(APP_PATH . '/admin/view/tpl/js.tpl.php');
        // 获取缓冲区内容
        $out = ob_get_clean();
        // 打开文件
        $f = fopen($filename, 'w');
        // 写入内容
        fwrite($f, $out);
        // 关闭
        fclose($f);
    }

    /**
     * 获取表字段列表
     * @param $tableName 数据表名
     * @return array
     * @author 牧羊人
     * @since 2020/7/15
     */
    public function getColumnList($tableName)
    {
        // 获取表列字段信息
        $columnList = Db::query("SELECT COLUMN_NAME,COLUMN_DEFAULT,DATA_TYPE,COLUMN_TYPE,COLUMN_COMMENT FROM information_schema.`COLUMNS` where TABLE_NAME like '{$tableName}'");
        $fields = [];
        if ($columnList) {
            foreach ($columnList as $val) {
                $column = [];
                // 列名称
                $column['columnName'] = $val['COLUMN_NAME'];
                // 列默认值
                $column['columnDefault'] = $val['COLUMN_DEFAULT'];
                // 数据类型
                $column['dataType'] = $val['DATA_TYPE'];
                // 列描述
                if (strpos($val['COLUMN_COMMENT'], '：') !== false) {
                    $item = explode("：", $val['COLUMN_COMMENT']);
                    $column['columnComment'] = $item[0];

                    // 拆解字段描述
                    $param = explode(" ", $item[1]);
                    $columnValue = [];
                    $columnValueList = [];
                    foreach ($param as $vo) {
                        // 键值
                        $key = preg_replace('/[^0-9]/', '', $vo);
                        // 键值内容
                        $value = str_replace($key, null, $vo);
                        $columnValue[] = "{$key}={$value}";
                        $columnValueList[] = $value;
                    }
                    $column['columnValue'] = implode(',', $columnValue);
                    if ($val['COLUMN_NAME'] == "status" || substr($val['COLUMN_NAME'], 0, 3) == "is_") {
                        $column['columnSwitch'] = true;
                        $column['columnSwitchValue'] = implode('|', $columnValueList);
                    } else {
                        $column['columnSwitch'] = false;
                    }
                } else {
                    $column['columnComment'] = $val['COLUMN_COMMENT'];
                }
                $fields[] = $column;
            }
        }
        return $fields;
    }
}