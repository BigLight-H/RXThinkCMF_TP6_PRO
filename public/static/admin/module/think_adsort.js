/**
 * 广告位描述
 * @auth 牧羊人
 * @date 2019/5/6
 */
layui.use(['function'], function () {
    var func = layui.function,
        $ = layui.$;

    if (A == 'index') {
        //【TABLE列数组】
        var cols = [
            {type: 'checkbox', fixed: 'left'}
            , {field: 'id', width: 80, title: 'ID', align: 'center', sort: true, fixed: 'left'}
            , {field: 'name', width: 200, title: '广告位名称', align: 'center'}
            , {field: 'item_name', width: 100, title: '所属站点', align: 'center'}
            , {field: 'cate_name', width: 250, title: '所属栏目', align: 'center'}
            , {field: 'loc_id', width: 100, title: '广告位置', align: 'center'}
            , {field: 'platform_name', width: 100, title: '所属平台', align: 'center'}
            , {field: 'description', width: 250, title: '描述', align: 'center'}
            , {field: 'format_create_user', width: 80, title: '创建人', align: 'center'}
            , {field: 'format_create_time', width: 180, title: '创建时间', align: 'center', sort: true}
            , {field: 'sort', width: 80, title: '排序', align: 'center'}
            , {fixed: 'right', width: 150, title: '功能操作', align: 'center', toolbar: '#toolBar'}
        ];

        //【TABLE渲染】
        func.tableIns(cols, "tableList");

        //【设置弹框】
        func.setWin("广告位");
    }
});
