<?php

	include 'conn.php';
	
	$idinnerliner= $_POST['idinnerliner'];
	$stock = $_POST['stock'];
	$status = $_POST['status'];
	$materialidmaterial= $_POST['material_idmaterial'];
	
	$connect->query("UPDATE innerliner SET 
    stock='".$stock."', status='".$status."', material_idmaterial='".$materialidmaterial."' 
	WHERE idinnerliner=". $idinnerliner);

?> 