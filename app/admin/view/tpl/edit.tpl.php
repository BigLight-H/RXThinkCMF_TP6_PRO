<form class="layui-form model-form" action="">
    <input name="id" id="id" type="hidden" value="{$info.id|default=0}">
<?php if ($columnList) {?>
    <?php foreach ($columnList as $val) { ?>
    <?php if (isset($val['columnUpload'])) {?>

    <div class="layui-form-item">
        <label class="layui-form-label"><?php echo $val['columnComment']?>：</label>
        {upload:image name="<?php echo $val['columnName']?>|<?php echo $val['columnComment']?>|90x90|建议上传尺寸450x450|450x450" value="isset($info['<?php echo $val['columnName']?>']) ? $info['<?php echo $val['columnName']?>'] : ''"}
    </div>
    <?php } elseif (isset($val['columnRow'])) { ?>

    <div class="layui-form-item layui-form-text" style="width:625px;">
        <label class="layui-form-label"><?php echo $val['columnComment']?>：</label>
        <div class="layui-input-block">
            <textarea name="<?php echo $val['columnName']?>" placeholder="请输入<?php echo $val['columnComment']?>" class="layui-textarea">{$info['<?php echo $val['columnName']?>']|default=''}</textarea>
            <?php if ($val['dataType']=="text") {?>

                {editor:kindeditor name="<?php echo $val['columnName']?>" type="default" width="100%" height="350"}
            <?php } ?>

        </div>
    </div>
    <?php } else {?>

    <div class="layui-form-item">
        <label class="layui-form-label"><?php echo $val['columnComment']?>：</label>
        <div class="layui-input-block">
    <?php if (isset($val['columnValue'])) {?>
        <?php if (isset($val['columnSwitch']) && $val['columnSwitch']) {?>

            {common:switch name="<?php echo $val['columnName']?>" title="<?php echo $val['columnSwitchValue']?>" value="isset($info['<?php echo $val['columnName']?>']) ? $info['<?php echo $val['columnName']?>'] : <?php echo $val['columnDefault']?>"}
        <?php } else {?>

            {common:select param="<?php echo $val['columnName']?>|1|<?php echo $val['columnComment']?>|name|id" data="<?php echo $val['columnValue']?>" value="isset($info['<?php echo $val['columnName']?>']) ? $info['<?php echo $val['columnName']?>'] : <?php echo $val['columnDefault']?>"}
        <?php } ?>
    <?php } elseif ($val['dataType'] == 'bigint' || $val['dataType'] == 'int' || $val['dataType'] == 'smallint' || $val['dataType'] == 'tinyint') {?>

        <input name="<?php echo $val['columnName']?>" value="{$info['<?php echo $val['columnName']?>']|default=0}" lay-verify="required|number" autocomplete="off" placeholder="请输入<?php echo $val['columnComment']?>" class="layui-input" type="text">
    <?php } elseif ($val['dataType'] == 'date' || $val['dataType'] == 'datetime') {?>

        {date:select param="<?php echo $val['columnName']?>|<?php echo $val['columnComment']?>|<?php echo $val['dataType']?>" value="$info['<?php echo $val['columnName']?>']|default=''"}
    <?php } else {?>
        <input name="<?php echo $val['columnName']?>" value="{$info['<?php echo $val['columnName']?>']|default=''}" lay-verify="required" autocomplete="off" placeholder="请输入<?php echo $val['columnComment']?>" class="layui-input" type="text">
    <?php } ?>

        </div>
    </div>
    <?php } ?>
    <?php } ?>
<?php } ?>

    {widget:submit name="submit|立即保存,close|关闭"}
</form>