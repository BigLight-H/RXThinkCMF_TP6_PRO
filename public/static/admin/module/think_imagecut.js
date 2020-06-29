/**
 * 切图管理
 * @auth 牧羊人
 * @date 2018/5/9
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
            , {field: 'type_name', width: 200, title: '切图类型', align: 'center'}
            , {field: 'width', width: 100, title: '切图宽度', align: 'center'}
            , {field: 'height', width: 100, title: '切图高度', align: 'center'}
            , {field: 'sort', width: 80, title: '排序', align: 'center'}
            , {field: 'note', width: 300, title: '备注', align: 'center'}
            , {field: 'format_create_user', width: 100, title: '创建人', align: 'center'}
            , {field: 'format_create_time', width: 180, title: '创建时间', align: 'center', sort: true}
            , {field: 'format_update_time', width: 180, title: '更新时间', align: 'center', sort: true}
            , {fixed: 'right', width: 300, title: '功能操作', align: 'center', toolbar: '#toolBar'}
        ];

        //【渲染TABLE】
        func.tableIns(cols, "tableList");

        //【设置弹框】
        func.setWin("切图", 650, 450);
    }
});

