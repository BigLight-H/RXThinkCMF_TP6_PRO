/**
 * <?php echo $moduleTitle;?>管理
 * @author <?php echo $author?>

 * @since <?php echo $since?>

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
<?php foreach ($columnList as $val) {?>
<?php if ($val['columnName'] != 'id' && $val['columnName'] != 'create_user' && $val['columnName'] != 'create_time' && $val['columnName'] != 'update_time' && $val['columnName'] != 'mark') {?>
<?php if (isset($val['columnSwitch']) && $val['columnSwitch']) {?>
            , {field: '<?php echo $val['columnName']?>', width: 100, title: '<?php echo $val['columnComment']?>', align: 'center', templet: '#<?php echo $val['columnName']?>Tpl'}
<?php } elseif (isset($val['columnImage']) && $val['columnImage']) {?>
            , {field: '<?php echo $val['columnName']?>', width: 60, title: '<?php echo $val['columnComment']?>', align: 'center', templet: function (d) {
                var <?php echo $val['columnName']?> = "";
                if (d.<?php echo $val['columnName']?>) {
                    <?php echo $val['columnName']?> = '<a href="' + d.<?php echo $val['columnName']?> + '" target="_blank"><img src="' + d.<?php echo $val['columnName']?> + '" height="26" /></a>';
                }
                return <?php echo $val['columnName']?>;
                }
            }
<?php } else {?>
            , {field: '<?php echo $val['columnName']?>', width: 100, title: '<?php echo $val['columnComment']?>', align: 'center'}
<?php } ?>
<?php } ?>
<?php } ?>
            , {field: 'create_user_name', width: 100, title: '创建人', align: 'center'}
            , {field: 'create_time', width: 180, title: '创建时间', align: 'center', sort: true}
            , {field: 'update_time', width: 180, title: '更新时间', align: 'center', sort: true}
            , {fixed: 'right', width: 150, title: '功能操作', align: 'center', toolbar: '#toolBar'}
        ];

        //【渲染TABLE】
        func.tableIns(cols, "tableList");

        //【设置弹框】
<?php if ($columnSplit) {?>
        func.setWin("<?php echo $moduleTitle;?>");
<?php } else {?>
        func.setWin("<?php echo $moduleTitle;?>", 500, 400);
<?php } ?>

<?php foreach ($columnList as $val) {?>
    <?php if (isset($val['columnSwitch']) && $val['columnSwitch']) {?>

        //【设置<?php echo $val['columnComment']?>】
        func.formSwitch('<?php echo $val['columnName']?>', null, function (data, res) {
            console.log("开关回调成功");
        });

    <?php } ?>
<?php } ?>

    }
});
