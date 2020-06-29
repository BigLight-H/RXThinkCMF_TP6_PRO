/**
 * 插件管理
 * @auth 牧羊人
 * @date 2018/6/27
 */
layui.use(['function'], function () {

    //声明变量
    var func = layui.function
        , $ = layui.$;

    if (A == 'index') {
        //【TABLE列数组】
        var cols = [
            {type: 'checkbox', fixed: 'left'}
            , {field: 'id', width: 80, title: 'ID', align: 'center', sort: true, fixed: 'left'}
            , {field: 'name', width: 150, title: '插件标识/名称', align: 'center'}
            , {field: 'title', width: 150, title: '插件标题', align: 'center'}
            , {field: 'description', width: 300, title: '插件描述', align: 'center'}
            , {field: 'type_name', width: 100, title: '插件类型', align: 'center'}
            , {field: 'status_name', width: 100, title: '状态', align: 'center'}
            , {field: 'version', width: 100, title: '版本号', align: 'center'}
            , {field: 'sort', width: 100, title: '排序', align: 'center'}
            , {field: 'format_create_user', width: 100, title: '创建人', align: 'center'}
            , {field: 'format_create_time', width: 180, title: '创建时间', align: 'center', sort: true}
            , {field: 'format_update_time', width: 180, title: '更新时间', align: 'center', sort: true}
            , {fixed: 'right', width: 150, title: '功能操作', align: 'center', toolbar: '#toolBar'}
        ];

        //【渲染TABLE】
        func.tableIns(cols, "tableList");
    }
});

