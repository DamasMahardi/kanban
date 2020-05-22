<?php

	include 'conn.php';
	
	
	$stock = $_POST['stock'];
	$status = $_POST['status'];
	$materialidmaterial= $_POST['material_idmaterial'];
	
	$connect->query("INSERT INTO sidewall (stock,status,material_idmaterial) 
	VALUES ('".$stock."','".$status."','".$materialidmaterial."')");

?>