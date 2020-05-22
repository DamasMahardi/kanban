<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

class Tread extends REST_Controller {

    function __construct($config = 'rest') {
        parent::__construct($config);
        $this->load->database();
    }

    function index_get() {
        $id = $this->get('idtread');
        if ($id == '') {
            $idtread = $this->db->get('tread')->result();
        } else {
            $this->db->where('idtread', $id);
            $idtread = $this->db->get('tread')->result();
        }
        $this->response($idtread, 200);
    }

    function index_post() {
        $data = array(
                    'idtread'           => $this->post('idtread'),
                    'stock'          => $this->post('stock'),
                    'status'    => $this->post('status'),
                    'material_idmaterial'    => $this->post('material_idmaterial')
                );
        $insert = $this->db->insert('tread', $data);
        if ($insert) {
            $this->response($data, 200);
        } else {
            $this->response(array('status' => 'fail', 502));
        }
    }

    function index_put() {
        $id = $this->put('idtread');
        $data = array(
            'idtread'           => $this->put('idtread'),
            'stock'          => $this->put('stock'),
            'status'    => $this->put('status'),
            'material_idmaterial'    => $this->put('material_idmaterial')
        );
        $this->db->where('idtread', $id);
        $update = $this->db->update('tread', $data);
        if ($update) {
            $this->response($data, 200);
        } else {
            $this->response(array('status' => 'fail', 502));
        }
    }

    function index_delete() {
        $id = $this->delete('idtread');
        $this->db->where('idtread', $id);
        $delete = $this->db->delete('tread');
        if ($delete) {
            $this->response(array('status' => 'success'), 201);
        } else {
            $this->response(array('status' => 'fail', 502));
        }
    }

}
?>