<?php
include ('../librerias.php');
//$clavemd5 = md5($_POST['clave']);
//$clavemd5 = $_POST['clave'];
$usr = new Administrador("", "", "", "", "", "", $_POST['usuario'], $_POST["clave"]);

session_start();
if ($usr->VerificaAdmin()) {
    $_SESSION["oUsuario"] = $usr;
    ?>
    <script type="text/javascript">
        alert("Buen login");
        document.location.href = "<?= PATHURL ?>index.php";
    </script>
    <?php
} else {
    ?>
    <script type="text/javascript">
        alert("Usuario o contraseña incorrectos. Favor intente nuevamente...");
        document.location.href = "<?= PATHURL ?>login.php";
    </script>

    <?php
}
?>

