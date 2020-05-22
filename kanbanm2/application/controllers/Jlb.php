<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

class Jlb extends REST_Controller {

    function __construct($config = 'rest') {
        parent::__construct($config);
        $this->load->database();
    }

    function index_get() {
        $id = $this->get('idjlb');
        if ($id == '') {
            $idjlb = $this->db->get('jlb')->result();
        } else {
            $this->db->where('idjlb', $id);
            $idjlb = $this->db->get('jlb')->result();
        }
        $this->response($idjlb, 200);
    }

    function index_post() {
        $data = array(
                    'idjlb'           => $this->post('idjlb'),
                    'stock'          => $this->post('stock'),
                    'status'    => $this->post('status'),
                    'material_idmaterial'    => $this->post('material_idmaterial')
                );
        $insert = $this->db->insert('jlb', $data);
        if ($insert) {
            $this->response($data, 200);
        } else {
            $this->response(array('status' => 'fail', 502));
        }
    }

    function index_put() {
        $id = $this->put('idjlb');
        $data = array(
            'idjlb'           => $this->put('idjlb'),
            'stock'          => $this->put('stock'),
            'status'    => $this->put('status'),
            'material_idmaterial'    => $this->put('material_idmaterial')
        );
        $this->db->where('idjlb', $id);
        $update = $this->db->update('jlb', $data);
        if ($update) {
            $this->response($data, 200);
        } else {
            $this->response(array('status' => 'fail', 502));
        }
    }

    function index_delete() {
        $id = $this->delete('idjlb');
        $this->db->where('idjlb', $id);
        $delete = $this->db->delete('jlb');
        if ($delete) {
            $this->response(array('status' => 'success'), 201);
        } else {
            $this->response(array('status' => 'fail', 502));
        }
    }

}
?>