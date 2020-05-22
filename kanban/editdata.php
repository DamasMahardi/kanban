<?php

	include 'conn.php';
	
	$idsidewall= $_POST['idsidewall'];
	$stock = $_POST['stock'];
	$status = $_POST['status'];
	$materialidmaterial= $_POST['material_idmaterial'];
	
	$connect->query("UPDATE sidewall SET 
    stock='".$stock."', status='".$status."', material_idmaterial='".$materialidmaterial."' 
	WHERE idsidewall=". $idsidewall);

?> 