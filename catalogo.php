<?php
session_start();
ob_start("ob_gzhandler");

require 'librerias.php';

if (isset($_SESSION['carro'])) {
    $carro = $_SESSION['carro'];
} else {
    $carro = false;
}
$oProducto = new Producto();
?>
<html>
    <head>
        <TITLE>Librería SUDAMERICANA</TITLE>
        <META charset="UTF-8">
        <META id="_TopLeft_metaLanguage" NAME="Language" content="español - spanish"></META>
        <META id="_TopLeft_metaRobots" NAME="Robots" content="All"></META>
        <link href="css/ie.css" rel="stylesheet" type="text/css">
    </head>
    <?php
    require 'marcoSuperior.php';
    ?>

    <table width="100%" align="center" cellpadding="0" cellspacing="0" style="border: 1px solid #000000;">
        <tr valign="middle" bordercolor="#FFFFFF" bgcolor="#DFDFDF" class="catalogo"> 
            <td width="170"><strong>Codigo</strong></td>
            <td width="270"><strong>Nombre</strong></td>
            <td width="170"><strong>Categoria</strong></td>
            <td width="77"><strong>Precio</strong></td>
            <td width="457"><strong>Descripcion</strong></td>
            <td width="127"><strong>Ubicacion</strong></td>
            <td width="50"><strong>Cantidad</strong></td>
            <td width="50"><strong>Descuento</strong></td>
            <td width="80"><strong>Hasta (Descuento)</strong></td>
            <td width="25" align="right"><a href="carroCompra.php?<?php echo SID ?>" title="Ver el contenido del carrito">
                    <img src="images/vercarrito.gif" width="25" height="21" border="0"></a></td>
        </tr>
        <?php
        while ($row = $oProducto->Selecciona()) {
            ?>
            <tr valign="middle" class="catalogo">
                <td><?= $row->getNidProducto() ?></td>
                <td><?= $row->getSnombreProducto() ?></td>
                <td><?= $row->getScategoria() ?></td>
                <td><?= $row->getNprecioUnitario() ?></td>
                <td><?= $row->getSdescripcionProducto() ?></td>
                <td><?= $row->getSubicacion() ?></td>
                <td><?= $row->getNcantidad() ?></td>
                <td><?= $row->getLdescuento() ?></td>
                <td><?= $row->getDfechaTerminoDsto() ?></td>
                <td align="center">
                    <?php
                    if (!$carro || !isset($carro[md5($row->getNidProducto())]['identificador']) || $carro[md5($row->getNidProducto())]['identificador'] != md5($row->getNidProducto())) {
                        ?>
                        <a href="addCart.php?sid=<?php echo session_id() ?>&id=<?php echo $row->getNidProducto(); ?>">
                            <img src="images/productonoagregado.gif" border="0" title="Agregar al Carrito"></a><?php
                    } else {
                        ?><a href="delCart.php?sid=<?php echo session_id() ?>&id=<?php echo $row->getNidProducto(); ?>">
                            <img src="images/productoagregado.gif" border="0" title="Quitar del Carrito"></a><?php } ?></td>
            </tr><?php } ?>
    </table>

    <?php
    require 'marcoInferior.php';
    ?>

</html>

<?php
ob_end_flush();
?>