/**
 * 会员分组
 * @auth 牧羊人
 * @date 2019/5/8
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
            , {field: 'name', width: 200, title: '分组名称', align: 'center'}
            , {field: 'sort', width: 120, title: '排序', align: 'center'}
            , {field: 'format_create_user', width: 100, title: '创建人', align: 'center'}
            , {field: 'format_create_time', width: 200, title: '创建时间', align: 'center', sort: true}
            , {field: 'format_update_time', width: 200, title: '更新时间', align: 'center', sort: true}
            , {fixed: 'right', width: 300, title: '功能操作', align: 'center', toolbar: '#toolBar'}
        ];

        //【渲染TABLE】
        func.tableIns(cols, "tableList");

        //【设置弹框】
        func.setWin("会员分组", 450, 250);
    }
});
