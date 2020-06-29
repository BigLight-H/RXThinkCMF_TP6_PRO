/**
 * 布局管理
 * @auth 牧羊人
 * @date 2019/5/6
 */
layui.use(['form', 'function'], function () {
    var form = layui.form,
        func = layui.function,
        $ = layui.$;

    if (A == 'index') {
        //【TABLE列数组】
        var cols = [
            {type: 'checkbox', fixed: 'left'}
            , {field: 'id', width: 80, title: 'ID', align: 'center', sort: true, fixed: 'left'}
            , {
                field: 'image_url', width: 60, title: '封面', align: 'center', templet: function (d) {
                    return '<a href="' + d.image_url + '" target="_blank"><img src="' + d.image_url + '" height="26" /></a>';
                }
            }
            , {field: 'page_name', width: 150, title: '页面编号', align: 'center'}
            , {field: 'loc_name', width: 250, title: '页面位置编号', align: 'center'}
            , {field: 'type_name', width: 100, title: '类型', align: 'center'}
            , {field: 'type_desc', width: 350, title: '类型名称', align: 'center'}
            , {field: 'format_create_user', width: 100, title: '创建人', align: 'center'}
            , {field: 'format_create_time', width: 180, title: '创建时间', align: 'center', sort: true}
            , {field: 'format_update_time', width: 180, title: '更新时间', align: 'center', sort: true}
            , {field: 'sort', width: 100, title: '排序', align: 'center'}
            , {fixed: 'right', width: 150, title: '功能操作', align: 'center', toolbar: '#toolBar'}
        ];

        //【TABLE渲染】
        func.tableIns(cols, "tableList");

        //【设置弹框】
        func.setWin("布局");

    } else {
        //监听推荐类型
        var type = $("#type").val();
        var typeStr = '';
        form.on('select(type)', function (data) {
            type = data.value;
            typeStr = data.elem[data.elem.selectedIndex].text;
        });

        //选择类型对象
        $("#type_value").click(function () {
            //推荐类型
            var title, url;
            if (type == 1) {
                //CMS文章
                title = "请选择推荐模块";
                url = mUrl + "/article/index/?simple=1";
            } else {
                //其他

            }

            if (!url) {
                layer.msg("请选择类型");
                return false;
            }

            //【弹开窗体】
            func.showWin("选择内容", url, 1000, 600);
        });
    }
});

