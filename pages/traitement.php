<?php
include('../includes/function.php');
session_start();
$nom = $_POST['Nom'];
$ville = $_POST['ville'];
$email = $_POST['Email'];
$dtn = $_POST['Date_de_naissance'];
$mdp = $_POST['Mot_de_passe'];
$genre = $_POST['genre'];
$login = login($email,$mdp) ;

if ($login == true) {
    header('location:../pages/sinscrire.php?error=1');
}
else {
    set_new_member($nom,$email, $dtn, $mdp,$genre,$ville);
    $_SESSION['req_selct'] = take_id_membre($email,$mdp);
    header('location:acceuil.php');
}



?>