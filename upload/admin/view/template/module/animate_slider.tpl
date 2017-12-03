<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-animate_slider" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-cogs"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-animate_slider" class="form-horizontal">
          <input type="hidden" name="name" value="animate_slider">
          <div class="table-responsive">
            <table id="animateSliderTable" class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td>&nbsp;</td>
                  <td><?php echo $text_title; ?></td>
                  <td><?php echo $text_link; ?></td>
                  <td><?php echo $text_background; ?></td>
                  <td><?php echo $text_sort; ?></td>
                  <td><?php echo $text_animate; ?></td>
                  <td>&nbsp;</td>
                </tr>
              </thead>
              <tbody>
                <?php $image_row = 0; ?>  
                <?php foreach ($content as $animate_slide) { ?>
                  <tr id="tableRow<?php echo $image_row; ?>">
                    <td>
                      <input type="checkbox" name="" id="" class="form-control">
                    </td>
                    <td>
                      <input type="text" class="form-control" name="animate_slider[<?php echo $image_row; ?>][title]" value="<?php echo $animate_slide['title']; ?>" placeholder="<?php echo $text_title; ?>">
                      <br>
                      <input type="text" class="form-control" name="animate_slider[<?php echo $image_row; ?>][subtitle]" value="<?php echo $animate_slide['subtitle']; ?>" placeholder="<?php echo $text_subtitle; ?>">
                    </td>
                    <td>
                      <input type="text" class="form-control" name="animate_slider[<?php echo $image_row; ?>][link]" value="<?php echo $animate_slide['link']; ?>" placeholder="<?php echo $text_link; ?>">
                    </td>
                    <td>
                      <a href="" id="thumb-image<?php echo $image_row; ?>" data-toggle="image" class="img-thumbnail">
                        <img src="<?php echo $animate_slide['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" />
                      </a>
                      <input type="hidden" name="animate_slider[<?php echo $image_row; ?>][image]" value="<?php echo $animate_slide['image']; ?>" id="input-image<?php echo $image_row; ?>" />
                    </td>
                    <td style="width: 10%;">
                      <input type="text" class="form-control" name="animate_slider[<?php echo $image_row; ?>][order]" value="<?php echo $animate_slide['order']; ?>" placeholder="<?php echo $text_sort; ?>">
                    </td>
                    <td>
                      <?php for($i = 1; $i < 4; $i++){ ?>
                        <select class="form-control" name="animate_slider[<?php echo $image_row; ?>][animate<?php echo $i; ?>]" value="<?php echo $animate_slide['animate' . $i]; ?>">
                          <?php foreach ($animateionList as $key => $animateion) {?>
                              <optgroup label="<?php echo $key; ?>">
                                <?php foreach ($animateion as $animName) { ?>
                                  <option <?php echo ($animName === $animate_slide['animate' . $i])?"selected":""; ?> value="<?php echo $animName; ?>"><?php echo $animName; ?></option>
                                <?php } ?>
                              </optgroup>
                          <?php } ?>
                        </select>
                        <br>
                      <?php } ?>
                    </td>
                    <td>
                      <button type="button" onclick="$('#tableRow<?php echo $image_row; ?>').remove();" data-toggle="tooltip" title="" class="btn btn-danger" data-original-title="Удалить"><i class="fa fa-minus-circle"></i></button>
                    </td>
                  </tr>
                  <?php $image_row++; ?>
                <? } ?>

                <tr>
                  <td colspan="6"></td>
                  <td>
                      <button type="button" onclick="addTableRow();" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Добавить баннер" aria-describedby="tooltip840965"><i class="fa fa-plus-circle"></i></button>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <select name="animate_slider_status" id="input-status" class="form-control">
            <?php if ($animate_slider_status) { ?>
            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
            <option value="0"><?php echo $text_disabled; ?></option>
            <?php } else { ?>
            <option value="1"><?php echo $text_enabled; ?></option>
            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
            <?php } ?>
          </select>
        </form>
      </div>
    </div>
  </div>
</div>

<script>
  var count = <?php echo $image_row; ?>;
  function addTableRow(){
    count++;
    var html = "";
    html += '<tr id="tableRow' + count + '">';
    html += '<td>';
    html += '<input type="checkbox" name="" id="" class="form-control">';
    html += '</td>'
    html += '<td>'
    html += '<input type="text" class="form-control" name="animate_slider[' + count + '][title]" placeholder="<?php echo $text_title; ?>">'
    html += '<br>'
    html += '<input type="text" class="form-control" name="animate_slider[' + count + '][subtitle]" placeholder="<?php echo $text_subtitle; ?>">'
    html += '</td>'
    html += '<td>'
    html += '<input type="text" class="form-control" name="animate_slider[' + count + '][link]" placeholder="<?php echo $text_link; ?>">'
    html += '</td>'
    html += '<td>'
    html += '<a href="" id="thumb-image' + count + '" data-toggle="image" class="img-thumbnail">'
    html += '<img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" />'
    html += '</a>'
    html += '<input type="hidden" name="animate_slider[' + count + '][image]" value="" id="input-image' + count + '" />'
    html += '</td>'
    html += '<td style="width: 10%;">'
    html += '<input type="text" class="form-control" name="animate_slider[' + count + '][order]" placeholder="<?php echo $text_sort; ?>">'
    html += '</td>'
    html += '<td>'
    for(var i = 1; i < 4; i++){
      html += '<select class="form-control" name="animate_slider[' + count + '][animate' + i + ']"> <optgroup label="Attention Seekers"> <option value="bounce">bounce</option> <option value="flash">flash</option> <option value="pulse">pulse</option> <option value="rubberBand">rubberBand</option> <option value="shake">shake</option> <option value="swing">swing</option> <option value="tada">tada</option> <option value="wobble">wobble</option> <option value="jello">jello</option> </optgroup> <optgroup label="Bouncing Entrances"> <option value="bounceIn">bounceIn</option> <option value="bounceInDown">bounceInDown</option> <option value="bounceInLeft">bounceInLeft</option> <option value="bounceInRight">bounceInRight</option> <option value="bounceInUp">bounceInUp</option> </optgroup> <optgroup label="Bouncing Exits"> <option value="bounceOut">bounceOut</option> <option value="bounceOutDown">bounceOutDown</option> <option value="bounceOutLeft">bounceOutLeft</option> <option value="bounceOutRight">bounceOutRight</option> <option value="bounceOutUp">bounceOutUp</option> </optgroup> <optgroup label="Fading Entrances"> <option value="fadeIn">fadeIn</option> <option value="fadeInDown">fadeInDown</option> <option value="fadeInDownBig">fadeInDownBig</option> <option value="fadeInLeft">fadeInLeft</option> <option value="fadeInLeftBig">fadeInLeftBig</option> <option value="fadeInRight">fadeInRight</option> <option value="fadeInRightBig">fadeInRightBig</option> <option value="fadeInUp">fadeInUp</option> <option value="fadeInUpBig">fadeInUpBig</option> </optgroup> <optgroup label="Fading Exits"> <option value="fadeOut">fadeOut</option> <option value="fadeOutDown">fadeOutDown</option> <option value="fadeOutDownBig">fadeOutDownBig</option> <option value="fadeOutLeft">fadeOutLeft</option> <option value="fadeOutLeftBig">fadeOutLeftBig</option> <option value="fadeOutRight">fadeOutRight</option> <option value="fadeOutRightBig">fadeOutRightBig</option> <option value="fadeOutUp">fadeOutUp</option> <option value="fadeOutUpBig">fadeOutUpBig</option> </optgroup> <optgroup label="Flippers"> <option value="flip">flip</option> <option value="flipInX">flipInX</option> <option value="flipInY">flipInY</option> <option value="flipOutX">flipOutX</option> <option value="flipOutY">flipOutY</option> </optgroup> <optgroup label="Lightspeed"> <option value="lightSpeedIn">lightSpeedIn</option> <option value="lightSpeedOut">lightSpeedOut</option> </optgroup> <optgroup label="Rotating Entrances"> <option value="rotateIn">rotateIn</option> <option value="rotateInDownLeft">rotateInDownLeft</option> <option value="rotateInDownRight">rotateInDownRight</option> <option value="rotateInUpLeft">rotateInUpLeft</option> <option value="rotateInUpRight">rotateInUpRight</option> </optgroup> <optgroup label="Rotating Exits"> <option value="rotateOut">rotateOut</option> <option value="rotateOutDownLeft">rotateOutDownLeft</option> <option value="rotateOutDownRight">rotateOutDownRight</option> <option value="rotateOutUpLeft">rotateOutUpLeft</option> <option value="rotateOutUpRight">rotateOutUpRight</option> </optgroup> <optgroup label="Sliding Entrances"> <option value="slideInUp">slideInUp</option> <option value="slideInDown">slideInDown</option> <option value="slideInLeft">slideInLeft</option> <option value="slideInRight">slideInRight</option> </optgroup> <optgroup label="Sliding Exits"> <option value="slideOutUp">slideOutUp</option> <option value="slideOutDown">slideOutDown</option> <option value="slideOutLeft">slideOutLeft</option> <option value="slideOutRight">slideOutRight</option> </optgroup> <optgroup label="Zoom Entrances"> <option value="zoomIn">zoomIn</option> <option value="zoomInDown">zoomInDown</option> <option value="zoomInLeft">zoomInLeft</option> <option value="zoomInRight">zoomInRight</option> <option value="zoomInUp">zoomInUp</option> </optgroup> <optgroup label="Zoom Exits"> <option value="zoomOut">zoomOut</option> <option value="zoomOutDown">zoomOutDown</option> <option value="zoomOutLeft">zoomOutLeft</option> <option value="zoomOutRight">zoomOutRight</option> <option value="zoomOutUp">zoomOutUp</option> </optgroup> <optgroup label="Specials"> <option value="hinge">hinge</option> <option value="jackInTheBox">jackInTheBox</option> <option value="rollIn">rollIn</option> <option value="rollOut">rollOut</option> </optgroup> </select>';
      html += '<br>';
    }
    html += '</td>';
    html += '<td>';
    html += '<button type="button" onclick="$(\'#tableRow' + count + '\').remove();" data-toggle="tooltip" title="" class="btn btn-danger" data-original-title="Удалить"><i class="fa fa-minus-circle"></i></button>';
    html += '</td>';
    html += '</tr>';

    $('#animateSliderTable tbody tr').last().before(html);
  }


</script>

<?php echo $footer; ?>

