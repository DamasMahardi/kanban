<?php   
include 'conn.php';
$queryResult= $connect->query("select plan_produksi.spectire_idspectire,spectire.nama_tire,plan_produksi.tanggal,plan_produksi.shift_idshift,
plan_produksi.group_shift_idgroup_shift,material.idmaterial,material.nama_material
from spectire join plan_produksi on plan_produksi.spectire_idspectire=spectire.idspectire 
join shift  on shift.idshift=plan_produksi.shift_idshift
join group_shift on group_shift.idgroup_shift=plan_produksi.group_shift_idgroup_shift
join material on material.spectire_idspectire=spectire.idspectire ; ");
$result=array();
while($fetchData=$queryResult->fetch_assoc()){
        $result[]=$fetchData;
}
echo json_encode($result);
?>