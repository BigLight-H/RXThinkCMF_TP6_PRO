/**
 * 菜单管理
 *
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
            , {field: 'name', width: 200, title: '菜单名称', align: 'left'}
            , {
                field: 'icon', width: 100, title: '图标', align: 'center', templet: function (d) {
                    return '<i class="larry-icon ' + d.icon + '" data-icon="' + d.icon + '" data-font="larry-icon"></i>';
                }
            }
            , {
                field: 'type', width: 100, title: '类型', align: 'center', templet(d) {
                    var cls = "";
                    if (d.type == 1) {
                        //模块
                        cls = "layui-btn-normal";
                    } else if (d.type == 2) {
                        //导航
                        cls = "layui-btn-danger";
                    } else if (d.type == 3) {
                        //菜单
                        cls = "layui-btn-warm";
                    } else if (d.type == 4) {
                        //节点
                        cls = "";
                    }
                    return '<span class="layui-btn ' + cls + ' layui-btn-xs">' + d.type_name + '</span>';
                }
            }
            , {field: 'url', width: 200, title: '菜单URL', align: 'center'}
            , {field: 'auth', width: 200, title: '权限标识', align: 'center'}
            , {
                field: 'is_show', width: 100, title: '状态', align: 'center', templet(d) {
                    return (d.is_show == 1 ? '<span class="layui-btn layui-btn-normal layui-btn-xs">显示</span>' : '<span class="layui-btn layui-btn-normal layui-btn-xs layui-btn-danger">不显示</span>');
                }
            }
            , {
                field: 'is_public', width: 100, title: '是否公共', align: 'center', templet(d) {
                    return d.is_public == 1 ? "是" : "否";
                }
            }
            , {field: 'sort', width: 100, title: '排序', align: 'center'}
            , {width: 280, title: '功能操作', align: 'left', toolbar: '#toolBar'}
        ];

        //【渲染TABLE】
        func.treetable(cols, 'tableList', false, 0, null, function (layEvent, id, pid) {
            if (layEvent === 'batchFunc') {
                var url = cUrl + "/batchFunc?menu_id=" + id;
                func.showWin("权限节点配置", url, 600, 350);
            }
        });

        //【设置弹框】
        func.setWin("菜单");
    } else {
        // 选择图标
        $(".btnIcon").click(function () {
            var url = cUrl + "/getSystemIcon";
            func.showWin("选择图标", url);
        });
    }
});

