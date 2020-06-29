/**
 * 定时任务
 * @auth 牧羊人
 * @date 2019/5/20
 */
layui.use(['function'], function () {

    //【声明变量】
    var func = layui.function
        , $ = layui.$;

    if (A == 'index') {
        //【TABLE列数组】
        var cols = [
            {type: 'checkbox', fixed: 'left'}
            , {field: 'id', width: 80, title: 'ID', align: 'center', sort: true, fixed: 'left'}
            , {field: 'type', width: 150, title: '执行内容', align: 'center'}
            , {field: 'title', width: 200, title: '任务标题', align: 'center'}
            , {field: 'maximums', width: 100, title: '最多执行', align: 'center'}
            , {field: 'executes', width: 100, title: '执行次数', align: 'center'}
            , {field: 'format_begin_time', width: 180, title: '开始时间', align: 'center'}
            , {field: 'format_end_time', width: 180, title: '结束时间', align: 'center'}
            , {field: 'format_execute_time', width: 180, title: '最后执行时间', align: 'center'}
            , {field: 'weigh', width: 100, title: '权重', align: 'center'}
            , {
                field: 'status', width: 100, title: '状态', align: 'center', templet: function (d) {
                    var str = "";
                    if (d.status == 1) {
                        str = '<span class="layui-btn layui-btn-normal layui-btn-xs">在用</span>';
                    } else {
                        str = '<span class="layui-btn layui-btn-normal layui-btn-xs layui-btn-danger">禁用</span>';
                    }
                    return str;
                }
            }
            , {field: 'format_create_user', width: 100, title: '创建人', align: 'center', sort: true}
            , {field: 'format_create_time', width: 180, title: '创建时间', align: 'center', sort: true}
            , {field: 'format_update_time', width: 180, title: '更新时间', align: 'center', sort: true}
            , {fixed: 'right', width: 150, title: '功能操作', align: 'center', toolbar: '#toolBar'}
        ];

        //【渲染TABLE】
        func.tableIns(cols, "tableList");

        //【设置弹框】
        func.setWin("定时任务");
    }
});
