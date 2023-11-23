<html>
<head>
  <title>Bagnoles</title>
<h1>Vroom Vroom</h1>

<body> <img src="  https://images.caradisiac.com/logos/8/5/0/1/158501/S6-Saucisse-du-vendredi-Aixam-bosozoku-71966.jpg" alt="ça va vite" width="400" height="300"> 
</body>
</head>

<?php


$tab_valid_page = [
  'cars',
  'brands',
   'categories'
];

if (isset($_GET['page']) && in_array($_GET['page'], $tab_valid_page))
{
  require_once '../api/'. $_GET['page'] . '.php';
}
?>