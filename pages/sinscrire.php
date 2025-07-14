<?php 
session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../ass/style.css">
</head>
<body>
<form action="traitement.php" method="post">
        <?php if(isset($_GET['error'])){?>
            <p id="errors">Efa misy aih !</p>
        <?php }?>
        <p>Nom : <input type="text" name="Nom" required></p>
        <p>Email : <input type="email" name="Email" required></p>
        <p>Date de Naissance : <input type="date" name="Date_de_naissance" required></p>
        <p><input type="radio" name="genre" id="" value="M" > Masculin</p>
        <p><input type="radio" name="genre" id="" value="F" > Feminin</p>
        <p>Ville : <input type="text" name="ville" id=""></p>
        <p>Mot de passe : <input type="password" name="Mot_de_passe" required></p>
        <button type="submit">Inscription</button>
        <a href="../pages/index.php" id="deconecte">j'ai deja un compte</a>
    </form>
</body>
</html>