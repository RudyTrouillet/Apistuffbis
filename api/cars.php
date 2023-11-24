<?php

$func = ['getALl',false];

if(isset($_GET['slug']) && !empty($_GET['slug']))
{  
    $func = ['getBySlug', strtolower(htmlentities(htmlspecialchars($_GET['slug'])))];
}

if(isset($_GET['brand']) && !empty($_GET['brand']))
{
    $func = ['getByBrand', strtolower(htmlentities(htmlspecialchars($_GET['brand'])))];
}

if(isset($_POST['action']) && $_POST['action']== 'CREATE')
{
    $func = ['newCar',$_POST];
}

require_once '../funcs/cars/'. $func[0] .'.php';
echo(json_encode($func[0]($func[1])));
