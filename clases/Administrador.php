<?php
/**
 * Description of Administrador
 *
 * @author Jonathan Espinoza
 */
class Administrador {
    
    private $srun;
    private $snombre;
    private $apellidos;
    private $csexo;
    private $dfechanacimiento;
    private $semail;
    private $snomusuario;
    private $spass;
    
    function __construct($srun, $snombre, $apellidos, $csexo, $dfechanacimiento, $semail, $snomusuario, $spass) {
        $this->srun = $srun;
        $this->snombre = $snombre;
        $this->apellidos = $apellidos;
        $this->csexo = $csexo;
        $this->dfechanacimiento = $dfechanacimiento;
        $this->semail = $semail;
        $this->snomusuario = $snomusuario;
        $this->spass = $spass;
    }

    function getSrun() {
        return $this->srun;
    }

    function getSnombre() {
        return $this->snombre;
    }

    function getApellidos() {
        return $this->apellidos;
    }

    function getCsexo() {
        return $this->csexo;
    }

    function getDfechanacimiento() {
        return $this->dfechanacimiento;
    }

    function getSemail() {
        return $this->semail;
    }

    function getSnomusuario() {
        return $this->snomusuario;
    }

    function getSpass() {
        return $this->spass;
    }

    function setSrun($srun) {
        $this->srun = $srun;
    }

    function setSnombre($snombre) {
        $this->snombre = $snombre;
    }

    function setApellidos($apellidos) {
        $this->apellidos = $apellidos;
    }

    function setCsexo($csexo) {
        $this->csexo = $csexo;
    }

    function setDfechanacimiento($dfechanacimiento) {
        $this->dfechanacimiento = $dfechanacimiento;
    }

    function setSemail($semail) {
        $this->semail = $semail;
    }

    function setSnomusuario($snomusuario) {
        $this->snomusuario = $snomusuario;
    }

    function setSpass($spass) {
        $this->spass = $spass;
    }
    
    function VerificaAdmin() { //READ DEL CRUD!
        $db = dbconnect();
        /* Definición del query que permitira ingresar un nuevo registro */
        $sqlsel = "select runUsuario,nombre,apellido,sexo,fechanacimiento,email,userName,pass from administrador
		where userName=:userName and pass=:pass";
        /* Preparación SQL */
        $querysel = $db->prepare($sqlsel);
        /* Asignación de parametros utilizando bindparam */
        $querysel->bindParam(':userName', $this->snomusuario);
        $querysel->bindParam(':pass', $this->spass);


        $datos = $querysel->execute();

        if ($querysel->rowcount() == 1) {
            $registro = $querysel->fetch();            
            $this->srun = $registro['runUsuario'];
            $this->snombre = $registro['nombre'];
            $this->apellidos = $registro['apellido'];
            $this->csexo = $registro['sexo'];
            $this->dfechanacimiento = $registro['fechanacimiento'];
            $this->semail = $registro['email'];
            $this->snomusuario = $registro['userName'];
            $this->spass = $registro['pass'];
            return true;
        } else {
            return false;
        }
    }
}
