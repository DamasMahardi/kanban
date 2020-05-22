<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

class Carcass extends REST_Controller {

    function __construct($config = 'rest') {
        parent::__construct($config);
        $this->load->database();
    }

    function index_get() {
        $id = $this->get('idcarcass');
        if ($id == '') {
            $idcarcass = $this->db->get('carcass')->result();
        } else {
            $this->db->where('idcarcass', $id);
            $idcarcass = $this->db->get('carcass')->result();
        }
        $this->response($idcarcass, 200);
    }

    function index_post() {
        $data = array(
                    'idcarcass'           => $this->post('idcarcass'),
                    'stock'          => $this->post('stock'),
                    'status'    => $this->post('status'),
                    'material_idmaterial'    => $this->post('material_idmaterial')
                );
        $insert = $this->db->insert('carcass', $data);
        if ($insert) {
            $this->response($data, 200);
        } else {
            $this->response(array('status' => 'fail', 502));
        }
    }

    function index_put() {
        $id = $this->put('idcarcass');
        $data = array(
            'idcarcass'           => $this->put('idcarcass'),
            'stock'          => $this->put('stock'),
            'status'    => $this->put('status'),
            'material_idmaterial'    => $this->put('material_idmaterial')
        );
        $this->db->where('idcarcass', $id);
        $update = $this->db->update('carcass', $data);
        if ($update) {
            $this->response($data, 200);
        } else {
            $this->response(array('status' => 'fail', 502));
        }
    }

    function index_delete() {
        $id = $this->delete('idcarcass');
        $this->db->where('idcarcass', $id);
        $delete = $this->db->delete('carcass');
        if ($delete) {
            $this->response(array('status' => 'success'), 201);
        } else {
            $this->response(array('status' => 'fail', 502));
        }
    }

}
?>