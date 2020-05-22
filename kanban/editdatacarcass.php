<?php

	include 'conn.php';
	
	$idcarcass= $_POST['idcarcass'];
	$stock = $_POST['stock'];
	$status = $_POST['status'];
	$materialidmaterial= $_POST['material_idmaterial'];
	
	$connect->query("UPDATE carcass SET 
    stock='".$stock."', status='".$status."', material_idmaterial='".$materialidmaterial."' 
	WHERE idcarcass=". $idcarcass);

?> 