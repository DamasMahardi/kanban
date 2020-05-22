<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

class Sidewall extends REST_Controller {

    function __construct($config = 'rest') {
        parent::__construct($config);
        $this->load->database();
    }

    function index_get() {
        $id = $this->get('idsidewall');
        if ($id == '') {
            $idsidewall = $this->db->get('sidewall')->result();
        } else {
            $this->db->where('idsidewall', $id);
            $idsidewall = $this->db->get('sidewall')->result();
        }
        $this->response($idsidewall, 200);
    }

    function index_post() {
        $data = array(
                    'idsidewall'           => $this->post('idsidewall'),
                    'stock'          => $this->post('stock'),
                    'status'    => $this->post('status'),
                    'material_idmaterial'    => $this->post('material_idmaterial')
                );
        $insert = $this->db->insert('sidewall', $data);
        if ($insert) {
            $this->response($data, 200);
        } else {
            $this->response(array('status' => 'fail', 502));
        }
    }

    function index_put() {
        $id = $this->put('idsidewall');
        $data = array(
            'idsidewall'           => $this->put('idsidewall'),
            'stock'          => $this->put('stock'),
            'status'    => $this->put('status'),
            'material_idmaterial'    => $this->put('material_idmaterial')
        );
        $this->db->where('idsidewall', $id);
        $update = $this->db->update('sidewall', $data);
        if ($update) {
            $this->response($data, 200);
        } else {
            $this->response(array('status' => 'fail', 502));
        }
    }

    function index_delete() {
        $id = $this->delete('idsidewall');
        $this->db->where('idsidewall', $id);
        $delete = $this->db->delete('sidewall');
        if ($delete) {
            $this->response(array('status' => 'success'), 201);
        } else {
            $this->response(array('status' => 'fail', 502));
        }
    }

}
?>