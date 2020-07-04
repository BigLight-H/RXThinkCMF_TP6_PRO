/**
 * 行政区域
 * @author 牧羊人
 * @since 2020/7/4
 */
layui.use(['function'], function () {

    //【声明变量】
    var func = layui.function
        , $ = layui.$;

    if (A == 'index') {
        //【TABLE列数组】
        var cols = [
             {field: 'id', width: 80, title: 'ID', align: 'center'}
            , {field: 'name', width: 300, title: '城市名称', align: 'left'}
            , {field: 'citycode', width: 200, title: '城市编码(区号)', align: 'center'}
            , {
                field: 'level', width: 100, title: '级别', align: 'center', templet: function (d) {
                    return '<span class="layui-btn layui-btn-xs layui-badge layui-bg-cyan">' + d.level + '</span>';
                }
            }
            , {field: 'citycode', width: 200, title: '城市编码(区号)', align: 'center'}
            , {field: 'citycode', width: 200, title: '城市编码(区号)', align: 'center'}
            , {field: 'sort', width: 100, title: '排序', align: 'center'}
            , {fixed: 'right', width: 230, title: '功能操作', align: 'left', toolbar: '#toolBar'}
        ];

        //【TREE渲染】
        func.treetable(cols, "tableList", false, 1);

        //【设置弹框】
        func.setWin("城市", 500, 400);
    }
});
