
<?php

//koneksi ke database
  include "conn.php";

//proses client request(VIA URL)
  header("Content-Type:application/json");

if(!empty($_GET['materialidmaterial'])){
  //Ambil data name dari URL
  $materialidmaterial=$_GET['materialidmaterial'];

//cek ke database
  $res = $mysqli->query("SELECT * FROM sidewall WHERE materialidmaterial = '".$materialidmaterial."'");

//cek jika data di temukan di database
  if($res->num_rows>0){

$row= $res->fetch_array();

//tampilkan dalam bentuk array
  $data=array('materialidmaterial'=>$row['materialidmaterial'],
  'Status'=>$row['status'],
  'stok'=>$row['stock']
  );

//panggil fungsi respon
  deliver_response(200,"Contact Found", $data);
  }

else {
  //panggil fungsi respon
  deliver_response(200,"Contact Not Found", NULL);
  }

}

else{
  //panggil fungsi respon
  deliver_response(400,"Invalid Request", NULL);
  }

//fungsi respon
  function deliver_response($status, $status_message, $data){
  header("HTTP/1.1 $status $status_message");

//array
  $response['status']=$status;
  $response['status_message']=$status_message;
  $response['data']=$data;

$json_response=json_encode($response);
  echo $json_response;
  }

?>