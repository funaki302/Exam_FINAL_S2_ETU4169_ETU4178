<?php
include('../includes/function.php');
$object = get_list_objets();
?>
<br><br>
<main class="container-fluid">
    <?php
    if (isset($_GET['error'])) {
        if ($_GET['error'] === 'date_anterieure') {
            echo "<div style='color: red; text-align: center;'>Erreur : La date choisie est anterieure à la date de debut de l'ancien manager.</div>";
        }
    }
    ?>
    <table border="1">
        <tr class="table-secondary">
            <th>Nom</th>
            <th>Categorie</th>
        </tr>
        <?php foreach($object as $d){?>
        <tr>
            <th><?= $d['nom_objet'] ?></th>
            <th><?= $d ['nom_categorie']  ?></th>
        </tr>
        <?php }?>
    </table>
</main>
</body>
</html>