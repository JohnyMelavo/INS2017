<?php
include 'db_constantes.php';
function dbconnect(){
	$db=new PDO(MYSQL_SERVER.";".MYSQL_DB,MYSQL_USER,MYSQL_PASS);
	$db->setAttribute(PDO::MYSQL_ATTR_USE_BUFFERED_QUERY, true);
	$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	return $db;
}

//require_once("lib/nusoap.php");

//$oSoapClient = new soapclient('http://192.168.44.37:9091/ws/user?wsdl', true);

//$aParametros = array("rut" => "13234545-5");
//$aParametros = "13234545-5";
    
//$aRespuesta = $oSoapClient->call("find", $aParametros);    


?>
