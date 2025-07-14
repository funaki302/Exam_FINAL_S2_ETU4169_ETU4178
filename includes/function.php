<?php
require("connexion.php");

function login($email, $mdp)
{
    $requete_select = "select id_membre from po_membre where email = '$email' and mdp = '$mdp'";
    $retour = mysqli_query(dbconnect(), $requete_select);
    $donne = mysqli_fetch_assoc($retour);
    if (mysqli_num_rows($retour) > 0) {
        return true;
    } else if (mysqli_num_rows($retour) == 0) {
        return false;
    }
}
function take_id_membre($email, $mdp)
{
    $requete_select = "select id_membre from po_membre where email = '$email' and mdp = '$mdp'";
    $retour = mysqli_query(dbconnect(), $requete_select);
    $donne = mysqli_fetch_assoc($retour);
        return $donne['id_membre'];
    
}
function set_new_member($nom, $email, $dtn, $mdp,$genre,$ville){
    $requete = "INSERT into po_membre (nom,date_naissance,genre ,email,ville,mdp) values ('$nom', '$dtn', '$genre', '$email', '$ville' ,'$mdp')";
    mysqli_query(dbconnect(), $requete);
}

function get_list_objets()
{
    $requete = "SELECT * from po_v_objet";
    $sql = mysqli_query(dbconnect(), $requete);
    $r = array();
}

?>