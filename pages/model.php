<?php include("../includes/function.php") ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <script src="../bootstrap/js/bootstrap.bundle.min.js"></script>
</head>

<body class="bg-primary-subtle">
    <header class="navbar container">
        <ul class="nav nav-underline">
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="model.php?page=index.php">Departments</a>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled">Others</a>
            </li>
        </ul>
        <form class="d-flex" role="search" method="post" action="recherche.php">
            <button class="btn btn-outline-info" type="submit">Search</button>
        </form>
    </header>

    <?php 
        if(isset($_POST["page"])) 
        {
            $page = $_POST["page"];
            include("../pages/$page");
        }else if(isset($_GET["page"])) 
        {
            $page = $_GET["page"];
            include("../pages/$page");
        }else if(isset($_SESSION["page"])) 
        {
            $page = $_SESSION["page"];
            unset($_SESSION["page"]);
            include("../pages/$page");
        }

    ?>

</body>

</html>