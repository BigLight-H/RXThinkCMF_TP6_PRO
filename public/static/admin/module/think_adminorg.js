/**
 * 组织机构管理
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
            {type: 'checkbox', fixed: 'left'}
            , {field: 'id', width: 80, title: 'ID', align: 'center', sort: true, fixed: 'left'}
            , {
                field: 'logo_url', width: 80, title: 'LOGO', align: 'center', templet: function (d) {
                    var logoStr = "";
                    if (d.logo_url) {
                        logoStr = '<a href="' + d.logo_url + '" target="_blank"><img src="' + d.logo_url + '" height="26" /></a>';
                    }
                    return logoStr;
                }
            }
            , {field: 'name', width: 300, title: '组织机构全称', align: 'center'}
            , {field: 'nickname', width: 120, title: '组织机构简称', align: 'center'}
            , {field: 'contact', width: 100, title: '联系人', align: 'center'}
            , {field: 'tel', width: 150, title: '联系电话', align: 'center'}
            , {field: 'city_name', width: 250, title: '所属城市', align: 'center'}
            , {field: 'format_create_user', width: 100, title: '创建人', align: 'center'}
            , {field: 'format_create_time', width: 180, title: '创建时间', align: 'center', sort: true}
            , {field: 'format_update_time', width: 180, title: '更新时间', align: 'center', sort: true}
            , {field: 'sort', width: 100, title: '排序', align: 'center'}
            , {fixed: 'right', width: 150, title: '功能操作', align: 'center', toolbar: '#toolBar'}
        ];

        //【渲染TABLE】
        func.tableIns(cols, "tableList", function (layEvent, data) {
            if (layEvent === 'auth') {
                console.log("组织权限设置");
                location.href = mUrl + "/Adminauth/index?type=3&type_id=" + data.id;
            }
        });

        //【设置弹框】
        func.setWin("组织机构");
    }
});
