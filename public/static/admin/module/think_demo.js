/**
 * 演示管理
 * @author 牧羊人
 * @since 2020/08/16
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
            , {field: 'name', width: 100, title: '职级名称', align: 'center'}
            , {field: 'avatar', width: 60, title: '头像', align: 'center', templet: function (d) {
                var avatar = "";
                if (d.avatar) {
                    avatar = '<a href="' + d.avatar + '" target="_blank"><img src="' + d.avatar + '" height="26" /></a>';
                }
                return avatar;
                }
            }
            , {field: 'status', width: 100, title: '状态', align: 'center', templet: '#statusTpl'}
            , {field: 'type', width: 100, title: '类型', align: 'center'}
            , {field: 'is_vip', width: 100, title: '是否VIP', align: 'center', templet: '#is_vipTpl'}
            , {field: 'sort', width: 100, title: '显示顺序', align: 'center'}
            , {field: 'update_user', width: 100, title: '更新人', align: 'center'}
            , {field: 'create_user_name', width: 100, title: '创建人', align: 'center'}
            , {field: 'create_time', width: 180, title: '创建时间', align: 'center', sort: true}
            , {field: 'update_time', width: 180, title: '更新时间', align: 'center', sort: true}
            , {fixed: 'right', width: 150, title: '功能操作', align: 'center', toolbar: '#toolBar'}
        ];

        //【渲染TABLE】
        func.tableIns(cols, "tableList");

        //【设置弹框】
        func.setWin("演示");

                
        //【设置状态】
        func.formSwitch('status', null, function (data, res) {
            console.log("开关回调成功");
        });

            
        //【设置是否VIP】
        func.formSwitch('is_vip', null, function (data, res) {
            console.log("开关回调成功");
        });

                            
    }
});
