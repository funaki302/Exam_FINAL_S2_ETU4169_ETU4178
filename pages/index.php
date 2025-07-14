<?php 

session_start();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../ass/style1.css">
</head>

<body>
    <form action="traitement.php" method="post">
        <?php if(isset($_GET['error'])){?>
            <p id="errors"> Ano mbola tsy inscrit ngia ! </p>
        <?php }?>
        <p>Email : <input type="email" name="Email" required></p>
        <p>Mot de passe : <input type="password" name="Mot_de_passe" required></p>
        <button><input type="submit" value="Se connecter"></button>
        <p> Si vous n'avez pas encore de compte <br> <a href="sinscrire.php" id="creation">Creer un compte</a></p>
    </form>
</body>

</html>