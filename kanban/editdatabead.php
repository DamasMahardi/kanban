<?php

	include 'conn.php';
	
	$idbead= $_POST['idbead'];
	$stock = $_POST['stock'];
	$status = $_POST['status'];
	$materialidmaterial= $_POST['material_idmaterial'];
	
	$connect->query("UPDATE bead SET 
    stock='".$stock."', status='".$status."', material_idmaterial='".$materialidmaterial."' 
	WHERE idbead=". $idbead);

?> 