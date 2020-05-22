<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

class Innerliner extends REST_Controller {

    function __construct($config = 'rest') {
        parent::__construct($config);
        $this->load->database();
    }

    function index_get() {
        $id = $this->get('idinnerliner');
        if ($id == '') {
            $idinnerliner = $this->db->get('innerliner')->result();
        } else {
            $this->db->where('idinnerliner', $id);
            $idinnerliner = $this->db->get('innerliner')->result();
        }
        $this->response($idinnerliner, 200);
    }

    function index_post() {
        $data = array(
                    'idinnerliner'           => $this->post('idinnerliner'),
                    'stock'          => $this->post('stock'),
                    'status'    => $this->post('status'),
                    'material_idmaterial'    => $this->post('material_idmaterial')
                );
        $insert = $this->db->insert('innerliner', $data);
        if ($insert) {
            $this->response($data, 200);
        } else {
            $this->response(array('status' => 'fail', 502));
        }
    }

    function index_put() {
        $id = $this->put('idinnerliner');
        $data = array(
            'idinnerliner'           => $this->put('idinnerliner'),
            'stock'          => $this->put('stock'),
            'status'    => $this->put('status'),
            'material_idmaterial'    => $this->put('material_idmaterial')
        );
        $this->db->where('idinnerliner', $id);
        $update = $this->db->update('innerliner', $data);
        if ($update) {
            $this->response($data, 200);
        } else {
            $this->response(array('status' => 'fail', 502));
        }
    }

    function index_delete() {
        $id = $this->delete('idinnerliner');
        $this->db->where('idinnerliner', $id);
        $delete = $this->db->delete('innerliner');
        if ($delete) {
            $this->response(array('status' => 'success'), 201);
        } else {
            $this->response(array('status' => 'fail', 502));
        }
    }

}
?>