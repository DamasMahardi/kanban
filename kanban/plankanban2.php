<?php
include 'conn.php';
$tanggal= $_GET['tanggal'];
$group_shift_idgroup_shift= $_GET['group_shift_idgroup_shift'];
$sql= $conn-> query($conn,"SELECT * FROM plan_produksi WHERE tanggal='$tanggal' or group_shift_idgroup_shift= '$group_shift_idgroup_shift'");
$data=$sql->fetch_assoc();
echo json_encode($data);
mysqli_close($conn);


?>
