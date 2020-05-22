<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

class Belt extends REST_Controller {

    function __construct($config = 'rest') {
        parent::__construct($config);
        $this->load->database();
    }

    function index_get() {
        $id = $this->get('idbelt');
        if ($id == '') {
            $idbelt = $this->db->get('belt')->result();
        } else {
            $this->db->where('idbelt', $id);
            $idbelt = $this->db->get('belt')->result();
        }
        $this->response($idbelt, 200);
    }

    function index_post() {
        $data = array(
                    'idbelt'           => $this->post('idbelt'),
                    'stock'          => $this->post('stock'),
                    'status'    => $this->post('status'),
                    'material_idmaterial'    => $this->post('material_idmaterial')
                );
        $insert = $this->db->insert('belt', $data);
        if ($insert) {
            $this->response($data, 200);
        } else {
            $this->response(array('status' => 'fail', 502));
        }
    }

    function index_put() {
        $id = $this->put('idbelt');
        $data = array(
            'idbelt'           => $this->put('idbelt'),
            'stock'          => $this->put('stock'),
            'status'    => $this->put('status'),
            'material_idmaterial'    => $this->put('material_idmaterial')
        );
        $this->db->where('idbelt', $id);
        $update = $this->db->update('belt', $data);
        if ($update) {
            $this->response($data, 200);
        } else {
            $this->response(array('status' => 'fail', 502));
        }
    }

    function index_delete() {
        $id = $this->delete('idbelt');
        $this->db->where('idbelt', $id);
        $delete = $this->db->delete('belt');
        if ($delete) {
            $this->response(array('status' => 'success'), 201);
        } else {
            $this->response(array('status' => 'fail', 502));
        }
    }

}
?>