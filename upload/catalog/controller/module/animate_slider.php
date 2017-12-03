<?php
class ControllerModuleAnimateSlider extends Controller {
	public function index($setting) {
		$this->load->language('module/animate_slider');
		$this->document->addStyle('view/theme/default/stylesheet/animate_slider.css');
		$this->load->model('setting/setting');
		$this->load->model('tool/image');

		$data['heading_title'] = $this->language->get('heading_title');

		$banner_list = $this->model_setting_setting->getSetting('animate_slider');

		foreach ($banner_list['animate_slider'] as $slide) {
			$data['content'][] = array(
				'title' => $slide['title'],
				'subtitle' => $slide['subtitle'],
				'link' => $slide['link'],
				'image' => $slide['image'],
				'thumb' => $this->model_tool_image->resize($slide['image'], 1170, 780),
				'order' => $slide['order'],
				'animate1' => $slide['animate1'],
				'animate2' => $slide['animate2'],
				'animate3' => $slide['animate3']
			);
		}
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/animate_slider.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/animate_slider.tpl', $data);
		} else {
			return $this->load->view('default/template/module/animate_slider.tpl', $data);
		}
	}
}
?>