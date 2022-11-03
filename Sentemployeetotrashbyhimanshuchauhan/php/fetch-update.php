<?php
$mysqli = new mysqli("localhost","root","","employeeondeletesep2022") or die("Connection Failed.");

$input = file_get_contents('php://input');
$decode = json_decode($input, true);

	if($decode['Id'])
	{
		$id = $decode["Id"];
	   
	$sql = "INSERT INTO ondeleteemployeemaster SELECT *  FROM employeemaster WHERE Id = $id;";
    $sql.= "DELETE FROM employeemaster WHERE Id = {$id}";
	 
	if($mysqli -> multi_query($sql)){
		echo json_encode(array('update' => 'success'));	
	}else{
			echo json_encode(array('update' => 'failed'));
	}

}

?>