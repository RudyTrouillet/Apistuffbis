<?php

function newCar($params) {
    global $pdo;
    $sluged=makeSlug($params['name']);
    $request_insert_car ="INSERT INTO cars (
                            model_id,
                            description,
                            name,
                            slug,
                            attribute_color_id
                            ) 
                           VALUES 
                           (
                           $params[model_id],
                           $params[description],
                           $params[name],
                           '".$sluged."',
                           $params[color]
                           )";
$request_insert_car = $pdo->query($request_insert_car);
}

