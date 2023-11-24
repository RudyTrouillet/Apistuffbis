<?php


$tab_valid_page = [
  'cars',
  'brands',
   'categories'
];

if (isset($_GET['page']) && in_array($_GET['page'], $tab_valid_page))
{
  require_once '../config/db.php';
  require_once '../config/functions.php';
  header('Content-Type: application/json; charset=utf-8');
  require_once '../api/'. $_GET['page'] . '.php';
}else{
     //404
     header('HTTP/1.1 404 Not Found');
     exit;
  }
?>