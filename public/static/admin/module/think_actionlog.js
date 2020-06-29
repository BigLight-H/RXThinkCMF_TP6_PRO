/**
 * 行为日志
 * @auth 牧羊人
 * @date 2019/5/15
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
            , {field: 'username', width: 100, title: '操作用户', align: 'center'}
            , {field: 'method', width: 100, title: '请求方式', align: 'center'}
            , {field: 'title', width: 100, title: '日志标题', align: 'center'}
            , {field: 'module', width: 100, title: '模型', align: 'center'}
            , {field: 'action', width: 150, title: '操作方法', align: 'left'}
            , {field: 'param', width: 200, title: '请求参数', align: 'center'}
            , {field: 'url', width: 300, title: 'URL地址', align: 'center'}
            , {field: 'ip', width: 150, title: 'IP地址', align: 'center'}
            , {field: 'format_create_time', width: 180, title: '创建时间', align: 'center', sort: true}
            , {fixed: 'right', width: 150, title: '功能操作', align: 'center', toolbar: '#toolBar'}
        ];

        //【渲染TABLE】
        func.tableIns(cols, "tableList");
    }
});
