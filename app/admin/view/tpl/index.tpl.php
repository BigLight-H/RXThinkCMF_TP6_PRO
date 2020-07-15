
<!-- 引入基类模板 -->
{extend name='public/base' /}

<!-- 主体部分 -->
{block name='content'}

    <!-- 功能操作区一 -->
    <form class="layui-form toolbar">
        <div class="layui-form-item">
        <?php foreach ($queryList as $val) {?>
            <?php if (isset($val['columnValue'])) {?>

            <!-- <?php echo $val['columnComment'];?> -->
            <div class="layui-inline">
                <label class="layui-form-label w-auto"><?php echo $val['columnComment']?>：</label>
                <div class="layui-input-inline">
                    {common:select param="<?php echo $val['columnName']?>|0|<?php echo $val['columnComment']?>|name|id" data="<?php echo $val['columnValue']?>" value="0"}
                </div>
            </div>
            <?php } else {?>

            <!-- <?php echo $val['columnComment'];?> -->
            <div class="layui-inline">
                <label class="layui-form-label w-auto"><?php echo $val['columnComment']?>：</label>
                <div class="layui-input-inline">
                    <input type="text" name="<?php echo $val['columnName']?>" placeholder="请输入<?php echo $val['columnComment']?>" autocomplete="off" class="layui-input">
                </div>
            </div>
            <?php } ?>
        <?php } ?>

            <div class="layui-inline">
                <div class="layui-input-inline" style="width: auto;">
                    {widget:query name="查询"}
                    {widget:add name="添加<?php echo $moduleTitle?>"}
                    {widget:dall name="批量删除"}
                </div>
            </div>
        </div>
    </form>

    <!-- TABLE渲染区 -->
    <table class="layui-hide" id="tableList" lay-filter="tableList"></table>

    <!-- 操作功能区二 -->
    <script type="text/html" id="toolBar">
        {widget:edit name="编辑"}
        {widget:delete name="删除"}
    </script>
<?php foreach ($queryList as $val) {?>
<?php if (isset($val['columnSwitch']) && $val['columnSwitch']){ ?>

    <!-- <?php echo $val['columnComment']?> -->
    <script type="text/html" id="<?php echo $val['columnName']?>Tpl">
        <input type="checkbox" name="<?php echo $val['columnName']?>" value="{literal}{{ d.id }}{/literal}" lay-skin="switch" lay-text="<?php echo $val['columnSwitchValue']?>" lay-filter="<?php echo $val['columnName']?>" {literal}{{ d.<?php echo $val['columnName']?> == 1 ? 'checked' : '' }}{/literal} >
    </script>
<?php } ?>
<?php } ?>

{/block}