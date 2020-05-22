<?php

	include 'conn.php';
	
	$idbelt= $_POST['idbelt'];
	$stock = $_POST['stock'];
	$status = $_POST['status'];
	$materialidmaterial= $_POST['material_idmaterial'];
	
	$connect->query("UPDATE belt SET 
    stock='".$stock."', status='".$status."', material_idmaterial='".$materialidmaterial."' 
	WHERE idbelt=". $idbelt);

?> 