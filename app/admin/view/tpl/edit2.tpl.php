<form class="layui-form model-form" action="">
    <input name="id" id="id" type="hidden" value="{$info.id|default=0}">
<?php if ($columnList) {?>
    <?php foreach ($columnList as $val) { ?>
    <?php if (isset($val[0]['columnUpload'])) {?>

    <div class="layui-form-item">
        <label class="layui-form-label"><?php echo $val[0]['columnComment']?>：</label>
        {upload:image name="<?php echo $val[0]['columnName']?>|<?php echo $val[0]['columnComment']?>|90x90|建议上传尺寸450x450|450x450" value="isset($info['<?php echo $val[0]['columnName']?>']) ? $info['<?php echo $val[0]['columnName']?>'] : ''"}
    </div>
    <?php } elseif (isset($val[0]['columnRow'])) { ?>

    <div class="layui-form-item layui-form-text" style="width:625px;">
        <label class="layui-form-label"><?php echo $val[0]['columnComment']?>：</label>
        <div class="layui-input-block">
            <textarea name="<?php echo $val[0]['columnName']?>" placeholder="请输入<?php echo $val[0]['columnComment']?>" class="layui-textarea">{$info['<?php echo $val[0]['columnName']?>']|default=''}</textarea>
            <?php if ($val[0]['dataType']=="text") {?>

            {editor:kindeditor name="<?php echo $val[0]['columnName']?>" type="default" width="100%" height="350"}
            <?php } ?>

        </div>
    </div>
    <?php } else {?>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label"><?php echo $val[0]['columnComment']?>：</label>
            <div class="layui-input-inline">
            <?php if (isset($val[0]['columnValue'])) {?>
                <?php if (isset($val[0]['columnSwitch']) && $val[0]['columnSwitch']) {?>

                {common:switch name="<?php echo $val[0]['columnName']?>" title="<?php echo $val[0]['columnSwitchValue']?>" value="isset($info['<?php echo $val[0]['columnName']?>']) ? $info['<?php echo $val[0]['columnName']?>'] : <?php echo $val[0]['columnDefault']?>"}
                <?php } else {?>

                {common:select param="<?php echo $val[0]['columnName']?>|1|<?php echo $val[0]['columnComment']?>|name|id" data="<?php echo $val[0]['columnValue']?>" value="isset($info['<?php echo $val[0]['columnName']?>']) ? $info['<?php echo $val[0]['columnName']?>'] : <?php echo $val[0]['columnDefault']?>"}
                <?php } ?>
            <?php } elseif ($val[0]['dataType'] == 'bigint' || $val[0]['dataType'] == 'int' || $val[0]['dataType'] == 'smallint' || $val[0]['dataType'] == 'tinyint') {?>

                <input name="<?php echo $val[0]['columnName']?>" value="{$info['<?php echo $val[0]['columnName']?>']|default=0}" lay-verify="required|number" autocomplete="off" placeholder="请输入<?php echo $val[0]['columnComment']?>" class="layui-input" type="text">
            <?php } elseif ($val[0]['dataType'] == 'date' || $val[0]['dataType'] == 'datetime') {?>

                {date:select param="<?php echo $val[0]['columnName']?>|<?php echo $val[0]['columnComment']?>|<?php echo $val[0]['dataType']?>" value="$info['<?php echo $val[0]['columnName']?>']|default=''"}
            <?php } else {?>

                <input name="<?php echo $val[0]['columnName']?>" value="{$info['<?php echo $val[0]['columnName']?>']|default=''}" lay-verify="required" autocomplete="off" placeholder="请输入<?php echo $val[0]['columnComment']?>" class="layui-input" type="text">
            <?php } ?>

            </div>
        </div>
        <?php if (isset($val[1])) {?>
<div class="layui-inline">
            <label class="layui-form-label"><?php echo $val[1]['columnComment']?>：</label>
            <div class="layui-input-inline">
        <?php if (isset($val[1]['columnValue'])) {?>
            <?php if (isset($val[1]['columnSwitch']) && $val[1]['columnSwitch']) {?>
                {common:switch name="<?php echo $val[1]['columnName']?>" title="<?php echo $val[1]['columnSwitchValue']?>" value="isset($info['<?php echo $val[1]['columnName']?>']) ? $info['<?php echo $val[1]['columnName']?>'] : <?php echo $val[1]['columnDefault']?>"}
            <?php } else {?>
                {common:select param="<?php echo $val[1]['columnName']?>|1|<?php echo $val[1]['columnComment']?>|name|id" data="<?php echo $val[1]['columnValue']?>" value="isset($info['<?php echo $val[1]['columnName']?>']) ? $info['<?php echo $val[1]['columnName']?>'] : <?php echo $val[1]['columnDefault']?>"}
            <?php } ?>
            <?php } elseif ($val[1]['dataType'] == 'bigint' || $val[1]['dataType'] == 'int' || $val[1]['dataType'] == 'smallint' || $val[1]['dataType'] == 'tinyint') {?>

                <input name="<?php echo $val[1]['columnName']?>" value="{$info['<?php echo $val[1]['columnName']?>']|default=0}" lay-verify="required|number" autocomplete="off" placeholder="请输入<?php echo $val[1]['columnComment']?>" class="layui-input" type="text">
            <?php } elseif ($val[1]['dataType'] == 'date' || $val[1]['dataType'] == 'datetime') {?>
                {date:select param="<?php echo $val[1]['columnName']?>|<?php echo $val[1]['columnComment']?>|<?php echo $val[1]['dataType']?>" value="$info['<?php echo $val[1]['columnName']?>']|default=''"}
            <?php } else {?>

                <input name="<?php echo $val[1]['columnName']?>" value="{$info['<?php echo $val[1]['columnName']?>']|default=''}" lay-verify="required" autocomplete="off" placeholder="请输入<?php echo $val[1]['columnComment']?>" class="layui-input" type="text">
            <?php } ?>

            </div>
        </div>
        <?php } ?>

    </div>
    <?php } ?>
    <?php } ?>
<?php } ?>

    {widget:submit name="submit|立即保存,close|关闭"}
</form>