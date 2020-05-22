<?php

	include 'conn.php';
	
	$idjlb= $_POST['idjlb'];
	$stock = $_POST['stock'];
	$status = $_POST['status'];
	$materialidmaterial= $_POST['material_idmaterial'];
	
	$connect->query("UPDATE jlb SET 
    stock='".$stock."', status='".$status."', material_idmaterial='".$materialidmaterial."' 
	WHERE idjlb=". $idjlb);

?> 