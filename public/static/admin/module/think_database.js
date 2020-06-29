/**
 * 行为
 * @auth 牧羊人
 * @date 2019/5/14
 */
layui.use(['function'], function () {

    //【声明变量】
    var func = layui.function
        , $ = layui.$;

    if (A == 'index') {
        //【TABLE列数组】
        var cols = [
            {type: 'checkbox', fixed: 'left'}
            , {field: 'name', width: 250, title: '表名', align: 'center'}
            , {field: 'engine', width: 100, title: '引擎', align: 'center'}
            , {field: 'collation', width: 200, title: '编码', align: 'center'}
            , {field: 'rows', width: 100, title: '记录数', align: 'center'}
            , {field: 'data_length', width: 100, title: '大小', align: 'center'}
            , {field: 'comment', width: 250, title: '表备注', align: 'center'}
            , {
                field: '', width: 100, title: '状态', align: 'center', templet: function (d) {
                    return '未备份';
                }
            }
            , {fixed: 'right', width: 180, title: '功能操作', align: 'center', toolbar: '#toolBar'}
        ];

        //【渲染TABLE】
        func.tableIns(cols, "tableList");

        //【立即备份】
        $(".btnBackup").click(function () {
            layer.msg("立即备份");
            //$(this).parent().children().addClass("disabled");
            $(this).html("正在发送备份请求...");

            return false;
        });

        //【优化表】
        $(".btnOptimize").click(function () {
            layer.msg("优化表");
        });

        //【修复表】
        $(".btnRepair").click(function () {
            layer.msg("修复表");
        });
    }
});
