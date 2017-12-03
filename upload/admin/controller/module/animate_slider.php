<?php

class ControllerModuleAnimateSlider extends Controller {
	
	private $error = array(); 
	
	public function index() {   
	
		$this->load->language('module/animate_slider');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('extension/module');
		$this->load->model('setting/setting');
		$this->load->model('tool/image');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('animate_slider', $this->request->post);
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
		$text_strings = array(
			'heading_title',
			'button_save',
			'button_cancel',
			'button_add_module',
			'button_remove',
			'placeholder',
			'text_title',
			'text_subtitle',
			'text_link',
			'text_background',
			'text_sort',
			'text_animate',
			'text_enabled',
			'text_disabled',
		);
		
		foreach ($text_strings as $text) {
			$data[$text] = $this->language->get($text);
		}
		
 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/animate_slider', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$data['action'] = $this->url->link('module/animate_slider', 'token=' . $this->session->data['token'], 'SSL');
		
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

		$banner_list = $this->model_setting_setting->getSetting('animate_slider');

		foreach ($banner_list['animate_slider'] as $slide) {
			$data['content'][] = array(
				'title' => $slide['title'],
				'subtitle' => $slide['subtitle'],
				'link' => $slide['link'],
				'image' => $slide['image'],
				'thumb' => $this->model_tool_image->resize($slide['image'], 100, 100),
				'order' => $slide['order'],
				'animate1' => $slide['animate1'],
				'animate2' => $slide['animate2'],
				'animate3' => $slide['animate3']
			);
		}

		$data['animateionList'] = json_decode(file_get_contents(DIR_SYSTEM . 'dataJson/animationList.json', false), true);

		
		$data['modules'] = array();
		
		if (isset($this->request->post['animate_slider_status'])) {
			$data['animate_slider_status'] = $this->request->post['animate_slider_status'];
		} elseif ($this->config->get('animate_slider_status')) { 
			$data['animate_slider_status'] = $this->config->get('animate_slider_status');
		}	

		$this->load->model('design/layout');
		
		$data['layouts'] = $this->model_design_layout->getLayouts();
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/animate_slider.tpl', $data));
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/animate_slider')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}	
	}
}
?>