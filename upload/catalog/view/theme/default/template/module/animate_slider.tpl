<?php if(count($content)){ ?>
<div class="home-slider">
	<?php foreach ($content as $slide) { ?>
		<div class="home-slider__item">
			<img src="<?php echo $slide['thumb']; ?>" alt="">
			<div class="home-slider__content">
				<div class="home-slider__title" style="--animate-name: <?php echo $slide['animate1']; ?>"><?php echo $slide['title']; ?></div>
				<div class="home-slider__desc" style="--animate-name: <?php echo $slide['animate2']; ?>"><?php echo $slide['subtitle']; ?></div>
				<a style="--animate-name: <?php echo $slide['animate3']; ?>" href="<?php echo $slide['link']; ?>">подробнее</a>
			</div>
		</div>
	<?php } ?>
</div>
<?php } ?>