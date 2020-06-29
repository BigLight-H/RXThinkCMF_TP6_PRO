/**
 * 栏目管理
 * @auth 牧羊人
 * @date 2019/5/5
 */
layui.use(['function'], function () {

    //【声明变量】
    var func = layui.function
        ,form = layui.form
        , $ = layui.$;

    if (A == 'index') {
        //【TABLE列数组】
        var cols = [
             {field: 'id', width: 80, title: 'ID', align: 'center'}
            , {field: 'name', width: 300, title: '栏目名称', align: 'left'}
            , {
                field: 'cover_url', width: 60, title: '图片', align: 'center', templet: function (d) {
                    var coverStr = "";
                    if (d.cover_url) {
                        coverStr = '<a href="' + d.cover_url + '" target="_blank"><img src="' + d.cover_url + '" height="26" /></a>';
                    }
                    return coverStr;
                }
            }
            , {field: 'item_name', width: 100, title: '站点名称', align: 'center'}
            , {field: 'pinyin', width: 100, title: '拼音', align: 'center'}
            , {field: 'code', width: 100, title: '简拼', align: 'center'}
            , {field: 'note', width: 200, title: '备注', align: 'center'}
            , {field: 'format_create_user', width: 100, title: '创建人', align: 'center'}
            , {field: 'format_create_time', width: 180, title: '创建时间', align: 'center', sort: true}
            , {field: 'format_update_time', width: 180, title: '更新时间', align: 'center', sort: true}
            , {field: 'sort', width: 100, title: '排序', align: 'center'}
            , {width: 230, title: '功能操作', align: 'center', toolbar: '#toolBar'}
        ];

        //【渲染TABLE】
        func.treetable(cols, 'tableList');

        //【设置弹框】
        func.setWin("栏目");
    } else {
        //【监听有无封面】
        form.on('switch(is_cover)', function (obj) {
            var isSel = obj.elem.checked;
            if (isSel) {
                $(".cover").removeClass("layui-hide");
            } else {
                $(".cover").addClass("layui-hide");
            }
        });
    }
});
