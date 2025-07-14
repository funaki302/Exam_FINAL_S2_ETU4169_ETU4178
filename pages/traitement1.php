<?php
include("../includes/function.php");
session_start();

$email = $_POST['Email'];
$mdp = $_POST['Mot_de_passe'];
$login = login($email, $mdp);


if ($login == true) 
{
    $_SESSION['req_selct'] = take_id_membre($email, $mdp);
    header('location:Liste_object.php');
}else if ($login == false){
    header('location:index.php?error=1');
}


?>