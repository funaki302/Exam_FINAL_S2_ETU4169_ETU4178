<?php
require('../inc/connections.php');
session_start();

$email = $_GET['Email'];
$mdp = $_GET['Mot_de_passe'];
$login = login($email, $mdp);


if ($login === true) 
{
    $_SESSION['req_selct'] = take_id_membre($email, $mdp);
    header('location:acceuil.php');
}else if ($login === false){
    header('location:index.php?error=1');
}


?>