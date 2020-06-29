/**
 * 会员管理
 * @auth 牧羊人
 * @date 2019/4/29
 */
layui.use(['function', 'form'], function () {
    var form = layui.form,
        func = layui.function,
        $ = layui.$;

    if (A == 'index') {
        //【TABLE列数组】
        var cols = [
            {type: 'checkbox', fixed: 'left'}
            , {field: 'id', width: 80, title: 'ID', align: 'center', sort: true, fixed: 'left'}
            , {field: 'realname', width: 100, title: '真实姓名', align: 'center'}
            , {field: 'nickname', width: 100, title: '昵称', align: 'center'}
            , {
                field: 'avatar_url', width: 60, title: '头像', align: 'center', templet: function (d) {
                    return '<a href="' + d.avatar_url + '" target="_blank"><img src="' + d.avatar_url + '" height="26" /></a>';
                }
            }
            , {field: 'mobile', width: 130, title: '手机号码', align: 'center'}
            , {field: 'points', width: 100, title: '会员积分', align: 'center'}
            , {field: 'status', width: 100, title: '会员状态', align: 'center', templet: "#statusTpl"}
            , {field: 'points', width: 100, title: '会员积分', align: 'center'}
            , {
                field: 'qrcode_url', width: 80, title: '二维码', align: 'center', templet: function (d) {
                    return '<a href="' + d.qrcode_url + '" target="_blank"><img src="' + d.qrcode_url + '" height="26" /></a>';
                }
            }
            , {field: 'format_register_time', width: 180, title: '注册时间', align: 'center'}
            , {field: 'format_login_time', width: 180, title: '登录时间', align: 'center'}
            , {field: 'login_ip', width: 100, title: '登录IP', align: 'center'}
            , {field: 'login_count', width: 100, title: '登录次数', align: 'center'}
            , {fixed: 'right', width: 100, title: '功能操作', align: 'center', toolbar: '#toolBar'}
        ];

        //【TABLE渲染】
        func.tableIns(cols, "tableList");

        //【设置弹窗】
        func.setWin("系统会员", 800, 450);

        //【设置会员状态】
        func.formSwitch('status', null, function (data, res) {
            console.log("开关回调成功");
        });
    }
});
