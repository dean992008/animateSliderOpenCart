<?php

class ControllerModuleAnimateSlider extends Controller {
	
	protected function index() {
		
		//Load language file
		$this->language->load('module/animate_slider');

		//Set title from language file
      	$data['heading_title'] = $this->language->get('heading_title');

		//Load model
		$this->load->model('module/animate_slider');

		//Sample - get data from loaded model
		$data['customers'] = $this->model_module_animate_slider->getCustomerData();

		//Select template
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/animate_slider.tpl')) {
			$this->response->setOutput($this->load->view('module/animate_slider.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('module/animate_slider.tpl', $data));
		}

	}
}

?>