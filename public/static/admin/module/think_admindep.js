/**
 * 部门管理
 * @auth 牧羊人
 * @date 2019/5/7
 */
layui.use(['function'], function () {

    //【声明变量】
    var func = layui.function
        , $ = layui.$;

    if (A == 'index') {
        //【TABLE列数组】
        var cols = [
             {field: 'id', width: 80, title: 'ID', align: 'center'}
            , {field: 'name', width: 300, title: '部门名称', align: 'left'}
            , {field: 'format_create_user', width: 100, title: '创建人', align: 'center'}
            , {field: 'format_create_time', width: 180, title: '创建时间', align: 'center', sort: true}
            , {field: 'format_update_time', width: 180, title: '更新时间', align: 'center', sort: true}
            , {field: 'sort', width: 100, title: '排序', align: 'center'}
            , {width: 230, title: '功能操作', align: 'center', toolbar: '#toolBar'}
        ];

        //【渲染TABLE】
        func.treetable(cols, 'tableList');

        //【设置弹框】
        func.setWin("部门", 550, 300);
    }
});

