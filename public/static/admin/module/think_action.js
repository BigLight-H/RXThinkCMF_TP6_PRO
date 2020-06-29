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
            , {field: 'id', width: 80, title: 'ID', align: 'center', sort: true, fixed: 'left'}
            , {field: 'name', width: 200, title: '标识', align: 'center'}
            , {field: 'title', width: 150, title: '行为名称', align: 'center'}
            , {field: 'source_type_name', width: 100, title: '来源类型', align: 'center'}
            , {field: 'module_name', width: 100, title: '所属模块名', align: 'center'}
            , {field: 'rule', width: 200, title: '行为规则', align: 'center'}
            , {field: 'log', width: 200, title: '日志规则', align: 'center'}
            , {field: 'description', width: 300, title: '行为描述', align: 'center'}
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
        func.setWin("行为", 750, 530);
    }
});
