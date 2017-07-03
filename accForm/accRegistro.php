<?php
include ('../librerias.php');
$usr = new Cliente();
$srun = $_POST['run'];
$snombre = $_POST['nombre'];
$apellidos = $_POST['apellidos'];
$ssexo = $_POST['sexo'];
$dfechanacimiento = $_POST['fecha'];
$semail = $_POST['email'];
$nTelefono = $_POST['telefono'];
$bSuscripcion = $_POST['suscripcion'];
$spass = md5($_POST['contraseña']);
$usr->CreaCliente($srun, $snombre, $apellidos, $ssexo, $dfechanacimiento, $semail, $nTelefono, $bSuscripcion, $spass);
        
?>
<script>
    document.location.href = "<?= PATHURL ?>catalogo.php";
</script>

